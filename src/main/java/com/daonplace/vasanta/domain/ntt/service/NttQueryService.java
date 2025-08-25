package com.daonplace.vasanta.domain.ntt.service;

import com.daonplace.vasanta.domain.ntt.dto.SearchMberNtt;

import java.util.Map;

public interface NttQueryService {
    Map<String, Object> selectList(SearchMberNtt.Search req);

    SearchMberNtt.NttDetail selectNonSecretDetail(Long nttId);

    SearchMberNtt.NttDetail selectSecretDetail(Long nttId, String password);

    SearchMberNtt.PreNext selectPreAndNext(Long id);

}
