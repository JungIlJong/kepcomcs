package com.daonplace.vasanta.domain.banner.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.time.LocalDateTime;

/**
 * 관리자가 배너을 생성하기 위한 DTO 클래스
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
public class InsertSysBanner {

    /**
     * 배너명
     */
    @Size(max = 60, min = 1, message = "{banner.name.size}")
    @NotBlank(message = "{banner.name.notblank}")
    private String bannerNm;

    /**
     * 게시여부
     */
    @NotBlank(message = "{banner.reflectAt.notblank}")
    @Size(max = 1, min = 1, message = "{banner.reflectAt.size}")
    private String reflctAt;

    /**
     * URL
     */
    @Size(max = 200, message = "{banner.url.size}")
    private String url;

    /**
     * 게시순위
     */
    @Max(value = 999, message = "{banner.sortOrder.max}")
    @Min(value = -99, message = "{banner.sortOrder.min}")
    private int sortOrder;

    /**
     * 배너구분코드
     */
    @NotBlank(message = "{banner.bannerSeCode.notblank}")
    @Size(max = 20, min = 1, message = "{banner.bannerSeCode.size}")
    private String bannerSeCode;

    /**
     * 게시시작일자
     */
    @NotNull(message = "{banner.ntceBgnde.notnull}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceBgnde;

    /**
     * 게시종료일자
     */
    @Future
    @NotNull(message = "{banner.ntceEndde.notnull}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceEndde;

    /**
     * 설명
     */
    @Size(max = 50, min = 0, message = "{banner.dc.size}")
    private String dc;

    /**
     * 새창여부
     */
    @NotBlank(message = "{banner.newBrwsAt.notblank}")
    private String newBrwsAt;

    /**
     * 웹 배너 파일
     */
    @NotNull(message = "{banner.webBanner.notnull}")
    private MultipartFile webBanner;

    /**
     * 모바일 배너 파일
     */
    @NotNull(message = "{banner.mobBanner.notnull}")
    private MultipartFile mobBanner;
}
