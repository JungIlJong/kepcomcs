package com.kepco.app.domain.block.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
public class Block {
    private Long blockId;
    private String targetType;
    private Long targetId;
    private Long blockerId;
    private LocalDateTime createdAt;
}
