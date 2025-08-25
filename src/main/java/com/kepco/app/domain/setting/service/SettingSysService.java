package com.kepco.app.domain.setting.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.setting.dto.VstSetting;

public interface SettingSysService {
    void insert(List<VstSetting> list);
    Map<String, VstSetting> selectAll();
}
