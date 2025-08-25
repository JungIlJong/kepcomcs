package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Size;

import com.kepco.app.core.vo.ComSearchVO;

@Getter
@Setter
public class SearchSysNtt extends ComSearchVO {
    @Size(max = 20)
    private String bbsId;
}
