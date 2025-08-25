package com.daonplace.vasanta.domain.authrt.service;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import com.daonplace.vasanta.domain.mbr.dto.Mbr;
import com.daonplace.vasanta.domain.mbrOrg.dto.MbrOrg;

import java.util.List;
import java.util.Map;

public interface AuthrtService {
    List<Authrt> selectAuthrtList(Map<String, Object> searchMap);

    int selectAuthrtListTotCnt(Map<String, Object> searchMap);

    Authrt selectAuthrtDetail(Long authrtId);

    void insertAuthrt(Authrt authrt);

    void updateAuthrt(Authrt authrt);

    void deleteAuthrt(Long authrtId);

    List<Authrt> selectAllAuthrtList();

    void deleteMbrAuthrtByUUID(String uuid);

    void insertMbrAuthrtByUUID(Mbr mbr);

    void insertMbrAuthrtByMbrId(Mbr mbr);

    void insertMbrOrgAuthrtByUUID(MbrOrg mbrorg);

    void insertMbrOrgAuthrtByMbrId(MbrOrg mbrorg);
}
