package com.kepco.app.domain.org.service;

import org.aspectj.weaver.ast.Or;

import com.kepco.app.domain.org.dto.Org;

import java.util.List;
import java.util.Map;

public interface OrgSysService {
    List<Org> selectOrgList();

    void deleteOrg(Map<String, Object> paramMap);

    void insertOrg(Org org) throws Exception;

    void updateOrg(Org org);

    Org selectOrgById(String OrgId);

    List<Org> selectOrgListAll();
}
