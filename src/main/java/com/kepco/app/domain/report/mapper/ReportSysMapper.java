package com.kepco.app.domain.report.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.report.dto.*;

import java.util.List;

@Mapper
public interface ReportSysMapper {
    List<SearchReportResponse> searchReportList(SearchReportRequest request);

    int searchReportTotCnt(SearchReportRequest request);

    void deleteReport(Long reportId);

    void resetReport(ResetReportRequest request);

    AnswerReportDetailResponse selectAnswerWithReport(Long reportId);

    NttReportDetailResponse selectNttWithReport(Long reportId);

    MbrReportDetailResponse selectMbrWithReport(Long reportId);
}
