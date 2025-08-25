package com.daonplace.vasanta.domain.cmmncode.service;

import com.daonplace.vasanta.domain.cmmncode.dto.CmmnCode;

import java.util.List;

public interface CmmnCodeService {
    CmmnCode selectCmmnCodeByCodeId(String codeId);

    List<CmmnCode> selectCmmnCodeList();

    CmmnCode selectCmmnCodeByCode(String code);

    void insertCmmnCode(CmmnCode cmmnCode);

    void updateCmmnCode(CmmnCode cmmnCode);

    void deleteCmmnCodeByCodeId(Long codeId);

    List<CmmnCode> selectCmmnCodeListByUpperCodeId(Long upperCodeId);
}
