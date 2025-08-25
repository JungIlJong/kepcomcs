package com.daonplace.vasanta.domain.banner.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchBanner extends ComSearchVO {

    private String reflctAt;

    private String bannerSeCode;
}
