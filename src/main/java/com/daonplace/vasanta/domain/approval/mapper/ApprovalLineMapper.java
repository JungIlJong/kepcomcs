package com.daonplace.vasanta.domain.approval.mapper;

import com.daonplace.vasanta.domain.approval.dto.ApprovalLine;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


@Mapper("approvalLineMapper")
public interface ApprovalLineMapper {
    int insertApprovalLine(List<ApprovalLine> approvalLines);

    int cancelApprovalLine(Long approvalDocumentId);

    int rejectApprovalLine(Long approvalLineId);

    int acceptApprovalLine(Long approvalLineId);

    int countAcceptApprovalLine(Long approvalDocumentId);
}
