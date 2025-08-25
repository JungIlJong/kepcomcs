package com.daonplace.vasanta.domain.block.service;

import com.daonplace.vasanta.domain.block.dto.Block;
import com.daonplace.vasanta.domain.block.dto.BlockRequest;

public interface BlockService {
    void insertBlock(BlockRequest request);
}
