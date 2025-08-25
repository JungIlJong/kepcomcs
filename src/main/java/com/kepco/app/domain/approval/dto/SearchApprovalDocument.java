package com.kepco.app.domain.approval.dto;

import com.kepco.app.core.vo.ComSearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchApprovalDocument extends ComSearchVO {
    private String approvalStatus;
}
