package com.kepco.app.domain.lgnlog.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.lgnlog.dto.LgnLog;

public interface LgnLogService {
    List<LgnLog> selectLgnLogList(Map<String, Object> searchMap);

    int selectLgnLogListTotCnt(Map<String, Object> searchMap);

    void insertLgnLog(LgnLog lgnLog);
}
