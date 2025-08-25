package com.daonplace.vasanta.domain.report.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ResetReportRequest {

    @Min(1)
    private Long targetId;

    @NotBlank
    private String targetType;
}
