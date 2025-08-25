package com.daonplace.vasanta.domain.report.api;

import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.domain.report.dto.ResetReportRequest;
import com.daonplace.vasanta.domain.report.dto.SearchReportRequest;
import com.daonplace.vasanta.domain.report.dto.AnswerReportDetailResponse;
import com.daonplace.vasanta.domain.report.dto.NttReportDetailResponse;
import com.daonplace.vasanta.domain.report.dto.MbrReportDetailResponse;
import com.daonplace.vasanta.domain.report.service.ReportSysService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/reports")
public class ReportSysApi {
    private final ReportSysService reportSysService;

    @GetMapping
    public ResponseEntity<?> search(SearchReportRequest searchReportRequest) {
        Map<String, Object> result = new HashMap<>();
        PaginationInfo paginationInfo = SearchUtil.init(searchReportRequest);
        result.put("data", reportSysService.searchReportList(searchReportRequest));
        paginationInfo.setTotalRecordCount(reportSysService.searchReportTotCnt(searchReportRequest));
        result.put("paginationInfo", paginationInfo);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/answer/{reportId}")
    public ResponseEntity<AnswerReportDetailResponse> getAnswerReportDetail(@PathVariable Long reportId) {
        return ResponseEntity.ok(reportSysService.getAnswerReportDetail(reportId));
    }

    @GetMapping("/ntt/{reportId}")
    public ResponseEntity<NttReportDetailResponse> getNttReportDetail(@PathVariable Long reportId) {
        return ResponseEntity.ok(reportSysService.getNttReportDetail(reportId));
    }

    @GetMapping("/mbr/{reportId}")
    public ResponseEntity<MbrReportDetailResponse> getMbrReportDetail(@PathVariable Long reportId) {
        return ResponseEntity.ok(reportSysService.getMbrReportDetail(reportId));
    }

    @PostMapping("/delete/{reportId}")
    public ResponseEntity<?> deleteReport(@PathVariable Long reportId) {
        reportSysService.deleteReport(reportId);
        return ResponseEntity.ok(Collections.emptyMap());
    }

    @PostMapping("/reset")
    public ResponseEntity<?> resetReport(@RequestBody @Valid ResetReportRequest request) {
        reportSysService.resetReport(request);
        return ResponseEntity.ok(Collections.emptyMap());
    }
}
