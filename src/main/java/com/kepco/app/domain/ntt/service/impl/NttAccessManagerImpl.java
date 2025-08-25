package com.kepco.app.domain.ntt.service.impl;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.ntt.mapper.NttAccessManagerMapper;
import com.kepco.app.domain.ntt.service.NttAccessManager;

import java.util.Objects;

@RequiredArgsConstructor
@Service
public class NttAccessManagerImpl extends EgovAbstractServiceImpl implements NttAccessManager {

    private final NttAccessManagerMapper nttAccessManagerMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public boolean hasModifyPermission(Long id) {
        Access access = nttAccessManagerMapper.getNttValidation(id);
        if(Objects.isNull(access)) {
            return false;
        }
        return isUserNtt(access) && isAuthenticatedUser(access.getFrstRegisterId());
    }

    @Override
    public boolean hasModifyPermission(Long id, String password) {
        Access access = nttAccessManagerMapper.getNttValidation(id);
        if(Objects.isNull(access)) {
            return false;
        }

        // 회원의 글일 경우
        if(isUserNtt(access)) {
            return isAuthenticatedUser(access.getFrstRegisterId());
        }
        // 비회원의 글일 경우
        return passwordEncoder.matches(password, access.getPassword());
    }

    @Override
    public boolean hasViewPermission(Long id) {
        return false;
    }

    @Override
    public boolean hasViewPermission(Long id, String password) {
        Access access = nttAccessManagerMapper.getNttValidation(id);

        if(Objects.isNull(access)) {
            return false;
        }

        if(access.getSecretAt().equals("N")) {
            return true;
        }

        if(isAuthenticatedUser(access.getFrstRegisterId())) {
            return true;
        }

        return passwordEncoder.matches(password, access.getPassword());
    }

    @Override
    public Access getAccessInfo(Long id) {
        Access access = nttAccessManagerMapper.getNttValidation(id);
        access.setAuthor(isAuthenticatedUser(access.getFrstRegisterId()));
        return access;
    }

    private boolean isUserNtt(Access access) {
        return Objects.nonNull(access.getFrstRegisterId());
    }

    private boolean isAuthenticatedUser(Long registerId) {
        return UserDetailsUtil.isAuthenticated() &&
                UserDetailsUtil.getMbrId().equals(String.valueOf(registerId));
    }

    @Getter
    public static class Access {
        private Long frstRegisterId;
        private String password;
        private String secretAt;
        @Setter
        private boolean author;
    }
}
