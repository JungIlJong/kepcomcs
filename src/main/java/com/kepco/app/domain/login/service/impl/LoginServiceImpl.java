package com.kepco.app.domain.login.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.login.dto.*;
import com.kepco.app.domain.login.mapper.LoginMapper;
import com.kepco.app.domain.login.service.LoginService;
import com.kepco.app.domain.mbr.mbrSttsCd;
import com.kepco.app.domain.mbr.dto.Mbr;

import java.util.List;

@RequiredArgsConstructor
@Service("LoginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

    private final LoginMapper loginMapper;
    private final PasswordEncoder passwordEncoder;

    @Value("${Globals.login.Lock}")
    private boolean loginLock;

    @Value("${Globals.login.LockCount}")
    private int loginLockCount;

    @Override
    public LoginVO selectMbrById(String username) {
        return loginMapper.selectMbrById(username);
    }

    @Override
    public void updateMbrLgnLckById(String id) {
        loginMapper.updateMbrLgnLckById(id);
    }

    @Override
    public void increaseMbrLgnFailNmtmById(String id) {
        loginMapper.increaseMbrLgnFailNmtmById(id);
    }

    @Override
    public void resetMbrLgnLckById(String id) {
        loginMapper.resetMbrLgnLckById(id);
    }

    @Override
    public List<String> selectMbrRoleByMbrId(Long mbrId) {
        return loginMapper.selectMbrRoleByMbrId(mbrId);
    }

    @Override
    public Mbr selectMbrByMbrNmAndEmlAddr(FindId findId) {
        return loginMapper.selectMbrByMbrNmAndEmlAddr(findId);
    }

    @Override
    public Mbr selectMbrByIdAndMbrNmAndEmlAddr(FindPw findPw) {
        return loginMapper.selectMbrByIdAndMbrNmAndEmlAddr(findPw);
    }

    @Override
    public void updateMbrPswdByUuid(ResetPw resetPw) {
        resetPw.setPswd(passwordEncoder.encode(resetPw.getPswd()));
        loginMapper.updateMbrPswdByUuid(resetPw);
    }

    @Override
    public void updateMbrDvcPushTokenById(LoginVO loginVO) {
        loginMapper.updateMbrDvcPushTokenById(loginVO);
    }

    @Override
    public LoginResult login(JwtLoginRequest jwtLoginRequest) {
        LoginVO loginVO = loginMapper.selectMbrById(jwtLoginRequest.getUsername());
        if (!isValidLogin(loginVO, jwtLoginRequest.getPassword())) {
            return handleLoginFail(loginVO);
        }
        String sttsCd = loginVO.getSttsCd();
        mbrSttsCd status = null;
        for (mbrSttsCd cd : mbrSttsCd.values()) {
            if (cd.getSttsCd().equals(sttsCd)) {
                status = cd;
                break;
            }
        }
        if (status != null && status.getErrorCode() != null) {
            return new LoginResult(false, loginVO, status.getErrorCode());
        }
        return new LoginResult(true, loginVO, null);
    }

    private boolean isValidLogin(LoginVO loginVO, String password) {
        return loginVO != null && passwordEncoder.matches(password, loginVO.getPswd());
    }

    private LoginResult handleLoginFail(LoginVO loginVO) {
        if (loginVO != null) {
            loginMapper.increaseMbrLgnFailNmtmById(loginVO.getId());
            if (loginLock && loginVO.getLgnFailNmtm() + 1 >= loginLockCount) {
                loginMapper.updateMbrLgnLckById(loginVO.getId());
                return new LoginResult(false, loginVO, CommonErrorCode.LOGIN_FAIL_EXCEED_LIMIT);
            }
        }
        return new LoginResult(false, CommonErrorCode.UNAUTHORIZED_MEMBER);
    }
}
