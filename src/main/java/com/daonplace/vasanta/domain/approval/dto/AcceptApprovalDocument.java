package com.daonplace.vasanta.domain.approval.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AcceptApprovalDocument {
    private Long approvalLineId;

    private String approvalComment;
}
