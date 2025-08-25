package com.kepco.app.domain.approval.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.approval.dto.ApprovalDocument;

import java.util.List;
import java.util.Map;



@Mapper("approvalDocumentMapper")
public interface ApprovalDocumentMapper {
    ApprovalDocument selectApprovalDocument(Map<String, Object> paramMap);

    int insertApprovalDocument(ApprovalDocument approvalDocument);

    List<Map<String, Object>> selectInboxApprovalDocumentList(Map<String, Object> searchMap);

    int selectInboxApprovalDocumentListTotCnt(Map<String, Object> searchMap);

    List<Map<String, Object>> selectOutboxApprovalDocumentList(Map<String, Object> searchMap);

    int selectOutboxApprovalDocumentListTotCnt(Map<String, Object> searchMap);

    int cancelApprovalDocument(Long approvalDocumentId);

    int rejectApprovalDocument(Long approvalDocumentId);

    int acceptApprovalDocument(Long approvalDocumentId);

    int pendingApprovalDocument(Long approvalDocumentId);

}
