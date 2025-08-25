package com.kepco.app.domain.approval.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.approval.dto.ApprovalLine;

import java.util.List;


@Mapper("approvalLineMapper")
public interface ApprovalLineMapper {
    int insertApprovalLine(List<ApprovalLine> approvalLines);

    int cancelApprovalLine(Long approvalDocumentId);

    int rejectApprovalLine(Long approvalLineId);

    int acceptApprovalLine(Long approvalLineId);

    int countAcceptApprovalLine(Long approvalDocumentId);
}
