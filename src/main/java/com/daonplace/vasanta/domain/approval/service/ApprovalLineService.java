package com.daonplace.vasanta.domain.approval.service;

import com.daonplace.vasanta.domain.approval.dto.ApprovalLine;

import java.util.List;

public interface ApprovalLineService {
    int insertApprovalLine(List<ApprovalLine> approvalLines);

    int cancelApprovalLine(Long approvalDocumentId);

    int rejectApprovalLine(Long approvalLineId);

    int acceptApprovalLine(Long approvalLineId);

    int countAcceptApprovalLine(Long approvalDocumentId);

}
