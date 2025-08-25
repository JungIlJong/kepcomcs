package com.daonplace.vasanta.domain.approval.service.impl;

import com.daonplace.vasanta.domain.approval.dto.ApprovalDocument;
import com.daonplace.vasanta.domain.approval.dto.ApprovalHistory;
import com.daonplace.vasanta.domain.approval.dto.ApprovalLine;
import com.daonplace.vasanta.domain.approval.exception.ApprovalDocumentException;
import com.daonplace.vasanta.domain.approval.mapper.ApprovalDocumentMapper;
import com.daonplace.vasanta.domain.approval.service.ApprovalDocumentService;
import com.daonplace.vasanta.domain.approval.service.ApprovalHistoryService;
import com.daonplace.vasanta.domain.approval.service.ApprovalLineService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

@Service("approvalDocumentService")
public class ApprovalDocumentServiceImpl extends EgovAbstractServiceImpl implements ApprovalDocumentService {
    private final ApprovalDocumentMapper approvalDocumentMapper;

    private final ApprovalHistoryService approvalHistoryService;

    private final ApprovalLineService approvalLineService;

    public ApprovalDocumentServiceImpl(ApprovalDocumentMapper approvalDocumentMapper, ApprovalHistoryService approvalHistoryService, ApprovalLineService approvalLineService) {
        this.approvalDocumentMapper = approvalDocumentMapper;
        this.approvalHistoryService = approvalHistoryService;
        this.approvalLineService = approvalLineService;
    }

    @Override
    public ApprovalDocument selectApprovalDocument(Map<String, Object> paramMap) {
        return approvalDocumentMapper.selectApprovalDocument(paramMap);
    }

    @Transactional
    @Override
    public void insertApprovalDocument(ApprovalDocument approvalDocument) {
        LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
        approvalDocument.setApprovalStatus("N");
        approvalDocument.setCreatedAt(now);
        int documentInsertResult = approvalDocumentMapper.insertApprovalDocument(approvalDocument);

        List<ApprovalLine> approvalLines = approvalDocument.getApprovalLines();

        for (int i = 0; i < approvalLines.size(); i++) {
            ApprovalLine approvalLine = approvalLines.get(i);

            approvalLine.setApprovalDocumentId(approvalDocument.getApprovalDocumentId());

            if (i == 0) {
                approvalLine.setApprovalStatus("N");
            } else {
                approvalLine.setApprovalStatus("P");
            }
        }

        int lineInsertResult = approvalLineService.insertApprovalLine(approvalLines);

        ApprovalHistory approvalHistory = new ApprovalHistory();
        approvalHistory.setApprovalDocumentId(approvalDocument.getApprovalDocumentId());
        approvalHistory.setApproverId(approvalDocument.getCreatorId());
        approvalHistory.setApprovalStatus("N");
        approvalHistory.setApprovedAt(approvalDocument.getCreatedAt());

        int historyInsertResult = approvalHistoryService.insertApprovalHistory(approvalHistory);

    }

    @Override
    public List<Map<String, Object>> selectInboxApprovalDocumentList(Map<String, Object> searchMap) {
        return approvalDocumentMapper.selectInboxApprovalDocumentList(searchMap);
    }

    @Override
    public int selectInboxApprovalDocumentListTotCnt(Map<String, Object> searchMap) {
        return approvalDocumentMapper.selectInboxApprovalDocumentListTotCnt(searchMap);
    }

    @Override
    public List<Map<String, Object>> selectOutboxApprovalDocumentList(Map<String, Object> searchMap) {
        return approvalDocumentMapper.selectOutboxApprovalDocumentList(searchMap);
    }

    @Override
    public int selectOutboxApprovalDocumentListTotCnt(Map<String, Object> searchMap) {
        return approvalDocumentMapper.selectOutboxApprovalDocumentListTotCnt(searchMap);
    }

