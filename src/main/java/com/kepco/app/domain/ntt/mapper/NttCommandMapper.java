package com.kepco.app.domain.ntt.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.ntt.dto.MberNtt;

import java.util.Map;

@Mapper
public interface NttCommandMapper {
    void insertNtt(MberNtt ntt);
    void updateNtt(MberNtt ntt);
    void incrementRdcnt(Long nttId);
    void deleteNtt(Long nttId);
    void reportNtt(Map<String, Object> reportMap);
    void blockNtt(Map<String, Object> blockMap);
}
