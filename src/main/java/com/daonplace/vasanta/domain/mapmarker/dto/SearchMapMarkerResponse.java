package com.daonplace.vasanta.domain.mapmarker.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
public class SearchMapMarkerResponse {
    private Long markerId;
    private String name;
    private String description;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String iconUrl;
    private String roadAddress;
    private String jibunAddress;
    private String detailAddress;
    private String categoryCode1;
    private String categoryCode2;
    private String useYn;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime createdAt;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime updatedAt;

}
