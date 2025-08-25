package com.kepco.app.domain.lgnlog.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.lgnlog.dto.LgnLog;

import java.util.List;
import java.util.Map;

@Mapper("lgnLogMapper")
public interface LgnLogMapper {
    List<LgnLog> selectLgnLogList(Map<String, Object> searchMap);

    int selectLgnLogListTotCnt(Map<String, Object> searchMap);

    void insertLgnLog(LgnLog lgnLog);
}
