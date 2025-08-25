package com.daonplace.vasanta.domain.lgnlog.service;

import com.daonplace.vasanta.domain.lgnlog.dto.LgnLog;

import java.util.List;
import java.util.Map;

public interface LgnLogService {
    List<LgnLog> selectLgnLogList(Map<String, Object> searchMap);

    int selectLgnLogListTotCnt(Map<String, Object> searchMap);

    void insertLgnLog(LgnLog lgnLog);
}
