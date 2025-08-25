package com.daonplace.vasanta.domain.report.mapper;

import com.daonplace.vasanta.domain.report.dto.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
