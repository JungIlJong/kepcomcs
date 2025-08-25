package com.daonplace.vasanta.domain.mbrOrg.service;

import com.daonplace.vasanta.domain.mbrOrg.dto.MbrOrg;

import java.util.List;
import java.util.Map;

public interface MbrOrgService {
    List<MbrOrg> selectMbrOrgList(Map<String, Object> searchMap);

    int selectMbrOrgListTotCnt(Map<String, Object> searchMap);

    MbrOrg selectMbrOrgDetailByUUID(String uuid);

    int countMbrOrgById(String id);

    void insertMbr(MbrOrg mbrOrg);

    void updateMbrByUUID(MbrOrg mbrOrg);

    void insertMbrOrg(MbrOrg mbrOrg);

    void updateMbrOrgByUUID(MbrOrg mbrOrg);

    void deleteMbrOrg(String uuid);

    void updateMbrOrgLock(String uuid);

    List<MbrOrg> selectMbrOrgPushList(Map<String, Object> searchMap);

    int selectMbrOrgPushListTotCnt(Map<String, Object> searchMap);

    List<MbrOrg> selectMbrOrgPushListAll(Map<String, Object> searchMap);

    int countMbrOrgByEmail(Map<String, Object> searchMap);
}
