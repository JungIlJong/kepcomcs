package com.kepco.app.domain.accesslog.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("accessLogMapper")
public interface AccessLogMapper {
	List<Map<String, Object>> selectAccessLogList(Map<String, Object> searchMap);

    int selectAccessLogListTotCnt(Map<String, Object> searchMap);

    void insertAccessLog(Map<String, Object> map);
}
