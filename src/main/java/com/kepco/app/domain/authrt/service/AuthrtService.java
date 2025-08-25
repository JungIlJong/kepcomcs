package com.kepco.app.domain.authrt.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;

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
