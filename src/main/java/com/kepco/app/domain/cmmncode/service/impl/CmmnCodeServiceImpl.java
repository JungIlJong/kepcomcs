package com.kepco.app.domain.cmmncode.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.cmmncode.dto.CmmnCode;
import com.kepco.app.domain.cmmncode.mapper.CmmnCodeMapper;
import com.kepco.app.domain.cmmncode.service.CmmnCodeService;

import java.util.Collections;
import java.util.List;

@Service("cmmnCodeService")
public class CmmnCodeServiceImpl extends EgovAbstractServiceImpl implements CmmnCodeService {

    private final CmmnCodeMapper cmmnCodeMapper;

    public CmmnCodeServiceImpl(CmmnCodeMapper cmmnCodeMapper) {
        this.cmmnCodeMapper = cmmnCodeMapper;
    }

    @Override
    public CmmnCode selectCmmnCodeByCodeId(String codeId) {
        return cmmnCodeMapper.selectCmmnCodeByCodeId(codeId);
    }

    @Override
    public List<CmmnCode> selectCmmnCodeList() {
        return cmmnCodeMapper.selectCmmnCodeList();
    }

    @Override
    public CmmnCode selectCmmnCodeByCode(String code) {
        return cmmnCodeMapper.selectCmmnCodeByCode(code);
    }

    @Override
    public void insertCmmnCode(CmmnCode cmmnCode) {
        int codeOrdr = cmmnCodeMapper.selectNextCodeOrdrByUpperCodeId(cmmnCode.getUpperCodeId());
        cmmnCode.setCodeOrdr(codeOrdr);
        cmmnCodeMapper.insertCmmnCode(cmmnCode);
    }

    @Override
    public void updateCmmnCode(CmmnCode cmmnCode) {
        cmmnCodeMapper.updateCmmnCode(cmmnCode);
    }

    @Override
    public void deleteCmmnCodeByCodeId(Long codeId) {
        cmmnCodeMapper.deleteCmmnCodeByCodeId(codeId);
    }

    @Override
    public List<CmmnCode> selectCmmnCodeListByUpperCodeId(Long upperCodeId) {
        return cmmnCodeMapper.selectCmmnCodeListByUpperCodeId(upperCodeId);
    }
}
