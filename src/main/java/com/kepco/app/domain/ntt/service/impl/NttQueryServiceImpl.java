package com.kepco.app.domain.ntt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.exception.GlobalRestException;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.ntt.dto.SearchMberNtt;
import com.kepco.app.domain.ntt.mapper.NttQueryMapper;
import com.kepco.app.domain.ntt.service.NttQueryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class NttQueryServiceImpl extends EgovAbstractServiceImpl implements NttQueryService {
    private final NttQueryMapper nttQueryMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public List<HashMap<String, Object>> selectList(HashMap<String, Object> body) {
        return nttQueryMapper.selectList(body);
    }

    @Override
    public Integer selectListCount(HashMap<String, Object> body) {
    	return nttQueryMapper.selectListCount(body);
    }
    
    @Override
    public Map<String, Object> selectNttList(SearchMberNtt.Search req) {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	PaginationInfo paginationInfo = SearchUtil.init(req);
    	resultMap.put("data", nttQueryMapper.selectNttList(req));
    	paginationInfo.setTotalRecordCount(nttQueryMapper.selectTotCnt(req));
    	resultMap.put("paginationInfo", paginationInfo);
    	return resultMap;
    }

    @Override
    @Transactional
    public SearchMberNtt.NttDetail selectNonSecretDetail(Long nttId) {
        SearchMberNtt.NttDetail detail = nttQueryMapper.selectDetail(nttId);
//        isSecretAndAnonymous(detail);
//        isSecretMine(detail);
        nttQueryMapper.updateViewCount(nttId);
        return detail;
    }

    @Override
    @Transactional
    public SearchMberNtt.NttDetail selectSecretDetail(Long nttId, String password) {
//        SearchMberNtt.NttDetail detail = nttQueryMapper.selectDetail(nttId, UserDetailsUtil.getMbrId());
//        checkPassword(detail, password);
//        return detail;
    	return null;
    }

    @Override
    public List<SearchMberNtt.PreNext>selectPreAndNext(Long id, Long bbsId) {
        return nttQueryMapper.selectPreAndNext(id, bbsId);
    }

    // 비회원의 비밀글 확인
    private void isSecretAndAnonymous(SearchMberNtt.NttDetail detail) {
        if(detail.isSecret() && detail.isAnonymousWriter()) {
            throw new GlobalRestException(HttpStatus.FORBIDDEN, "비밀글 입니다.");
        }
    }

    // 로그인한 유저의 비밀글 확인
    private void isSecretMine(SearchMberNtt.NttDetail detail) {
        if(detail.isSecret() && !detail.isAnonymousWriter() && !detail.isMine()) {
            throw new GlobalRestException(HttpStatus.FORBIDDEN, "비밀글 입니다.");
        }
    }

    private void checkPassword(SearchMberNtt.NttDetail detail, String password) {
        if(!passwordEncoder.matches(password, detail.getPassword())) {
            throw new GlobalRestException(HttpStatus.UNAUTHORIZED, "잘못된 비밀번호 입니다.");
        }
    }
}
