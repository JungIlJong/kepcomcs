package com.daonplace.vasanta.domain.lgnlog.service.impl;

import com.daonplace.vasanta.domain.lgnlog.dto.LgnLog;
import com.daonplace.vasanta.domain.lgnlog.mapper.LgnLogMapper;
import com.daonplace.vasanta.domain.lgnlog.service.LgnLogService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("lgnLogService")
public class LgnLogServiceImpl extends EgovAbstractServiceImpl implements LgnLogService {

    private final LgnLogMapper lgnLogMapper;

    public LgnLogServiceImpl(LgnLogMapper lgnLogMapper) {
        this.lgnLogMapper = lgnLogMapper;
    }

    @Override
    public List<LgnLog> selectLgnLogList(Map<String, Object> searchMap) {
        return lgnLogMapper.selectLgnLogList(searchMap);
    }

    @Override
    public int selectLgnLogListTotCnt(Map<String, Object> searchMap) {
        return lgnLogMapper.selectLgnLogListTotCnt(searchMap);
    }

    @Override
    public void insertLgnLog(LgnLog lgnLog) {
        lgnLogMapper.insertLgnLog(lgnLog);
    }

}
