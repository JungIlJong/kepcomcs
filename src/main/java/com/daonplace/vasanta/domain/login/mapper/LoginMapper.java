package com.daonplace.vasanta.domain.login.mapper;

import com.daonplace.vasanta.core.vo.LoginVO;
import com.daonplace.vasanta.domain.login.dto.FindId;
import com.daonplace.vasanta.domain.login.dto.FindPw;
import com.daonplace.vasanta.domain.login.dto.ResetPw;
import com.daonplace.vasanta.domain.mbr.dto.Mbr;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
