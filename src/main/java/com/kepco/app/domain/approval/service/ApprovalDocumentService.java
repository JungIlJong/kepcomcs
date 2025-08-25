package com.kepco.app.domain.approval.service;

import java.util.List;
import java.util.Map;

import com.kepco.app.domain.approval.dto.ApprovalDocument;

public interface ApprovalDocumentService {
    ApprovalDocument selectApprovalDocument(Map<String, Object> paramMap);

    void insertApprovalDocument(ApprovalDocument approvalDocument);

    List<Map<String, Object>> selectInboxApprovalDocumentList(Map<String, Object> searchMap);

    int selectInboxApprovalDocumentListTotCnt(Map<String, Object> searchMap);

    List<Map<String, Object>> selectOutboxApprovalDocumentList(Map<String, Object> searchMap);

    int selectOutboxApprovalDocumentListTotCnt(Map<String, Object> searchMap);

    void cancelApprovalDocument(Map<String, Object> paramMap);

    void rejectApprovalDocument(Map<String, Object> paramMap);

    void acceptApprovalDocument(Map<String, Object> paramMap);

}
