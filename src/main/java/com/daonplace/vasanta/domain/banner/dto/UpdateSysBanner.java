package com.daonplace.vasanta.domain.banner.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

/**
 * 관리자가 배너를 수정하기 위한 DTO 클래스
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Getter
@Setter
@ToString
public class UpdateSysBanner {
    /**
     * 배너 ID
     */
    @NotBlank(message = "{banner.bannerId.notblank}")
    @Size(max = 20, min = 1, message = "{banner.bannerId.size}")
    private String bannerId;

    /**
     * 배너명
     */
    @NotBlank(message = "{banner.bannerNm.notblank}")
    @Size(max = 60, min = 1, message = "{banner.bannerNm.size}")
    private String bannerNm;

    /**
     * 게시여부
     */
    @NotBlank(message = "{banner.reflctAt.notblank}")
    @Size(max = 1, min = 1, message = "{banner.reflctAt.size}")
    private String reflctAt;

    /**
     * URL
     */
    private String url;

    /**
     * 게시시작일자
     */
    @NotNull(message = "{banner.ntceBgnde.notnull}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceBgnde;

    /**
     * 게시종료일자
     */
    @NotNull(message = "{banner.ntceEndde.notnull}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceEndde;

    /**
     * 설명
     */
    @Size(max = 50, min = 0, message = "{banner.dc.size}")
    private String dc;

    /**
     * 게시순위
     */
    @NotNull(message = "{banner.sortOrder.notnull}")
    @Min(value = -99, message = "{banner.sortOrder.min}")
    private int sortOrder;

    /**
     * 배너구분코드
     */
    @NotBlank(message = "{banner.bannerSeCode.notblank}")
    @Size(max = 6, min = 1, message = "{banner.bannerSeCode.size}")
    private String bannerSeCode;

    /**
     * 새창여부
     */
    @NotBlank(message = "{banner.newBrwsAt.notblank}")
    private String newBrwsAt;

    /**
     * 웹 배너 파일
     */
    private MultipartFile webBanner;

    /**
     * 모바일 배너 파일
     */
    private MultipartFile mobBanner;

}
