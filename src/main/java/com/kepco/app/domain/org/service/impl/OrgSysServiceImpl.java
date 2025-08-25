package com.kepco.app.domain.org.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.org.dto.Org;
import com.kepco.app.domain.org.mapper.OrgSysMapper;
import com.kepco.app.domain.org.service.OrgSysService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Service("orgSysService")
public class OrgSysServiceImpl extends EgovAbstractServiceImpl implements OrgSysService {

    private final OrgSysMapper orgSysMapper;

    public OrgSysServiceImpl(OrgSysMapper orgSysMapper) {
        this.orgSysMapper = orgSysMapper;
    }

    @Override
    public List<Org> selectOrgList() {
        return orgSysMapper.selectOrgList();
    }

    @Override
    public void insertOrg(Org org) throws Exception {
        int OrgOrdr = orgSysMapper.selectNextOrgOrdrByUpperOrgId(org.getUpperOrgId());
        org.setOrgOrdr(OrgOrdr);
        orgSysMapper.insertOrg(org);
    }

    @Override
    public void updateOrg(Org org) {
        orgSysMapper.updateOrg(org);
    }

    @Override
    public Org selectOrgById(String orgId) {
        return orgSysMapper.selectOrgById(orgId);
    }

    @Override
    public List<Org> selectOrgListAll() {
        return orgSysMapper.selectOrgListAll();
    }

    @Override
    @Transactional
    public void deleteOrg(Map<String, Object> paramMap) {
        String orgId = (String) paramMap.get("orgId");
        orgSysMapper.deleteOrg(Long.parseLong(orgId));
        if (paramMap.get("childrenList") != null) {
            List<String> childrenList = (ArrayList<String>) paramMap.get("childrenList");
            for (String childern : childrenList) {
                orgSysMapper.deleteOrg(Long.parseLong(childern));
            }
        }
    }
}
