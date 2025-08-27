package com.kepco.app.home.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kepco.app.home.mapper.CUShopMapper;
import com.kepco.app.home.service.CUShopService;


@Service("CUShopService")
public class CUShopServiceImpl implements CUShopService {

	@Autowired
	CUShopMapper shopMapper;

	
	// 영업 안내소
	public List<HashMap<String, Object>> getShopList(HashMap<String, Object> param) {
		return shopMapper.getShopList(param);
	}

	public Integer getShopListCount(HashMap<String, Object> param) {
		return shopMapper.getShopListCount(param);
	}

	public HashMap<String, Object> getRegion1(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			List<HashMap<String,Object>> DataList = shopMapper.getRegion1(param);
			if(DataList.size() > 0)
			{
				result.put("result", 1);
				result.put("code", "200");
				result.put("msg", "지역정보 조회 성공");
				result.put("data", DataList);
			}
			else 
			{
				result.put("result", 0);
				result.put("code", "204");
				result.put("msg", "저장된 지역정보가 없습니다.");
				result.put("data", DataList);
			}
		} catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	public HashMap<String, Object> getRegion2(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("region1") != null && !param.get("region1").equals(""))
			{
				List<HashMap<String,Object>> DataList = shopMapper.getRegion2(param);
				if(DataList.size() > 0)
				{
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "지역정보 조회 성공");
					result.put("data", DataList);
				}
				else 
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "저장된 지역정보가 없습니다.");
					result.put("data", DataList);
				}
			}
			else 
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "지역정보를 입력해주세요.");
			}
		} catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}

	// 발전 안내소 
	public List<HashMap<String, Object>> getPowerList(HashMap<String, Object> param) {
		return shopMapper.getPowerList(param);
	}
	
	public Integer getPowerListCount(HashMap<String, Object> param) {
		return shopMapper.getPowerListCount(param);
	}

	public HashMap<String, Object> getPowerRegion1(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			List<HashMap<String,Object>> DataList = shopMapper.getPowerRegion1(param);
			if(DataList.size() > 0)
			{
				result.put("result", 1);
				result.put("code", "200");
				result.put("msg", "지역정보 조회 성공");
				result.put("data", DataList);
			}
			else 
			{
				result.put("result", 0);
				result.put("code", "204");
				result.put("msg", "저장된 지역정보가 없습니다.");
				result.put("data", DataList);
			}
		} catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	public HashMap<String, Object> getPowerRegion2(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("region1") != null && !param.get("region1").equals(""))
			{
				List<HashMap<String,Object>> DataList = shopMapper.getPowerRegion2(param);
				if(DataList.size() > 0)
				{
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "지역정보 조회 성공");
					result.put("data", DataList);
				}
				else 
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "저장된 지역정보가 없습니다.");
					result.put("data", DataList);
				}
			}
			else 
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "지역정보를 입력해주세요.");
			}
		} catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
}
