package com.kepco.app.domain.report.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.report.dto.InsertReport;
import com.kepco.app.domain.report.dto.Report;
import com.kepco.app.domain.report.mapper.ReportMapper;
import com.kepco.app.domain.report.service.ReportService;

@RequiredArgsConstructor
@Service
public class ReportServiceImpl extends EgovAbstractServiceImpl implements ReportService {
    private final ReportMapper reportMapper;

    @Override
    @Transactional
    public void insertReport(InsertReport insertReport) {
        reportMapper.insertReport(Report.of(insertReport));
    }
}
