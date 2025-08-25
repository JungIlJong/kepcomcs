package com.daonplace.vasanta.domain.approval.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchApprovalDocument extends ComSearchVO {
    private String approvalStatus;
}
