package com.kepco.app.domain.approval.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.approval.dto.ApprovalHistory;

public interface ApprovalHistoryService {
    List<Map<String, Object>> selectApprovalHistoryByApprovalDocumentId(Long approvalDocumentId);

    int insertApprovalHistory(ApprovalHistory approvalHistory);
}
