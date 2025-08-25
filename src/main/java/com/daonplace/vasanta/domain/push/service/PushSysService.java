package com.daonplace.vasanta.domain.push.service;

import com.daonplace.vasanta.domain.push.dto.PushLog;
import com.daonplace.vasanta.domain.push.dto.XlsxPushLog;

import java.util.List;
import java.util.Map;

public interface PushSysService {
    List<Map<String, Object>> selectPushList(Map<String, Object> searchMap);

    int selectPushListTotCnt(Map<String, Object> searchMap);

    void insertPushLog(PushLog pushLog);

    PushLog selectPushLogXlsx(Map<String, Object> paramMap);
}
