package com.kepco.app.domain.approval.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.approval.dto.ApprovalHistory;

import java.util.List;
import java.util.Map;

@Mapper("approvalHistoryMapper")
public interface ApprovalHistoryMapper {
    List<Map<String, Object>> selectApprovalHistoryByApprovalDocumentId(Long approvalDocumentId);

    int insertApprovalHistory(ApprovalHistory approvalHistory);

}
