package com.kepco.app.domain.setting.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.setting.dto.VstSetting;
import com.kepco.app.domain.setting.mapper.SettingSysMapper;
import com.kepco.app.domain.setting.service.SettingSysService;

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
