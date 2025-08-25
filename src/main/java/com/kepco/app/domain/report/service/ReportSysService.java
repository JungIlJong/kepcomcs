package com.kepco.app.domain.report.service;

import java.util.List;

import com.kepco.app.domain.report.dto.*;

public interface ReportSysService {
    List<SearchReportResponse> searchReportList(SearchReportRequest request);

    int searchReportTotCnt(SearchReportRequest request);

    void deleteReport(Long reportId);

    void resetReport(ResetReportRequest request);


    AnswerReportDetailResponse getAnswerReportDetail(Long reportId);

    NttReportDetailResponse getNttReportDetail(Long reportId);

    MbrReportDetailResponse getMbrReportDetail(Long reportId);
}
