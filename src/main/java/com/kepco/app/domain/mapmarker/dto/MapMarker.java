package com.kepco.app.domain.mapmarker.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * VST_MAP_MARKER 테이블에 대응하는 DTO 클래스
 */
@Getter
@NoArgsConstructor
public class MapMarker {
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
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String useYn;

    @Builder
    public MapMarker(String name, Long markerId, String description, BigDecimal latitude, String iconUrl, String roadAddress, BigDecimal longitude, String jibunAddress, String detailAddress, String categoryCode1, String categoryCode2, String useYn) {
        this.name = name;
        this.markerId = markerId;
        this.description = description;
        this.latitude = latitude;
        this.iconUrl = iconUrl;
        this.roadAddress = roadAddress;
        this.longitude = longitude;
        this.jibunAddress = jibunAddress;
        this.detailAddress = detailAddress;
        this.categoryCode1 = categoryCode1;
        this.categoryCode2 = categoryCode2;
        this.useYn = useYn;
    }

    /**
     * UpdateMapMarkerRequest 객체의 데이터로 현재 MapMarker 객체를 업데이트합니다.
     * @param request 업데이트할 데이터가 담긴 UpdateMapMarkerRequest 객체
     */
    public void update(UpdateMapMarkerRequest request) {
        this.name = request.getName();
        this.description = request.getDescription();
        this.latitude = request.getLatitude();
        this.longitude = request.getLongitude();
        this.iconUrl = request.getIconUrl();
        this.roadAddress = request.getRoadAddress();
        this.jibunAddress = request.getJibunAddress();
        this.detailAddress = request.getDetailAddress();
        this.categoryCode1 = request.getCategoryCode1();
        this.categoryCode2 = request.getCategoryCode2();
        this.useYn = request.getUseYn();
        this.updatedAt = LocalDateTime.now(); // 수정 시간 업데이트
    }
}
