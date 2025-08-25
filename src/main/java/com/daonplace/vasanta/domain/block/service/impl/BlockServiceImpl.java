package com.daonplace.vasanta.domain.block.service.impl;

import com.daonplace.vasanta.domain.block.dto.BlockRequest;
import com.daonplace.vasanta.domain.block.mapper.BlockMapper;
import com.daonplace.vasanta.domain.block.service.BlockService;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
