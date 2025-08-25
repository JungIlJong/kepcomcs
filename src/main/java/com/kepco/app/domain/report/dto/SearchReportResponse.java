package com.kepco.app.domain.report.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class SearchReportResponse {
    private Long reportId;
    private String targetType;
    private Reporter reporter;
    private Target target;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime createdAt;


    @Getter
    protected static class Reporter {
        private Long mbrId;
        private String mbrNm;
    }

    @Getter
    protected static class Target {
        private Long targetId;
        private String targetName;
    }
}
