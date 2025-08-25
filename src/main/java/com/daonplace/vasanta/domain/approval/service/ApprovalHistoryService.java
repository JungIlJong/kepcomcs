package com.daonplace.vasanta.domain.approval.service;

import com.daonplace.vasanta.domain.approval.dto.ApprovalHistory;

import java.util.List;
import java.util.Map;

public interface ApprovalHistoryService {
    List<Map<String, Object>> selectApprovalHistoryByApprovalDocumentId(Long approvalDocumentId);

    int insertApprovalHistory(ApprovalHistory approvalHistory);
}
