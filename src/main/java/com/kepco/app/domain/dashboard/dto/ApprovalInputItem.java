package com.kepco.app.domain.dashboard.dto;

import lombok.Getter;

@Getter
public class ApprovalInputItem {
    private Long approvalDocumentId;
    private String mbrNm;
    private String approvalTitle;
    private String approvalStatusNm;
    private String approvalStatus;
    private String createdAt;
}
