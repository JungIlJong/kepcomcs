package com.daonplace.vasanta.domain.approval.api;

import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import com.daonplace.vasanta.core.util.SearchUtil;
import com.daonplace.vasanta.domain.approval.dto.*;
import com.daonplace.vasanta.domain.approval.service.ApprovalDocumentService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/approval_documents")
public class ApprovalDocumentController {

    private final ApprovalDocumentService approvalDocumentService;

    private final ModelMapper modelMapper;

    private final EgovPropertyService propertiesService;

    private final ObjectMapper objectMapper;

    @GetMapping("/inboxes")
    public ResponseEntity<?> getInboxApprovalDocuments(@Validated SearchApprovalDocument searchDto) {
        Map<String, Object> searchMap = objectMapper.convertValue(searchDto, HashMap.class);
        searchMap.put("pageSize", propertiesService.getInt("pageSize"));
        searchMap.put("pageUnit", propertiesService.getInt("pageUnit"));
        searchMap.put("approverId", UserDetailsUtil.getMbrId());

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> data = approvalDocumentService.selectInboxApprovalDocumentList(searchMap);
        int totCnt = approvalDocumentService.selectInboxApprovalDocumentListTotCnt(searchMap);

        paginationInfo.setTotalRecordCount(totCnt);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", data);
        resultMap.put("paginationInfo", paginationInfo);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/outboxes")
    public ResponseEntity<?> getOutboxApprovalDocuments(@Validated SearchApprovalDocument searchDto) {
        Map<String, Object> searchMap = objectMapper.convertValue(searchDto, HashMap.class);
        searchMap.put("pageSize", propertiesService.getInt("pageSize"));
        searchMap.put("pageUnit", propertiesService.getInt("pageUnit"));
        searchMap.put("creatorId", UserDetailsUtil.getMbrId());

        PaginationInfo paginationInfo = SearchUtil.init(searchMap);

        List<Map<String, Object>> data = approvalDocumentService.selectOutboxApprovalDocumentList(searchMap);
        int totCnt = approvalDocumentService.selectOutboxApprovalDocumentListTotCnt(searchMap);

        paginationInfo.setTotalRecordCount(totCnt);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", data);
        resultMap.put("paginationInfo", paginationInfo);

        return CommonResponse.success(resultMap);
    }

    @GetMapping("/{approvalDocumentId}")
    public ResponseEntity<?> getInboxApprovalDocument(@PathVariable("approvalDocumentId") Long approvalDocumentId) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("approvalDocumentId", approvalDocumentId);
        paramMap.put("approverId", UserDetailsUtil.getMbrId());
        ApprovalDocument data = approvalDocumentService.selectApprovalDocument(paramMap);
        return CommonResponse.success(data);
    }

    @PostMapping("")
    public ResponseEntity<?> saveApprovalDocument(@RequestBody @Validated InsertApprovalDocument insertApprovalDocument) {
        ApprovalDocument approvalDocument = modelMapper.map(insertApprovalDocument, ApprovalDocument.class);
        approvalDocument.setCreatorId(Long.parseLong(UserDetailsUtil.getMbrId()));
        approvalDocumentService.insertApprovalDocument(approvalDocument);
        return ResponseEntity.ok(approvalDocument);
    }

    @PostMapping("/{approvalDocumentId}/cancel")
    public ResponseEntity<?> cancelApprovalDocument(@PathVariable("approvalDocumentId") Long approvalDocumentId, @RequestBody CancelApprovalDocument cancelApprovalDocument) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("approvalDocumentId", approvalDocumentId);
        paramMap.put("approvalComment", cancelApprovalDocument.getApprovalComment());
        paramMap.put("creatorId", UserDetailsUtil.getMbrId());
        approvalDocumentService.cancelApprovalDocument(paramMap);
        return CommonResponse.success(approvalDocumentId);
    }

    @PostMapping("/{approvalDocumentId}/reject")
    public ResponseEntity<?> rejectApprovalDocument(@PathVariable("approvalDocumentId") Long approvalDocumentId, @RequestBody RejectApprovalDocument rejectApprovalDocument) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("approverId", UserDetailsUtil.getMbrId());
        paramMap.put("approvalDocumentId", approvalDocumentId);
        paramMap.put("approvalLineId", rejectApprovalDocument.getApprovalLineId());
        paramMap.put("approvalComment", rejectApprovalDocument.getApprovalComment());
        approvalDocumentService.rejectApprovalDocument(paramMap);
        return CommonResponse.success(approvalDocumentId);
    }

    @PostMapping("/{approvalDocumentId}/accept")
    public ResponseEntity<?> acceptApprovalDocument(@PathVariable("approvalDocumentId") Long approvalDocumentId, @RequestBody AcceptApprovalDocument acceptApprovalDocument) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("approverId", UserDetailsUtil.getMbrId());
        paramMap.put("approvalDocumentId", approvalDocumentId);
        paramMap.put("approvalLineId", acceptApprovalDocument.getApprovalLineId());
        paramMap.put("approvalComment", acceptApprovalDocument.getApprovalComment());
        approvalDocumentService.acceptApprovalDocument(paramMap);
        return CommonResponse.success(approvalDocumentId);
    }

}

