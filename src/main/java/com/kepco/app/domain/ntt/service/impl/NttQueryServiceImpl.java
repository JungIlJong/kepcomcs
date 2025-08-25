package com.kepco.app.domain.ntt.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.exception.GlobalRestException;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.util.SearchUtil;
import com.kepco.app.domain.ntt.dto.SearchMberNtt;
import com.kepco.app.domain.ntt.mapper.NttQueryMapper;
import com.kepco.app.domain.ntt.service.NttQueryService;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class NttQueryServiceImpl extends EgovAbstractServiceImpl implements NttQueryService {
    private final NttQueryMapper nttQueryMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public Map<String, Object> selectList(SearchMberNtt.Search req) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        PaginationInfo paginationInfo = SearchUtil.init(req);
        resultMap.put("data", nttQueryMapper.selectList(req));
        paginationInfo.setTotalRecordCount(nttQueryMapper.selectTotCnt(req));
        resultMap.put("paginationInfo", paginationInfo);
        return resultMap;
    }

    @Override
    @Transactional
    public SearchMberNtt.NttDetail selectNonSecretDetail(Long nttId) {
        SearchMberNtt.NttDetail detail = nttQueryMapper.selectDetail(nttId, UserDetailsUtil.getMbrId());
        isSecretAndAnonymous(detail);
        isSecretMine(detail);
        nttQueryMapper.updateViewCount(nttId);
        return detail;
    }

    @Override
    @Transactional
    public SearchMberNtt.NttDetail selectSecretDetail(Long nttId, String password) {
        SearchMberNtt.NttDetail detail = nttQueryMapper.selectDetail(nttId, UserDetailsUtil.getMbrId());
        checkPassword(detail, password);
        return detail;
    }

    @Override
    public SearchMberNtt.PreNext selectPreAndNext(Long id) {
        return nttQueryMapper.selectPreAndNext(id, UserDetailsUtil.isAuthenticated() ? Long.parseLong(UserDetailsUtil.getMbrId()) : 0);
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
