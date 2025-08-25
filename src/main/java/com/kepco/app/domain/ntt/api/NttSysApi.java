package com.kepco.app.domain.ntt.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.ntt.dto.InsertSysNtt;
import com.kepco.app.domain.ntt.dto.SearchSysNtt;
import com.kepco.app.domain.ntt.dto.SysNtt;
import com.kepco.app.domain.ntt.dto.UpdateSysNtt;
import com.kepco.app.domain.ntt.service.NttSysService;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시글을 관리하기 위한 API 클래스
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Slf4j
@RestController
@RequestMapping("/api/sys/ntt")
public class NttSysApi {
    private final NttSysService nttSysService;
    private final EgovPropertyService propertiesService;
    private final ModelMapper modelMapper;
    private final ObjectMapper objectMapper;

    public NttSysApi(NttSysService nttSysService, EgovPropertyService propertiesService, ModelMapper modelMapper, ObjectMapper objectMapper) {
        this.nttSysService = nttSysService;
        this.propertiesService = propertiesService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
    }

    /**
     * 게시글을 등록한다.
     *
     * @param insertNtt 게시글 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysSaveNtt(@Valid InsertSysNtt insertNtt) throws FdlException {
        SysNtt ntt = modelMapper.map(insertNtt, SysNtt.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        ntt.setFrstRegisterId(UserDetailsUtil.getMbrId());
        ntt.setWrterNm(loginVO.getMbrNm());
        nttSysService.insertNtt(ntt);
        return CommonResponse.empty();
    }

    /**
     * 게시글을 수정한다.
     *
     * @param updateNtt 게시글 수정 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/update")
    public ResponseEntity apiSysUpdateNtt(@Valid UpdateSysNtt updateNtt) throws FdlException {
        SysNtt ntt = modelMapper.map(updateNtt, SysNtt.class);
        ntt.setLastUpdusrId(UserDetailsUtil.getMbrId());
        nttSysService.updateNtt(ntt);
        return CommonResponse.empty();
    }

    /**
     * 게시글을 삭제한다.
     *
     * @param nttId 삭제할 게시글 ID
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysDeleteNtt(@RequestBody Map<String, Object> paramMap){
        String nttId = paramMap.get("nttId").toString();
        nttSysService.deleteNtt(nttId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("nttId", nttId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 게시글 목록을 조회한다.
     *
     * @param reqMap 조회할 정보가 담긴 Map
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity apiSysSelectNttList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"A.NTT_ID", "A.NTT_SJ", "A.WRTER_NM", "FRST_REGIST_DT", "B.REPLY_AT, PARNTSCTT_ID", "A.USE_AT"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
        searchMap.put("searchKeyword", reqMap.get("search[value]"));
        int start = Integer.parseInt((String) reqMap.get("start"));
        int length = Integer.parseInt((String) reqMap.get("length"));
        searchMap.put("pageIndex", (start / length) + 1);
        searchMap.put("pageUnit", reqMap.get("length"));
        searchMap.put("bbsId", reqMap.get("bbsId"));

        if (reqMap.get("order[0][column]") != null && !reqMap.get("order[0][column]").equals("")) {
            searchMap.put("orderColumn", columns[Integer.parseInt((String) reqMap.get("order[0][column]"))]);
        } else {
            searchMap.put("orderColumn", "");
        }
        searchMap.put("ascDesc", reqMap.get("order[0][dir]"));

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> nttList = nttSysService.selectNttList(searchMap);
        int filterTotCnt = nttSysService.selectNttListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        searchMap.put("bbsId", "");
        int totCnt = nttSysService.selectNttListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", nttList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }


    /**
     * 게시글 상세 정보를 조회한다.
     *
     * @param nttId 게시글 ID
     * @return 상세 정보
     */
    @GetMapping("/detail")
    public ResponseEntity apiSysSelectNttDetail(@RequestParam String nttId) {
        return CommonResponse.success(nttSysService.selectNttDetail(nttId));
    }

    @PostMapping("/updateReport")
    public ResponseEntity apiUpdateReportIds(@RequestBody Map<String, Object> paramMap){
        String nttId = paramMap.get("nttId").toString();
        nttSysService.updateNttReportIds(nttId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("nttId", nttId);

        return CommonResponse.success(resultMap);
    }
}
