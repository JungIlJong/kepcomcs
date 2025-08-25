package com.kepco.app.domain.setting.mapper;

import org.apache.ibatis.annotations.MapKey;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.setting.dto.VstSetting;

import java.util.List;
import java.util.Map;

@Mapper
public interface SettingSysMapper {
    void insert(List<VstSetting> list);

    @MapKey("key")
    Map<String, VstSetting> selectAll();
}
