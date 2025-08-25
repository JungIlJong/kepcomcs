package com.daonplace.vasanta.domain.block.mapper;

import com.daonplace.vasanta.domain.block.dto.Block;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BlockMapper {
    void insertBlock(Block block);
}
