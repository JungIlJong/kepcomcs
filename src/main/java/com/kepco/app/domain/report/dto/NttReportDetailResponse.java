package com.kepco.app.domain.report.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class NttReportDetailResponse {
    private Long reportId;
    private String targetType;
    private Long targetId;
    private Long reporterId;
    private String reasonCode;
    private String detailMessage;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime createdAt;
    private Long nttId;
    private String nttTitle;
    private String nttContent;
    private String writerName;
    private String reporterName;
}
