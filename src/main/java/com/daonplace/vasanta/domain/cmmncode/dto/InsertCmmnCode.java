package com.daonplace.vasanta.domain.cmmncode.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertCmmnCode {

    private Long upperCodeId;

    private String codeNm;

    private String useYn;

    private int codeDepth;

}
