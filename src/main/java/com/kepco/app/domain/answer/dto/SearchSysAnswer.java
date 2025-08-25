package com.kepco.app.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

import com.kepco.app.core.vo.ComSearchVO;

@Getter
@Setter
public class SearchSysAnswer extends ComSearchVO {
    @NotBlank
    private String nttId;
}
