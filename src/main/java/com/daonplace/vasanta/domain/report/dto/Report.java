package com.daonplace.vasanta.domain.report.dto;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class Report {
    private Long reportId;
    private String targetType;
    private Long targetId;
    private Long reporterId;
    private String reasonCode;
    private String detailMessage;
    private LocalDateTime createdAt;

    @Builder(access = AccessLevel.PROTECTED)
    protected Report(String targetType, Long targetId, Long reporterId, String reasonCode, String detailMessage) {
        this.targetType = targetType;
        this.targetId = targetId;
        this.reporterId = reporterId;
        this.reasonCode = reasonCode;
        this.detailMessage = detailMessage;
    }

    public static Report of(InsertReport insertReport) {
        Report.ReportBuilder builder = Report.builder()
                .targetType(insertReport.getTargetType())
                .targetId(insertReport.getTargetId())
                .reporterId(insertReport.getReporterId());

        if (insertReport.getReasonCode() != null) {
            builder.reasonCode(insertReport.getReasonCode());
        }

        if (insertReport.getDetailMessage() != null) {
            builder.detailMessage(insertReport.getDetailMessage());
        }

        return builder.build();
    }
}