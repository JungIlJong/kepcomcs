package com.daonplace.vasanta.domain.org.mapper;

import com.daonplace.vasanta.domain.org.dto.Org;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper("orgSysMapper")
public interface OrgSysMapper {
    List<Org> selectOrgList();

    void deleteOrg(Long OrgId);

    void insertOrg(Org Org);

    void updateOrg(Org Org);

    int selectNextOrgOrdrByUpperOrgId(Long upperOrgId);

    Org selectOrgById(String OrgId);

    List<Org> selectOrgListByRole(List<String> authorityList);

    List<Org> selectOrgListAll();
}
