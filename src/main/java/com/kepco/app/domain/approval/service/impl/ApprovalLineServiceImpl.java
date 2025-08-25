package com.kepco.app.domain.approval.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.approval.dto.ApprovalLine;
import com.kepco.app.domain.approval.mapper.ApprovalLineMapper;
import com.kepco.app.domain.approval.service.ApprovalLineService;

import java.util.List;

@Service("approvalLineService")
public class ApprovalLineServiceImpl extends EgovAbstractServiceImpl implements ApprovalLineService {
    private final ApprovalLineMapper approvalLineMapper;

    public ApprovalLineServiceImpl(ApprovalLineMapper approvalLineMapper) {
        this.approvalLineMapper = approvalLineMapper;
    }

    @Override
    public int insertApprovalLine(List<ApprovalLine> approvalLines) {
        return approvalLineMapper.insertApprovalLine(approvalLines);
    }

    @Override
    public int cancelApprovalLine(Long approvalDocumentId) {
        return approvalLineMapper.cancelApprovalLine(approvalDocumentId);
    }

    @Override
    public int rejectApprovalLine(Long approvalLineId) {
        return approvalLineMapper.rejectApprovalLine(approvalLineId);
    }

    @Override
    public int acceptApprovalLine(Long approvalLineId) {
        return approvalLineMapper.acceptApprovalLine(approvalLineId);
    }

    @Override
    public int countAcceptApprovalLine(Long approvalDocumentId) {
        return approvalLineMapper.countAcceptApprovalLine(approvalDocumentId);
    }
}
