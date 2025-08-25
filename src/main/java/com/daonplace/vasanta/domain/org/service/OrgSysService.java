package com.daonplace.vasanta.domain.org.service;

import com.daonplace.vasanta.domain.org.dto.Org;
import org.aspectj.weaver.ast.Or;

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
