package com.daonplace.vasanta.domain.report.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
public class AnswerReportDetailResponse {
    private Long reportId;
    private String targetType;
    private Long targetId;
    private Long reporterId;
    // private String reasonCode;
    // private String detailMessage;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime createdAt;
    private Long answerId;
    private String answerContent;
    private Long postId;
    private String postTitle;
    private String reporterName;
}
