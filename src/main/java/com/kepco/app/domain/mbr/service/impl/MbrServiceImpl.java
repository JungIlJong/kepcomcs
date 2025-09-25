package com.kepco.app.domain.mbr.service.impl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.service.AuthrtService;
import com.kepco.app.domain.block.dto.BlockRequest;
import com.kepco.app.domain.block.service.BlockService;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbr.mapper.MbrMapper;
import com.kepco.app.domain.mbr.service.MbrService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("mbrService")
public class MbrServiceImpl extends EgovAbstractServiceImpl implements MbrService {

    private final MbrMapper mbrMapper;

    private final PasswordEncoder passwordEncoder;

    private final AuthrtService authrtService;

    private final BlockService blockService;

    private final String path = "mbr";

    @Override
    public List<Mbr> selectMbrList(Map<String, Object> searchMap) {
        return mbrMapper.selectMbrList(searchMap);
    }

    @Override
    public int selectMbrListTotCnt(Map<String, Object> searchMap) {
        return mbrMapper.selectMbrListTotCnt(searchMap);
    }

    @Override
    public Mbr selectMbrDetailByUUID(String uuid) {
        return mbrMapper.selectMbrDetailByUUID(uuid);
    }

    @Override
    public int countMbrById(String id) {
        return mbrMapper.countMbrById(id);
    }

    @Transactional
    @Override
    public void insertMbr(Mbr mbr) {
        mbr.setPswd(passwordEncoder.encode(mbr.getPswd()));
        mbrMapper.insertMbr(mbr);
        if (Objects.isNull(mbr.getAuthrtList())) {
            List<Authrt> authrtList = new ArrayList<>();
            Authrt authrt = new Authrt();
            authrt.setAuthrtId(2L);
            authrtList.add(authrt);
            mbr.setAuthrtList(authrtList);
        }
        authrtService.insertMbrAuthrtByMbrId(mbr);
    }

    @Transactional
    @Override
    public Mbr insertMbr(Map<String, Object> map) {
        Mbr mbr = new Mbr();
        mbr.setId(map.get("email").toString());
        mbr.setPswd(passwordEncoder.encode(UUID.randomUUID().toString()));
        mbr.setMbrNm(map.get("name").toString());
        mbr.setEmlAddr(map.get("email").toString());
        mbr.setLgnLckYn("N");
        mbr.setLgnFailNmtm("0");
        mbr.setFrstRegDt(LocalDateTime.now());
        mbr.setSttsCd("P");
        mbrMapper.insertMbr(mbr);

        List<Authrt> authrtList = new ArrayList<>();
        Authrt authrt = new Authrt();
        authrt.setAuthrtId(2L);
        authrtList.add(authrt);
        mbr.setAuthrtList(authrtList);
        authrtService.insertMbrAuthrtByMbrId(mbr);

        return mbr;
    }

    @Transactional
    @Override
    public void updateMbrByUUID(Mbr mbr) {
        if (StringUtils.hasText(mbr.getPswd())) {
            mbr.setPswd(passwordEncoder.encode(mbr.getPswd()));
        }
        mbrMapper.updateMbrByUUID(mbr);
        authrtService.deleteMbrAuthrtByUUID(mbr.getUuid());
        if (!Objects.isNull(mbr.getAuthrtList())) {
            authrtService.insertMbrAuthrtByUUID(mbr);
        }
    }

    @Transactional
    @Override
    public void deleteMbr(String uuid) {
        authrtService.deleteMbrAuthrtByUUID(uuid);
        mbrMapper.deleteMbr(uuid);
    }

    @Override
    public void updateMbrLock(String uuid) {
        mbrMapper.updateMbrLock(uuid);
    }

    @Override
    public List<Mbr> selectMbrPushList(Map<String, Object> searchMap) {
        return mbrMapper.selectMbrPushList(searchMap);
    }

    @Override
    public int selectMbrPushListTotCnt(Map<String, Object> searchMap) {
        return mbrMapper.selectMbrPushListTotCnt(searchMap);
    }

    @Override
    public List<Mbr> selectMbrPushListAll(Map<String, Object> searchMap) {
        return mbrMapper.selectMbrPushListAll(searchMap);
    }


    @Override
    public int countMbrByEmail(Map<String, Object> searchMap) {
        return mbrMapper.countMbrByEmail(searchMap);
    }

    @Transactional
    @Override
    public void withDrawMbr(String uuid) {
        mbrMapper.withDrawByUuid(uuid);

    }

    @Override
    @Transactional
    public void reportMbr(Long frstRgstId) {
        Map<String, Object> reportMap = new HashMap<>();
        reportMap.put("frstRgstId", frstRgstId);
        reportMap.put("mbrId", UserDetailsUtil.getMbrId());
        mbrMapper.reportMbr(reportMap);
        blockMbr(frstRgstId);
    }

    @Override
    @Transactional
    public void blockMbr(Long frstRgstId) {
        blockService.insertBlock(BlockRequest.builder()
                .blockerId(Long.valueOf(UserDetailsUtil.getMbrId()))
                .targetId(frstRgstId)
                .targetType(path)
                .build());
    }

    @Override
    public void updateMbrReportIds(String uuid) {
        mbrMapper.updateMbrReportIds(uuid);
    }
}
