package com.daonplace.vasanta.domain.mapmarker.dto;

import lombok.Getter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;

@Getter
public class InsertMapMarker {

    @NotBlank
    @Length(min = 1, max = 255)
    private String name;
    private String description;
    private BigDecimal latitude;
    private BigDecimal longitude;

    @Length(max = 255)
    private String iconUrl;

    @NotBlank
    private String roadAddress;
    private String jibunAddress;
    private String detailAddress;

    @NotBlank
    private String categoryCode1;

    private String categoryCode2;

    @NotBlank
    private String useYn;
}
