package com.daonplace.vasanta.domain.approval.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ApprovalLine {
    private Long approvalLineId;

    private Long approvalDocumentId;

    private Long approverId;

    private String approverUuid;

    private String approverNm;

    private int approvalOrder;

    private String approvalStatus;

    private String approvalComment;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime approvedAt;

}
