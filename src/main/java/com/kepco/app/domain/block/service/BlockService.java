package com.kepco.app.domain.block.service;

import com.kepco.app.domain.block.dto.Block;
import com.kepco.app.domain.block.dto.BlockRequest;

public interface BlockService {
    void insertBlock(BlockRequest request);
}
