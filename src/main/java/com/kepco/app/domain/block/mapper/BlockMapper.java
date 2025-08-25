package com.kepco.app.domain.block.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.block.dto.Block;

@Mapper
public interface BlockMapper {
    void insertBlock(Block block);
}
