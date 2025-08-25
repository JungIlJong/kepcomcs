package com.kepco.app.domain.block.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BlockRequest {
    private String targetType;
    private Long targetId;
    private Long blockerId;

    @Builder
    public BlockRequest(String targetType, Long targetId, Long blockerId) {
        this.targetType = targetType;
        this.targetId = targetId;
        this.blockerId = blockerId;
    }

    public Block toBlock() {
        return Block.builder()
                .targetType(targetType)
                .targetId(targetId)
                .blockerId(blockerId)
                .build();
    }
}
