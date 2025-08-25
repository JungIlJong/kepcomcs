package com.kepco.app.domain.sample.dto;

import com.kepco.app.core.vo.ComSearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SampleSearchRequest extends ComSearchVO {
    private String user;
}
