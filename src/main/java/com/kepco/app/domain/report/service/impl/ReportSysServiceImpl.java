package com.kepco.app.domain.report.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.report.dto.*;
import com.kepco.app.domain.report.mapper.ReportSysMapper;
import com.kepco.app.domain.report.service.ReportSysService;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ReportSysServiceImpl extends EgovAbstractServiceImpl implements ReportSysService {
    private final ReportSysMapper reportSysMapper;

    @Override
    public List<SearchReportResponse> searchReportList(SearchReportRequest request) {
        return reportSysMapper.searchReportList(request);
    }

    @Override
    public int searchReportTotCnt(SearchReportRequest request) {
        return reportSysMapper.searchReportTotCnt(request);
    }

    @Override
    @Transactional
    public void deleteReport(Long reportId) {
        reportSysMapper.deleteReport(reportId);
    }

    @Override
    @Transactional
    public void resetReport(ResetReportRequest request) {
        reportSysMapper.resetReport(request);
    }

    @Override
    public AnswerReportDetailResponse getAnswerReportDetail(Long reportId) {
        return reportSysMapper.selectAnswerWithReport(reportId);
    }

    @Override
    public NttReportDetailResponse getNttReportDetail(Long reportId) {
        return reportSysMapper.selectNttWithReport(reportId);
    }

    @Override
    public MbrReportDetailResponse getMbrReportDetail(Long reportId) {
        return reportSysMapper.selectMbrWithReport(reportId);
    }
}
