package com.kepco.app.home.service;

import java.util.HashMap;
import java.util.List;

public interface CUShopService {

	// 영업 안내소

	List<HashMap<String, Object>> getShopList(HashMap<String, Object> param);
	
	Integer getShopListCount(HashMap<String, Object> body);

	HashMap<String, Object> getRegion1(HashMap<String, Object> param);

	HashMap<String, Object> getRegion2(HashMap<String, Object> param);
	
	//발전 안내소
	
	List<HashMap<String, Object>> getPowerList(HashMap<String, Object> param);
	
	Integer getPowerListCount(HashMap<String, Object> body);

	HashMap<String, Object> getPowerRegion1(HashMap<String, Object> param);

	HashMap<String, Object> getPowerRegion2(HashMap<String, Object> param);

}
