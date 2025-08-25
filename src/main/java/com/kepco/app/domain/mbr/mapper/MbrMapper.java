package com.kepco.app.domain.mbr.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.mbr.dto.Mbr;

import java.util.List;
import java.util.Map;

@Mapper("mbrMapper")
public interface MbrMapper {
    List<Mbr> selectMbrList(Map<String, Object> searchMap);

    int selectMbrListTotCnt(Map<String, Object> searchMap);

    Mbr selectMbrDetailByUUID(String uuid);

    int countMbrById(String id);

    void insertMbr(Mbr mbr);

    void updateMbrByUUID(Mbr mbr);

    void deleteMbr(String uuid);

    void updateMbrLock(String uuid);

    List<Mbr> selectMbrPushList(Map<String, Object> searchMap);

    int selectMbrPushListTotCnt(Map<String, Object> searchMap);

    List<Mbr> selectMbrPushListAll(Map<String, Object> searchMap);

    int countMbrByEmail(Map<String, Object> searchMap);

    void withDrawByUuid(String uuid);

    void blockMbr(Map<String, Object> blockMap);

    void reportMbr(Map<String, Object> reportMap);

    void updateMbrReportIds(String uuid);
}
