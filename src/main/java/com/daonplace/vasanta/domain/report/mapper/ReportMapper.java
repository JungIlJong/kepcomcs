package com.daonplace.vasanta.domain.report.mapper;

import com.daonplace.vasanta.domain.report.dto.Report;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ReportMapper {
    void insertReport(Report report);
}
