package com.kepco.app.domain.accesslog.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.accesslog.mapper.AccessLogMapper;
import com.kepco.app.domain.accesslog.service.AccessLogService;

@Service("accessLogService")
public class AccessLogServiceImpl extends EgovAbstractServiceImpl implements AccessLogService {

    private final AccessLogMapper accessLogMapper;

    public AccessLogServiceImpl(AccessLogMapper accessLogMapper) {
        this.accessLogMapper = accessLogMapper;
    }

    @Override
    public List<Map<String, Object>> selectAccessLogList(Map<String, Object> searchMap) {
        return accessLogMapper.selectAccessLogList(searchMap);
    }

    @Override
    public int selectAccessLogListTotCnt(Map<String, Object> searchMap) {
        return accessLogMapper.selectAccessLogListTotCnt(searchMap);
    }

    @Override
    public void insertAccessLog(Map<String, Object> map) {
        accessLogMapper.insertAccessLog(map);
    }

}
