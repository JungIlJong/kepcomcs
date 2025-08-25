package com.kepco.app.domain.approval.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.approval.dto.ApprovalHistory;
import com.kepco.app.domain.approval.mapper.ApprovalHistoryMapper;
import com.kepco.app.domain.approval.service.ApprovalHistoryService;

import java.util.List;
import java.util.Map;

@Service("approvalHistoryService")
public class ApprovalHistoryServiceImpl extends EgovAbstractServiceImpl implements ApprovalHistoryService {
    private final ApprovalHistoryMapper approvalHistoryMapper;

    public ApprovalHistoryServiceImpl(ApprovalHistoryMapper approvalHistoryMapper) {
        this.approvalHistoryMapper = approvalHistoryMapper;
    }

    @Override
    public List<Map<String, Object>> selectApprovalHistoryByApprovalDocumentId(Long approvalDocumentId) {
        return approvalHistoryMapper.selectApprovalHistoryByApprovalDocumentId(approvalDocumentId);
    }

    @Override
    public int insertApprovalHistory(ApprovalHistory approvalHistory) {
        return approvalHistoryMapper.insertApprovalHistory(approvalHistory);
    }

}
