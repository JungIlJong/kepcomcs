package com.kepco.app.domain.org.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Alias(value = "org")
public class Org {

    private Long orgId;

    private String id;

    private String orgNm;

    private Long upperOrgId;

    private int orgOrdr;

    private int orgDp;

    private String useAt;

}
