package com.daonplace.vasanta.domain.cmmncode.mapper;

import com.daonplace.vasanta.domain.cmmncode.dto.CmmnCode;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
