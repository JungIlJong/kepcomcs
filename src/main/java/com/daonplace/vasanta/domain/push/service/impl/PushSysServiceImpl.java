package com.daonplace.vasanta.domain.push.service.impl;

import com.daonplace.vasanta.domain.push.dto.PushLog;
import com.daonplace.vasanta.domain.push.dto.XlsxPushLog;
import com.daonplace.vasanta.domain.push.mapper.PushSysMapper;
import com.daonplace.vasanta.domain.push.service.PushSysService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service("pushSysService")
public class PushSysServiceImpl extends EgovAbstractServiceImpl implements PushSysService {

    private final PushSysMapper pushSysMapper;

    public PushSysServiceImpl(PushSysMapper pushSysMapper) {
        this.pushSysMapper = pushSysMapper;
    }

    @Override
    public List<Map<String, Object>> selectPushList(Map<String, Object> searchMap) {
        return pushSysMapper.selectPushList(searchMap);
    }

    @Override
    public int selectPushListTotCnt(Map<String, Object> searchMap) {
        return pushSysMapper.selectPushListTotCnt(searchMap);
    }

    @Override
    public void insertPushLog(PushLog pushLog) {
        pushSysMapper.insertPushLog(pushLog);
    }

    @Override
    public PushLog selectPushLogXlsx(Map<String, Object> paramMap) {
        return pushSysMapper.selectPushLogXlsx(paramMap);
    }
}
