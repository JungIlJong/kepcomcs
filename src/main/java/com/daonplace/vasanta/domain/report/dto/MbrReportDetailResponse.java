package com.daonplace.vasanta.domain.report.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MbrReportDetailResponse {
    private Long reportId;
    private String targetType;
    private Long targetId;
    private Long reporterId;
    private String reasonCode;
    private String detailMessage;
    private String createdAt;

    private Long mbrId;
    private String mbrName;
    private String mbrEmail;
    private String mbrMobile;

    private String reporterName;
}
