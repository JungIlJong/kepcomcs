package com.daonplace.vasanta.domain.lgnlog.mapper;

import com.daonplace.vasanta.domain.lgnlog.dto.LgnLog;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("lgnLogMapper")
public interface LgnLogMapper {
    List<LgnLog> selectLgnLogList(Map<String, Object> searchMap);

    int selectLgnLogListTotCnt(Map<String, Object> searchMap);

    void insertLgnLog(LgnLog lgnLog);
}
