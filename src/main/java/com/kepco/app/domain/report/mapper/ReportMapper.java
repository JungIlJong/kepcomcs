package com.kepco.app.domain.report.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.report.dto.Report;

@Mapper
public interface ReportMapper {
    void insertReport(Report report);
}
