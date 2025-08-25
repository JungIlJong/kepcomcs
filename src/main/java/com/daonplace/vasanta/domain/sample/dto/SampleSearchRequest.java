package com.daonplace.vasanta.domain.sample.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SampleSearchRequest extends ComSearchVO {
    private String user;
}
