package com.kepco.app.domain.approval.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class InsertApprovalDocument {
    private String approvalTitle;

    private String approvalContent;

    private List<ApprovalLine> approvalLines;

}
