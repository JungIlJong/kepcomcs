package com.kepco.app.domain.mbrOrg.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.service.AuthrtService;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;
import com.kepco.app.domain.mbrOrg.mapper.MbrOrgMapper;
import com.kepco.app.domain.mbrOrg.service.MbrOrgService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service("mbrOrgService")
public class MbrOrgServiceImpl extends EgovAbstractServiceImpl implements MbrOrgService {

    private final MbrOrgMapper mbrOrgMapper;

    private final PasswordEncoder passwordEncoder;

    private final AuthrtService authrtService;

    public MbrOrgServiceImpl(MbrOrgMapper mbrOrgMapper, PasswordEncoder passwordEncoder, AuthrtService authrtService) {
        this.mbrOrgMapper = mbrOrgMapper;
        this.passwordEncoder = passwordEncoder;
        this.authrtService = authrtService;
    }

    @Override
    public List<MbrOrg> selectMbrOrgList(Map<String, Object> searchMap) {
        return mbrOrgMapper.selectMbrOrgList(searchMap);
    }

    @Override
    public int selectMbrOrgListTotCnt(Map<String, Object> searchMap) {
        return mbrOrgMapper.selectMbrOrgListTotCnt(searchMap);
    }

    @Override
    public MbrOrg selectMbrOrgDetailByUUID(String uuid) {
        return mbrOrgMapper.selectMbrOrgDetailByUUID(uuid);
    }

    @Override
    public int countMbrOrgById(String id) {
        return mbrOrgMapper.countMbrOrgById(id);
    }

    @Transactional
    @Override
    public void insertMbr(MbrOrg mbrOrg) {
        mbrOrg.setPswd(passwordEncoder.encode(mbrOrg.getPswd()));
        mbrOrgMapper.insertMbr(mbrOrg);
        if (Objects.isNull(mbrOrg.getAuthrtList())) {
            List<Authrt> authrtList = new ArrayList<>();
            Authrt authrt = new Authrt();
            authrt.setAuthrtId(2L);
            authrtList.add(authrt);
            mbrOrg.setAuthrtList(authrtList);
        }
        mbrOrgMapper.insertMbrOrg(mbrOrg);
        authrtService.insertMbrOrgAuthrtByMbrId(mbrOrg);
    }

    @Transactional
    @Override
    public void updateMbrByUUID(MbrOrg mbrOrg) {
        if (StringUtils.hasText(mbrOrg.getPswd())) {
            mbrOrg.setPswd(passwordEncoder.encode(mbrOrg.getPswd()));
        }
        mbrOrgMapper.updateMbrByUUID(mbrOrg);
        authrtService.deleteMbrAuthrtByUUID(mbrOrg.getUuid());
        if (!Objects.isNull(mbrOrg.getAuthrtList())) {
            if (mbrOrg.getUuid() != null && !Objects.equals(mbrOrg.getUuid(), "")) {
                authrtService.insertMbrOrgAuthrtByUUID(mbrOrg);
            } else {
                authrtService.insertMbrOrgAuthrtByMbrId(mbrOrg);
            }
        }

        MbrOrg mbrOrgDetail = mbrOrgMapper.selectMbrOrgDetailByUUID(mbrOrg.getUuid());
        mbrOrgDetail.setOrgOrdr(mbrOrg.getOrgOrdr());
        mbrOrgDetail.setUpperOrgId(mbrOrg.getUpperOrgId());
        mbrOrgMapper.updateMbrOrgByUUID(mbrOrgDetail);
    }

    @Transactional
    @Override
    public void insertMbrOrg(MbrOrg mbrOrg) {
        mbrOrgMapper.insertMbrOrg(mbrOrg);
    }

    @Transactional
    @Override
    public void updateMbrOrgByUUID(MbrOrg mbrOrg) {
        mbrOrgMapper.updateMbrOrgByUUID(mbrOrg);
    }

    @Transactional
    @Override
    public void deleteMbrOrg(String uuid) {
        authrtService.deleteMbrAuthrtByUUID(uuid);
        MbrOrg mbrOrgDetail = mbrOrgMapper.selectMbrOrgDetailByUUID(uuid);
        mbrOrgMapper.deleteMbrOrg(mbrOrgDetail.getMbrId());
        mbrOrgMapper.deleteMbr(uuid);
    }

    @Override
    public void updateMbrOrgLock(String uuid) {
        mbrOrgMapper.updateMbrOrgLock(uuid);
    }

    @Override
    public List<MbrOrg> selectMbrOrgPushList(Map<String, Object> searchMap) {
        return mbrOrgMapper.selectMbrOrgPushList(searchMap);
    }

    @Override
    public int selectMbrOrgPushListTotCnt(Map<String, Object> searchMap) {
        return mbrOrgMapper.selectMbrOrgPushListTotCnt(searchMap);
    }

    @Override
    public List<MbrOrg> selectMbrOrgPushListAll(Map<String, Object> searchMap) {
        return mbrOrgMapper.selectMbrOrgPushListAll(searchMap);
    }

    @Override
    public int countMbrOrgByEmail(Map<String, Object> searchMap) {
        return mbrOrgMapper.countMbrOrgByEmail(searchMap);
    }

}
