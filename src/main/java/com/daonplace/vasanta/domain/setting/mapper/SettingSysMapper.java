package com.daonplace.vasanta.domain.setting.mapper;

import com.daonplace.vasanta.domain.setting.dto.VstSetting;
import org.apache.ibatis.annotations.MapKey;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SettingSysMapper {
    void insert(List<VstSetting> list);

    @MapKey("key")
    Map<String, VstSetting> selectAll();
}
