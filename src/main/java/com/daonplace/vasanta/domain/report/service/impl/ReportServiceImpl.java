package com.daonplace.vasanta.domain.report.service.impl;

import com.daonplace.vasanta.domain.report.dto.InsertReport;
import com.daonplace.vasanta.domain.report.dto.Report;
import com.daonplace.vasanta.domain.report.mapper.ReportMapper;
import com.daonplace.vasanta.domain.report.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
