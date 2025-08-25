package com.daonplace.vasanta.domain.report.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchReportRequest extends ComSearchVO {
    private String targetType;
    private Long targetId;
    private Long reporterId;
}