    @Transactional
    @Override
    public void cancelApprovalDocument(Map<String, Object> paramMap) {
        LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));

        Long approvalDocumentId = (Long) paramMap.get("approvalDocumentId");
        Long creatorId = Long.parseLong(String.valueOf(paramMap.get("creatorId")));
        String approvalComment = (String) paramMap.get("approvalComment");

        ApprovalDocument approvalDocument = approvalDocumentMapper.selectApprovalDocument(paramMap);

        if (!approvalDocument.getCreatorId().equals(creatorId)) {
            throw new ApprovalDocumentException("기안자가 아닙니다.");
        }

        if (!approvalDocument.getApprovalStatus().equals("N")) {
            throw new ApprovalDocumentException("결재전 상태만 결재취소가 가능합니다.");
        }

        int documentCancelResult = approvalDocumentMapper.cancelApprovalDocument(approvalDocumentId);

        if (documentCancelResult < 1) {
            throw new ApprovalDocumentException("결재취소에 실패하였습니다.");
        }

        ApprovalHistory approvalHistory = new ApprovalHistory();
        approvalHistory.setApprovalDocumentId(approvalDocumentId);
        approvalHistory.setApproverId(creatorId);
        approvalHistory.setApprovalStatus("C");
        approvalHistory.setApprovedAt(now);
        approvalHistory.setApprovalComment(approvalComment);

        int historyInsertResult = approvalHistoryService.insertApprovalHistory(approvalHistory);
        if (historyInsertResult < 1) {
            throw new ApprovalDocumentException("결재취소 이력 등록에 실패하였습니다.");
        }
    }

    @Transactional
    @Override
    public void rejectApprovalDocument(Map<String, Object> paramMap) {
        LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));

        Long approvalDocumentId = (Long) paramMap.get("approvalDocumentId");
        Long approvalLineId = (Long) paramMap.get("approvalLineId");
        Long approverId = Long.parseLong(String.valueOf(paramMap.get("approverId")));
        String approvalComment = (String) paramMap.get("approvalComment");

        int documentRejectResult = approvalDocumentMapper.rejectApprovalDocument(approvalDocumentId);
        if (documentRejectResult < 1) {
            throw new ApprovalDocumentException("결재반려에 실패하였습니다.");
        }

        int lineRejectResult = approvalLineService.rejectApprovalLine(approvalLineId);
        if (lineRejectResult < 1) {
            throw new ApprovalDocumentException("결재라인반려에 실패하였습니다.");
        }

        ApprovalHistory approvalHistory = new ApprovalHistory();
        approvalHistory.setApprovalDocumentId(approvalDocumentId);
        approvalHistory.setApproverId(approverId);
        approvalHistory.setApprovalStatus("D");
        approvalHistory.setApprovedAt(now);
        approvalHistory.setApprovalComment(approvalComment);

        int historyInsertResult = approvalHistoryService.insertApprovalHistory(approvalHistory);
        if (historyInsertResult < 1) {
            throw new ApprovalDocumentException("결재반려 이력 등록에 실패하였습니다.");
        }

    }

    @Transactional
    @Override
    public void acceptApprovalDocument(Map<String, Object> paramMap) {
        LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));

        Long approvalDocumentId = (Long) paramMap.get("approvalDocumentId");
        Long approvalLineId = (Long) paramMap.get("approvalLineId");
        Long approverId = Long.parseLong(String.valueOf(paramMap.get("approverId")));
        String approvalComment = (String) paramMap.get("approvalComment");

        int lineAcceptResult = approvalLineService.acceptApprovalLine(approvalLineId);
        if (lineAcceptResult < 1) {
            throw new ApprovalDocumentException("결재라인승인에 실패하였습니다.");
        }

        ApprovalHistory approvalHistory = new ApprovalHistory();
        approvalHistory.setApprovalDocumentId(approvalDocumentId);
        approvalHistory.setApproverId(approverId);
        approvalHistory.setApprovalStatus("A");
        approvalHistory.setApprovedAt(now);
        approvalHistory.setApprovalComment(approvalComment);

        int historyInsertResult = approvalHistoryService.insertApprovalHistory(approvalHistory);
        if (historyInsertResult < 1) {
            throw new ApprovalDocumentException("결재승인 이력 등록에 실패하였습니다.");
        }

        int acceptCountResult = approvalLineService.countAcceptApprovalLine(approvalDocumentId);
        if (acceptCountResult < 1) {
            int documentAcceptResult = approvalDocumentMapper.acceptApprovalDocument(approvalDocumentId);
            if (documentAcceptResult < 1) {
                throw new ApprovalDocumentException("결재승인에 실패하였습니다.");
            }
        } else {
            int documentPendingResult = approvalDocumentMapper.pendingApprovalDocument(approvalDocumentId);
            if (documentPendingResult < 1) {
                throw new ApprovalDocumentException("결재중 처리에 실패하였습니다.");
            }
        }
    }

}
