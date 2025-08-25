package com.kepco.app.domain.cmmncode.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Pattern;

@Getter
@Setter
public class UpdateCmmnCode {

    private Long codeId;

    @Pattern(regexp = "^[A-Z][A-Z0-9_]{2,19}$", message = "올바르지 않은 코드입니다. 다음 조건을 만족해주세요.\\n\\n1. 특수문자는 _만 허용됩니다.\\n2. 입력 값은 영어 대문자와 숫자의 조합이어야 합니다.\\n3. 첫 글자는 반드시 영어 대문자여야 합니다.\\n4. 입력 길이는 최소 3자, 최대 20자까지 허용됩니다.")
    private String code;

    private Long upperCodeId;

    private String codeNm;

    private int codeOrdr;

    private String useYn;

}
