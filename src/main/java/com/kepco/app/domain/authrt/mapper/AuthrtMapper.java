package com.kepco.app.domain.authrt.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;
import com.kepco.app.domain.menu.dto.Menu;

import java.util.List;
import java.util.Map;

@Mapper("authrtMapper")
public interface AuthrtMapper {
    List<Authrt> selectAuthrtList(Map<String, Object> searchMap);

    int selectAuthrtListTotCnt(Map<String, Object> searchMap);

    Authrt selectAuthrtDetail(Long authrtId);

    void insertAuthrt(Authrt authrt);

    void updateAuthrt(Authrt authrt);

    void deleteAuthrt(Long authrtId);

    List<Menu> selectMenuAuthrtList(Long authrtId);

    void insertMenuAuthrt(Authrt authrt);

    void deleteMenuAuthrt(Long authrtId);

    void deleteMenuAuthrt(String authrtId);

    void deleteMbrAuthrt(Long authrtId);

    void deleteBbsAuthrt(Long authrtId);

    List<Authrt> selectAllAuthrtList();

    void deleteMbrAuthrtByUUID(String uuid);

    void insertMbrAuthrtByUUID(Mbr mbr);

    void insertMbrAuthrtByMbrId(Mbr mbr);

    void insertMbrOrgAuthrtByMbrId(MbrOrg mbrorg);

    void insertMbrOrgAuthrtByUUID(MbrOrg mbrorg);
}
