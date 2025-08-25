package com.kepco.app.domain.mbrOrg.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.mbrOrg.dto.MbrOrg;

import java.util.List;
import java.util.Map;

@Mapper("mbrOrgMapper")
public interface MbrOrgMapper {
    List<MbrOrg> selectMbrOrgList(Map<String, Object> searchMap);

    int selectMbrOrgListTotCnt(Map<String, Object> searchMap);

    MbrOrg selectMbrOrgDetailByUUID(String uuid);

    int countMbrOrgById(String id);

    void insertMbr(MbrOrg mbrOrg);

    void updateMbrByUUID(MbrOrg mbrOrg);

    void insertMbrOrg(MbrOrg mbrOrg);

    void updateMbrOrgByUUID(MbrOrg mbrOrg);

    void deleteMbr(String uuid);

    void deleteMbrOrg(Long mbrId);

    void updateMbrOrgLock(String uuid);

    List<MbrOrg> selectMbrOrgPushList(Map<String, Object> searchMap);

    int selectMbrOrgPushListTotCnt(Map<String, Object> searchMap);

    List<MbrOrg> selectMbrOrgPushListAll(Map<String, Object> searchMap);

    int countMbrOrgByEmail(Map<String, Object> searchMap);
}
