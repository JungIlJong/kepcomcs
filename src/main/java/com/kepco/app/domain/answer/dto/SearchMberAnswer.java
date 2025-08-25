package com.kepco.app.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

import com.kepco.app.core.vo.ComSearchVO;

@Getter
@Setter
public class SearchMberAnswer extends ComSearchVO {
    @NotBlank
    String nttId;
}
