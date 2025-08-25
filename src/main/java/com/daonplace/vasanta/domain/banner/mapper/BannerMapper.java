package com.daonplace.vasanta.domain.banner.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("bannerMapper")
public interface BannerMapper {

    List<Map<String, Object>> selectBannerListMain();
}
