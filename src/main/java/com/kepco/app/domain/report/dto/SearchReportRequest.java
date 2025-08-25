package com.kepco.app.domain.report.dto;

import com.kepco.app.core.vo.ComSearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchReportRequest extends ComSearchVO {
    private String targetType;
    private Long targetId;
    private Long reporterId;
}
