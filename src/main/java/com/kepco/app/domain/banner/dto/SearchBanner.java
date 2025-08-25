package com.kepco.app.domain.banner.dto;

import com.kepco.app.core.vo.ComSearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchBanner extends ComSearchVO {

    private String reflctAt;

    private String bannerSeCode;
}
