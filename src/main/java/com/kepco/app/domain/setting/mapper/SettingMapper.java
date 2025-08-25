package com.kepco.app.domain.setting.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SettingMapper {
    List<Map<String, Object>> selectAll();
}
