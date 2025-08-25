package com.daonplace.vasanta.domain.ntt.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Size;

@Getter
@Setter
public class SearchSysNtt extends ComSearchVO {
    @Size(max = 20)
    private String bbsId;
}
