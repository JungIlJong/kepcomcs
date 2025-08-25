package com.kepco.app.domain.mbr.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.mbr.dto.Mbr;

public interface MbrService {
    List<Mbr> selectMbrList(Map<String, Object> searchMap);

    int selectMbrListTotCnt(Map<String, Object> searchMap);

    Mbr selectMbrDetailByUUID(String uuid);

    int countMbrById(String id);

    void insertMbr(Mbr mbr);

    Mbr insertMbr(Map<String, Object> map);

    void updateMbrByUUID(Mbr mbr);

    void deleteMbr(String uuid);

    void updateMbrLock(String uuid);

    List<Mbr> selectMbrPushList(Map<String, Object> searchMap);

    int selectMbrPushListTotCnt(Map<String, Object> searchMap);

    List<Mbr> selectMbrPushListAll(Map<String, Object> searchMap);

    int countMbrByEmail(Map<String, Object> searchMap);

    void withDrawMbr(String uuid);

    void blockMbr(Long frstRgstId);

    void reportMbr(Long frstRgstId);

    void updateMbrReportIds(String uuid);
}
