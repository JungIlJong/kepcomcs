package com.kepco.app.domain.bbs.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.bbs.dto.InsertSysBbs;
import com.kepco.app.domain.bbs.dto.SearchBbs;
import com.kepco.app.domain.bbs.dto.SysBbs;
import com.kepco.app.domain.bbs.dto.UpdateSysBbs;
import com.kepco.app.domain.bbs.service.BbsRoleSysService;
import com.kepco.app.domain.bbs.service.BbsSysService;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판을 관리하기 위한 API 클래스
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
@Validated
@RestController
@RequestMapping("/api/sys/bbs")
public class BbsSysApi {
    private final BbsSysService bbsSysService;
    private final BbsRoleSysService bbsRoleSysService;
    private final EgovPropertyService propertiesService;
    private final ModelMapper modelMapper;
    private final ObjectMapper objectMapper;

    public BbsSysApi(BbsSysService bbsSysService, BbsRoleSysService bbsRoleSysService, EgovPropertyService propertiesService, ModelMapper modelMapper, ObjectMapper objectMapper) {
        this.bbsSysService = bbsSysService;
        this.bbsRoleSysService = bbsRoleSysService;
        this.propertiesService = propertiesService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
    }

    /**
     * 게시판을 생성한다.
     *
     * @param insertBbs 게시판 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysInsertBbs(@Valid @RequestBody InsertSysBbs insertBbs, HttpServletRequest request) throws FdlException {
        SysBbs bbs = modelMapper.map(insertBbs, SysBbs.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        bbs.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        bbsSysService.insertBbs(bbs);
        return CommonResponse.success(bbs);
    }

    /**
     * 게시판을 수정한다.
     *
     * @param updateBbs 게시판 수정 DTO
     * @return
     */
    @PostMapping("/update")
    public ResponseEntity apiSysUpdateBbs(@Valid @RequestBody UpdateSysBbs updateBbs) {
        SysBbs bbs = modelMapper.map(updateBbs, SysBbs.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        bbs.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        bbsSysService.updateBbs(bbs);
        return CommonResponse.success(bbs);
    }

    /**
     * 게시판을 삭제한다.
     *
     * @param bbsId 삭제할 게시판 ID
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysDeleteBbs(@RequestBody Map<String, Object> paramMap) throws IOException {
        String bbsId = (String) paramMap.get("bbsId");
        bbsSysService.deleteBbsById(bbsId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("bbsId", bbsId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 게시판 목록을 조회한다.
     *
     * @param searchDto 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity apiSysSelectBbsList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"BBS_ID", "BBS_TY_CODE", "BBS_NM", "FRST_REGIST_DT", "USE_AT", ""};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
        searchMap.put("bbsTyCode", reqMap.get("bbsTyCode"));
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

        List<Map<String, Object>> bbsList = bbsSysService.selectBbsList(searchMap);
        int filterTotCnt = bbsSysService.selectBbsListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("bbsTyCode", "");
        searchMap.put("searchKeyword", "");
        int totCnt = bbsSysService.selectBbsListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", bbsList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    /**
     * 게시판 상세정보를 조회한다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판 상세정보 및 게시판 권한
     */
    @GetMapping("/detail")
    public ResponseEntity apiSysSelectBbsDetail(@RequestParam String bbsId) {
        Map<String, Object> result = new HashMap<>();
        result.put("data", bbsSysService.selectBbsDetail(bbsId));
        result.put("roles", bbsRoleSysService.selectBbsRole(bbsId));
        return CommonResponse.success(result);
    }

    /**
     * 회원 권한에 따른 게시판 정보를 가져온다.
     *
     * @param bbsId 조회할 게시판 ID
     * @return 게시판 상세정보
     */
    @GetMapping("/info")
    public ResponseEntity apiSysSelectBbsPermissionInfo(@RequestParam String bbsId) {
        return CommonResponse.success(bbsSysService.selectBbsPermissionInfo(bbsId));
    }

    /**
     * 모든 권한 목록을 조회한다.
     *
     * @return 권한 리스트
     */
    @GetMapping("/role/all")
    public ResponseEntity selectRoleListAll() {
        return CommonResponse.success(bbsRoleSysService.selectRoleListAll());
    }

    @GetMapping("/all")
    public ResponseEntity selectAllEnabled() {
        return CommonResponse.success(bbsSysService.selectAllEnabled());
    }
}
