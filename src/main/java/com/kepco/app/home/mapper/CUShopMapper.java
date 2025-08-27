package com.kepco.app.home.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CUShopMapper")
public interface CUShopMapper {
	List<HashMap<String, Object>> getShopList(HashMap<String, Object> param);
	Integer getShopListCount(HashMap<String, Object> param);
	List<HashMap<String,Object>> getRegion1(HashMap<String, Object> param);
	List<HashMap<String,Object>> getRegion2(HashMap<String, Object> param);
	List<HashMap<String, Object>> getPowerList(HashMap<String, Object> param);
	Integer getPowerListCount(HashMap<String, Object> param);
	List<HashMap<String,Object>> getPowerRegion1(HashMap<String, Object> param);
	List<HashMap<String,Object>> getPowerRegion2(HashMap<String, Object> param);
}
