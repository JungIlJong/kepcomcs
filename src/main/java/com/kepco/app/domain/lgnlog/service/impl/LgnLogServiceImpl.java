package com.kepco.app.domain.lgnlog.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.lgnlog.dto.LgnLog;
import com.kepco.app.domain.lgnlog.mapper.LgnLogMapper;
import com.kepco.app.domain.lgnlog.service.LgnLogService;

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
