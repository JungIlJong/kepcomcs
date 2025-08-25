package com.kepco.app.domain.authrt.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.mapper.AuthrtMapper;
import com.kepco.app.domain.authrt.service.AuthrtService;
import com.kepco.app.domain.mbr.dto.Mbr;
import com.kepco.app.domain.mbrOrg.dto.MbrOrg;
import com.kepco.app.domain.menu.dto.Menu;

import java.util.List;
import java.util.Map;

@Service("authrtService")
public class AuthrtServiceImpl extends EgovAbstractServiceImpl implements AuthrtService {

    private final AuthrtMapper authrtMapper;

    public AuthrtServiceImpl(AuthrtMapper authrtMapper) {
        this.authrtMapper = authrtMapper;
    }

    @Override
    public List<Authrt> selectAuthrtList(Map<String, Object> searchMap) {
        return authrtMapper.selectAuthrtList(searchMap);
    }

    @Override
    public int selectAuthrtListTotCnt(Map<String, Object> searchMap) {
        return authrtMapper.selectAuthrtListTotCnt(searchMap);
    }

    @Override
    public Authrt selectAuthrtDetail(Long authrtId) {
        Authrt authrt = authrtMapper.selectAuthrtDetail(authrtId);
        List<Menu> menuList = authrtMapper.selectMenuAuthrtList(authrtId);
        authrt.setMenuList(menuList);
        return authrt;
    }

    @Transactional
    @Override
    public void insertAuthrt(Authrt authrt) {
        authrtMapper.insertAuthrt(authrt);
        authrtMapper.insertMenuAuthrt(authrt);
    }

    @Transactional
    @Override
    public void updateAuthrt(Authrt authrt) {
        authrtMapper.updateAuthrt(authrt);
        authrtMapper.deleteMenuAuthrt(authrt.getAuthrtId());
        authrtMapper.insertMenuAuthrt(authrt);
    }

    @Transactional
    @Override
    public void deleteAuthrt(Long authrtId) {
        authrtMapper.deleteAuthrt(authrtId);
        authrtMapper.deleteMenuAuthrt(authrtId);
        authrtMapper.deleteMbrAuthrt(authrtId);
//        authrtMapper.deleteBbsAuthrt(authrtId);
    }

    @Override
    public List<Authrt> selectAllAuthrtList() {
        return authrtMapper.selectAllAuthrtList();
    }

    @Override
    public void deleteMbrAuthrtByUUID(String uuid) {
        authrtMapper.deleteMbrAuthrtByUUID(uuid);
    }

    @Override
    public void insertMbrAuthrtByUUID(Mbr mbr) {
        authrtMapper.insertMbrAuthrtByUUID(mbr);
    }

    @Override
    public void insertMbrAuthrtByMbrId(Mbr mbr) {
        authrtMapper.insertMbrAuthrtByMbrId(mbr);
    }

    @Override
    public void insertMbrOrgAuthrtByUUID(MbrOrg mbrorg) {
        authrtMapper.insertMbrOrgAuthrtByUUID(mbrorg);
    }

    @Override
    public void insertMbrOrgAuthrtByMbrId(MbrOrg mbrorg) {
        authrtMapper.insertMbrOrgAuthrtByMbrId(mbrorg);
    }
}
