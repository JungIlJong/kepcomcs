package com.daonplace.vasanta.domain.report.dto;

import lombok.Getter;

@Getter
public class InsertReport {
    private Long targetId;
    private Long reporterId;
    private String targetType;
    private String reasonCode;
    private String detailMessage;

    public InsertReport(Long targetId, String reporterId, String targetType) {
        this.targetId = targetId;
        this.reporterId = Long.valueOf(reporterId);
        this.targetType = targetType;
    }

    public InsertReport(Long targetId, Long reporterId, String targetType) {
        this.targetId = targetId;
        this.reporterId = reporterId;
        this.targetType = targetType;
    }

    public InsertReport(Long targetId, Long reporterId, String targetType, String reasonCode, String detailMessage) {
        this.targetId = targetId;
        this.reporterId = reporterId;
        this.targetType = targetType;
        this.reasonCode = reasonCode;
        this.detailMessage = detailMessage;
    }
}
