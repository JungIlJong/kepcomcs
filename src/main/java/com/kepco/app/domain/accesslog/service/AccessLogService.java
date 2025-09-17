package com.kepco.app.domain.accesslog.service;

import java.util.List;
import java.util.Map;

public interface AccessLogService {
	List<Map<String, Object>> selectAccessLogList(Map<String, Object> searchMap);

    int selectAccessLogListTotCnt(Map<String, Object> searchMap);

    void insertAccessLog(Map<String, Object> map);
}
