package com.kepco.app.domain.cmmncode.service;

import java.util.List;

import com.kepco.app.domain.cmmncode.dto.CmmnCode;

public interface CmmnCodeService {
    CmmnCode selectCmmnCodeByCodeId(String codeId);

    List<CmmnCode> selectCmmnCodeList();

    CmmnCode selectCmmnCodeByCode(String code);

    void insertCmmnCode(CmmnCode cmmnCode);

    void updateCmmnCode(CmmnCode cmmnCode);

    void deleteCmmnCodeByCodeId(Long codeId);

    List<CmmnCode> selectCmmnCodeListByUpperCodeId(Long upperCodeId);
}
