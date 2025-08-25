package com.daonplace.vasanta.domain.mapmarker.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchMapMarkerRequest extends ComSearchVO {
    private String categoryCode1;
    private String categoryCode2;
}
