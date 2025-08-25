package com.daonplace.vasanta.domain.setting.service;

import com.daonplace.vasanta.domain.setting.dto.VstSetting;

import java.util.List;
import java.util.Map;

public interface SettingSysService {
    void insert(List<VstSetting> list);
    Map<String, VstSetting> selectAll();
}
