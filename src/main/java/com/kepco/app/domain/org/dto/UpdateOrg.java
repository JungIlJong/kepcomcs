package com.kepco.app.domain.org.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateOrg {

    private Long orgId;

    private String id;

    private String orgNm;

    private Long upperOrgId;

    private int orgOrdr;

    private String useAt;

}
