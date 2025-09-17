package com.kepco.app.domain.accesslog.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.accesslog.dto.AccessLog;
import com.kepco.app.domain.accesslog.service.AccessLogService;

@RequestMapping("/api/sys/accesslog")
@RestController
public class AccessLogSysApi {

    private final AccessLogService accessLogService;

    private final ObjectMapper objectMapper;

    protected final EgovPropertyService propertiesService;

    public AccessLogSysApi(AccessLogService accessLogService, ObjectMapper objectMapper, EgovPropertyService propertiesService) {
        this.accessLogService = accessLogService;
        this.objectMapper = objectMapper;
        this.propertiesService = propertiesService;
    }

    /**
     * 로그인로그 목록 정보를 조회한다.
     * @param reqMap
     * @return
     */
    @GetMapping("/list")
    public ResponseEntity apiAccessLogList(@RequestParam Map<String, Object> reqMap) {
        Map<String, Object> searchMap = new HashMap<>();
        String[] columns = {"USER_NM", "MENU_NM", "URL", "CLIENT_IP", "LOG_DT"};

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

        List<Map<String, Object>> AccessLogList = accessLogService.selectAccessLogList(searchMap);
        int filterTotCnt = accessLogService.selectAccessLogListTotCnt(searchMap);
        searchMap.put("maxDate", "");
        searchMap.put("minDate", "");
        searchMap.put("searchKeyword", "");
        int totCnt = accessLogService.selectAccessLogListTotCnt(searchMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", AccessLogList);
        resultMap.put("draw", Integer.parseInt((String) reqMap.get("draw")));
        resultMap.put("recordsTotal", totCnt);
        resultMap.put("recordsFiltered", filterTotCnt);

        return CommonResponse.success(resultMap);
    }

}
