package com.kepco.app.domain.push.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.push.dto.PushLog;
import com.kepco.app.domain.push.dto.XlsxPushLog;

public interface PushSysService {
    List<Map<String, Object>> selectPushList(Map<String, Object> searchMap);

    int selectPushListTotCnt(Map<String, Object> searchMap);

    void insertPushLog(PushLog pushLog);

    PushLog selectPushLogXlsx(Map<String, Object> paramMap);
}
