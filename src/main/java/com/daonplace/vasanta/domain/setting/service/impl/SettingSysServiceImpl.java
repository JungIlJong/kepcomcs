package com.daonplace.vasanta.domain.setting.service.impl;

import com.daonplace.vasanta.domain.setting.dto.VstSetting;
import com.daonplace.vasanta.domain.setting.mapper.SettingSysMapper;
import com.daonplace.vasanta.domain.setting.service.SettingSysService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class SettingSysServiceImpl extends EgovAbstractServiceImpl implements SettingSysService {

    private final SettingSysMapper settingSysMapper;

    @Override
    @Transactional
    public void insert(List<VstSetting> list) {
        settingSysMapper.insert(list);
    }

    @Override
    public Map<String, VstSetting> selectAll() {
        return settingSysMapper.selectAll();
    }
}
