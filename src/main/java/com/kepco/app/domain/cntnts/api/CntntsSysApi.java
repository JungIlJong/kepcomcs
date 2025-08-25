package com.kepco.app.domain.cntnts.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.cntnts.dto.Content;
import com.kepco.app.domain.cntnts.dto.InsertContent;
import com.kepco.app.domain.cntnts.dto.SearchCntnts;
import com.kepco.app.domain.cntnts.dto.UpdateContent;
import com.kepco.app.domain.cntnts.service.ContentSysService;
import com.kepco.app.domain.mbr.dto.Mbr;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 콘텐츠를 조회하기 위한 API 클래스
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
@RequestMapping("/api/sys/cntnts")
public class CntntsSysApi {

    private final ContentSysService contentSysService;
    private final EgovPropertyService propertiesService;
    private final ModelMapper modelMapper;
    private final ObjectMapper objectMapper;

    public CntntsSysApi(ContentSysService contentSysService, EgovPropertyService propertiesService, ModelMapper modelMapper, ObjectMapper objectMapper) {
        this.contentSysService = contentSysService;
        this.propertiesService = propertiesService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
    }

    /**
     * 콘텐츠를 생성한다.
     *
     * @param insertContent 콘텐츠 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysContentSave(@Valid @RequestBody InsertContent insertContent) throws FdlException {
        Content content = modelMapper.map(insertContent, Content.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        content.setFrstRegisterId(String.valueOf(loginVO.getMbrId()));
        contentSysService.insertCntnts(content);

        Map<String, Object> result = new HashMap<>();
        result.put("data", insertContent.getCntntsNm());
        return CommonResponse.success(result);
    }

    /**
     * 콘텐츠를 수정한다.
     *
     * @param updateContent 콘텐츠 수정 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/update")
    public ResponseEntity apiSysContentUpdate(@Valid @RequestBody UpdateContent updateContent) throws FdlException {
        Content content = modelMapper.map(updateContent, Content.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        content.setLastUpdusrId(String.valueOf(loginVO.getMbrId()));
        contentSysService.updateCntnts(content);

        Map<String, Object> result = new HashMap<>();
        result.put("data", updateContent.getCntntsNm());
        return CommonResponse.success(result);
    }

    /**
     * 콘텐츠 상세정보를 조회한다.
     *
     * @param cntntsId 콘텐츠 ID
     * @return 콘텐츠 상세 정보
     */
    @GetMapping("/detail")
    public ResponseEntity apiSysContentDetail(@RequestParam String cntntsId) {
        return CommonResponse.success(contentSysService.selectContentDetail(cntntsId));
    }

    /**
     * 콘텐츠를 삭제한다.
     *
     * @param paramMap 삭제할 콘텐츠 ID
     * @return
     * @throws FdlException
     * @throws IOException
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysContentDelete(@RequestBody Map<String, Object> paramMap) throws FdlException, IOException {
        String cntntsId = paramMap.get("cntntsId").toString();

        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        contentSysService.deleteById(cntntsId, String.valueOf(loginVO.getMbrId()));
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("cntntsId", cntntsId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 콘텐츠 목록을 조회한다.
     *
     * @param reqMap 조회할 정보가 담긴 DTO
     * @return 콘텐츠 목록 정보
     */
    @GetMapping("/list")
    public ResponseEntity apiSysContentList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"A.CNTNTS_ID", "A.CNTNTS_NM", "B.ID", "A.FRST_REGIST_DT"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
        searchMap.put("searchKeyword", reqMap.get("search[value]"));
        int start = Integer.parseInt((String) reqMap.get("start"));
        int length = Integer.parseInt((String) reqMap.get("length"));
        searchMap.put("pageIndex", (start / length) + 1);
        searchMap.put("pageUnit", reqMap.get("length"));
        if (reqMap.get("order[0][column]") != null && !reqMap.get("order[0][column]").equals("")) {
            searchMap.put("orderColumn", columns[Integer.parseInt((String) reqMap.get("order[0][column]"))]);
        } else {
            searchMap.put("orderColumn", "");
        }
        searchMap.put("ascDesc", reqMap.get("order[0][dir]"));

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> cntntsList = contentSysService.selectContentList(searchMap);
        int filterTotCnt = contentSysService.selectContentTonCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = contentSysService.selectContentTonCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", cntntsList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }
}
