package com.kepco.app.domain.ntt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kepco.app.domain.ntt.dto.SearchMberNtt;

public interface NttQueryService {
	List<HashMap<String, Object>> selectList(HashMap<String, Object> body);
	
	Integer selectListCount(HashMap<String, Object> body);
	
    Map<String, Object> selectNttList(SearchMberNtt.Search req);

    SearchMberNtt.NttDetail selectNonSecretDetail(Long nttId);

    SearchMberNtt.NttDetail selectSecretDetail(Long nttId, String password);

    List<SearchMberNtt.PreNext> selectPreAndNext(Long id, Long bbsId);

}
