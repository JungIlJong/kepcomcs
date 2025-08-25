package com.daonplace.vasanta.domain.login.service;

import com.daonplace.vasanta.core.vo.LoginVO;
import com.daonplace.vasanta.domain.login.dto.*;
import com.daonplace.vasanta.domain.mbr.dto.Mbr;

import java.util.List;

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
