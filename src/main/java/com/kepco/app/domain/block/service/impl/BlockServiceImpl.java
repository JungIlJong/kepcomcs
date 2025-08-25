package com.kepco.app.domain.block.service.impl;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.block.dto.BlockRequest;
import com.kepco.app.domain.block.mapper.BlockMapper;
import com.kepco.app.domain.block.service.BlockService;

@RequiredArgsConstructor
@Service("blockService")
public class BlockServiceImpl extends EgovAbstractServiceImpl implements BlockService {
    private final BlockMapper blockMapper;

    @Transactional
    @Override
    public void insertBlock(BlockRequest request) {
        blockMapper.insertBlock(request.toBlock());
    }
}
