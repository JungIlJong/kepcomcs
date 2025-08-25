package com.kepco.app.domain.login.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.login.dto.FindId;
import com.kepco.app.domain.login.dto.FindPw;
import com.kepco.app.domain.login.dto.ResetPw;
import com.kepco.app.domain.mbr.dto.Mbr;

import java.util.List;

@Mapper("loginMapper")
public interface LoginMapper {

    LoginVO selectMbrById(String username);

    void increaseMbrLgnFailNmtmById(String id);

    void resetMbrLgnLckById(String id);

    List<String> selectMbrRoleByMbrId(Long mbrId);

    Mbr selectMbrByMbrNmAndEmlAddr(FindId findId);

    Mbr selectMbrByIdAndMbrNmAndEmlAddr(FindPw findPw);

    void updateMbrPswdByUuid(ResetPw resetPw);

    void updateMbrLgnLckById(String id);

    void updateMbrDvcPushTokenById(LoginVO loginVO);
}
