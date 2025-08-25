package com.kepco.app.domain.cntnts.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.cntnts.dto.SearchCntntsHist;
import com.kepco.app.domain.cntnts.service.CntntsHistSysService;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 콘텐츠 이력을 조회하기 위한 API 클래스
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
@RequestMapping("/api/sys/**/cntntshist")
public class CntntsHistSysApi {

    private final CntntsHistSysService cntntsHistSysService;
    private final EgovPropertyService propertiesService;
    private final ObjectMapper objectMapper;

    public CntntsHistSysApi(CntntsHistSysService cntntsHistSysService, EgovPropertyService propertiesService, ObjectMapper objectMapper) {
        this.cntntsHistSysService = cntntsHistSysService;
        this.propertiesService = propertiesService;
        this.objectMapper = objectMapper;
    }

    /**
     * 콘텐츠 이력 목록을 조회한다.
     *
     * @param reqMap 조회할 정보가 담긴 DTO
     * @return 조회 결과
     */
    @GetMapping("/list")
    public ResponseEntity list(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"A.CNTNTS_HIST_ID", "A.CNTNTS_ID", "HIST_SE_CODE", "B.ID", "A.LAST_UPDT_DT"};

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

        List<Map<String, Object>> cntntsList = cntntsHistSysService.selectCntntsHistList(searchMap);
        int filterTotCnt = cntntsHistSysService.selectCntntsHistTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = cntntsHistSysService.selectCntntsHistTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", cntntsList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }
}
