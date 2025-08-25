package com.kepco.app.domain.org.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class InsertOrg {

    private String id;

    @NotBlank
    private String orgNm;

    private Long upperOrgId;

    private int orgOrdr;

    private int orgDp;

    private String useAt;

}
