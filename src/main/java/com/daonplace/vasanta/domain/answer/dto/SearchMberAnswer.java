package com.daonplace.vasanta.domain.answer.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class SearchMberAnswer extends ComSearchVO {
    @NotBlank
    String nttId;
}
