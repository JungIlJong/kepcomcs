package com.kepco.app.domain.popup.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.popup.dto.InsertSysPopup;
import com.kepco.app.domain.popup.dto.SearchSysPopup;
import com.kepco.app.domain.popup.dto.SysPopup;
import com.kepco.app.domain.popup.dto.UpdateSysPopUp;
import com.kepco.app.domain.popup.service.PopupSysService;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 팝업을 관리하기 위한 API 클래스
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
@RequestMapping("/api/sys/popup")
public class PopupSysApi {

    private final PopupSysService popupSysService;
    private final EgovPropertyService propertiesService;
    private final ModelMapper modelMapper;
    private final ObjectMapper objectMapper;

    public PopupSysApi(PopupSysService popupSysService, EgovPropertyService propertiesService, ModelMapper modelMapper, ObjectMapper objectMapper) {
        this.popupSysService = popupSysService;
        this.propertiesService = propertiesService;
        this.modelMapper = modelMapper;
        this.objectMapper = objectMapper;
    }

    /**
     * 팝업을 등록한다.
     *
     * @param insertPopup 팝업 생성 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/save")
    public ResponseEntity apiSysPopupInsert(@Valid @ModelAttribute InsertSysPopup insertPopup) throws FdlException {
        SysPopup popup = modelMapper.map(insertPopup, SysPopup.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        popup.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        popupSysService.insertPopup(popup);
        return CommonResponse.empty();
    }

    /**
     * 팝업을 수정한다.
     *
     * @param updatePopUp 팝업 수정 DTO
     * @return
     * @throws FdlException
     */
    @PostMapping("/update")
    public ResponseEntity apiSysPopupUpdate(@Valid UpdateSysPopUp updatePopUp) throws FdlException {
        SysPopup popup = modelMapper.map(updatePopUp, SysPopup.class);
        LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
        popup.setFrstRegisterId(String.valueOf(loginVO.getFrstRgtrId()));
        popupSysService.updatePopup(popup);
        return CommonResponse.empty();
    }

    /**
     * 팝업을 삭제한다.
     *
     * @param paramMap 삭제할 팝업 ID
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity apiSysPopupDelete(@RequestBody Map<String, Object> paramMap) {
        String popupId = (String) paramMap.get("popupId");
        popupSysService.deletePopup(popupId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("popupId", popupId);

        return CommonResponse.success(resultMap);
    }

    /**
     * 팝업 목록을 조회한다.
     *
     * @param reqMap 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity apiSysSelectPopupList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"POPUP_ID", "POPUP_NM", "NTCE_BGNDE", "", "SORT_ORDR", "FRST_REGIST_DT"};

        searchMap.put("maxDate", reqMap.get("maxDate"));
        searchMap.put("minDate", reqMap.get("minDate"));
        searchMap.put("ntceAt", reqMap.get("ntceAt"));
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

        List<Map<String, Object>> popupList = popupSysService.selectPopupList(searchMap);
        int filterTotCnt = popupSysService.selectPopupListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("ntceAt", "");
        searchMap.put("searchKeyword", "");
        int totCnt = popupSysService.selectPopupListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", popupList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

    /**
     * 팝업 상세 정보를 조회한다.
     *
     * @param popupId 팝업 ID
     * @return 팝업 상세 정보
     */
    @GetMapping("/detail")
    public  ResponseEntity apiSysPopupDetail(@RequestParam @Size(max = 20) String popupId) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap = popupSysService.selectPopupDetail(popupId);
        return CommonResponse.success(resultMap);
    }

    /**
     * 게시 중인 팝업 개수를 조회한다.
     *
     * @return 게시 상태(Y)인 팝업 개수
     */
    @GetMapping("/active-count")
    public ResponseEntity apiSysSelectActivePopupCount() {
        int activeCount = popupSysService.selectActivePopupCount();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("count", activeCount);
        return CommonResponse.success(resultMap);
    }
}
