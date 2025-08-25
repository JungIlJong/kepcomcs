package com.kepco.app.domain.approval.service;

import java.util.List;

import com.kepco.app.domain.approval.dto.ApprovalLine;

public interface ApprovalLineService {
    int insertApprovalLine(List<ApprovalLine> approvalLines);

    int cancelApprovalLine(Long approvalDocumentId);

    int rejectApprovalLine(Long approvalLineId);

    int acceptApprovalLine(Long approvalLineId);

    int countAcceptApprovalLine(Long approvalDocumentId);

}
