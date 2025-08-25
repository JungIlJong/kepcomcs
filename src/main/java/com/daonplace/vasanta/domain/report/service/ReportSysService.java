package com.daonplace.vasanta.domain.report.service;

import com.daonplace.vasanta.domain.report.dto.*;

import java.util.List;

public interface ReportSysService {
    List<SearchReportResponse> searchReportList(SearchReportRequest request);

    int searchReportTotCnt(SearchReportRequest request);

    void deleteReport(Long reportId);

    void resetReport(ResetReportRequest request);


    AnswerReportDetailResponse getAnswerReportDetail(Long reportId);

    NttReportDetailResponse getNttReportDetail(Long reportId);

    MbrReportDetailResponse getMbrReportDetail(Long reportId);
}
