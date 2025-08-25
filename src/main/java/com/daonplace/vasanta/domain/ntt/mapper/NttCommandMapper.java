package com.daonplace.vasanta.domain.ntt.mapper;

import com.daonplace.vasanta.domain.ntt.dto.MberNtt;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
