package com.kepco.app.domain.ntt.service;

import java.util.Map;

import com.kepco.app.domain.ntt.dto.SearchMberNtt;

public interface NttQueryService {
    Map<String, Object> selectList(SearchMberNtt.Search req);

    SearchMberNtt.NttDetail selectNonSecretDetail(Long nttId);

    SearchMberNtt.NttDetail selectSecretDetail(Long nttId, String password);

    SearchMberNtt.PreNext selectPreAndNext(Long id);

}
