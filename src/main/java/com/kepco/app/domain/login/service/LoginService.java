package com.kepco.app.domain.login.service;

import java.util.List;

import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.login.dto.*;
import com.kepco.app.domain.mbr.dto.Mbr;

public interface LoginService {
    LoginVO selectMbrById(String username);

    void updateMbrLgnLckById(String id);

    void increaseMbrLgnFailNmtmById(String id);

    void resetMbrLgnLckById(String id);

    List<String> selectMbrRoleByMbrId(Long mbrId);


    Mbr selectMbrByMbrNmAndEmlAddr(FindId findId);

    Mbr selectMbrByIdAndMbrNmAndEmlAddr(FindPw findPw);

    void updateMbrPswdByUuid(ResetPw resetPw);

    void updateMbrDvcPushTokenById(LoginVO loginVO);

    LoginResult login(JwtLoginRequest jwtLoginRequest);
}
