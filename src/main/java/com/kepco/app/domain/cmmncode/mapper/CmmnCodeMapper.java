package com.kepco.app.domain.cmmncode.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.cmmncode.dto.CmmnCode;

import java.util.List;

@Mapper
public interface CmmnCodeMapper {
    CmmnCode selectCmmnCodeByCodeId(String codeId);

    List<CmmnCode> selectCmmnCodeList();

    CmmnCode selectCmmnCodeByCode(String code);

    void insertCmmnCode(CmmnCode cmmnCode);

    int selectNextCodeOrdrByUpperCodeId(Long upperCodeId);

    void updateCmmnCode(CmmnCode cmmnCode);

    void deleteCmmnCodeByCodeId(Long codeId);

    List<CmmnCode> selectCmmnCodeListByUpperCodeId(Long upperCodeId);
}
