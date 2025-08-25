package com.daonplace.vasanta.domain.approval.mapper;

import com.daonplace.vasanta.domain.approval.dto.ApprovalHistory;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("approvalHistoryMapper")
public interface ApprovalHistoryMapper {
    List<Map<String, Object>> selectApprovalHistoryByApprovalDocumentId(Long approvalDocumentId);

    int insertApprovalHistory(ApprovalHistory approvalHistory);

}
