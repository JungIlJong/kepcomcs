package com.daonplace.vasanta.domain.banner.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

/**
 * 배너을 관리하기 위한 DTO 클래스
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
@Alias(value = "sysBanner")
public class SysBanner {
    /**
     * 배너 ID
     */
    private String bannerId;

    /**
     * 배너명
     */
    private String bannerNm;

    /**
     * 게시여부
     */
    private String reflctAt;

    /**
     * URL
     */
    private String url;

    /**
     * 게시순위
     */
    private int sortOrder;

    /**
     * 배너구분코드
     */
    private String bannerSeCode;

    /**
     * 게시시작날짜
     */
    private LocalDateTime ntceBgnde;

    /**
     * 게시종료날짜
     */
    private LocalDateTime ntceEndde;

    /**
     * 설명
     */
    private String dc;

    /**
     * 새창여부
     */
    private String newBrwsAt;

    /**
     * 최초등록자 ID
     */
    private String frstRegisterId;

    /**
     * 최초등록날짜
     */
    private LocalDateTime frstRegistDt;

    /**
     * 최종수정자 ID
     */
    private String lastUpdusrId;

    /**
     * 최종수정일시
     */
    private LocalDateTime lastUpdtDt;

    /**
     * 웹 배너 파일
     */
    private MultipartFile webBanner;

    /**
     * 모바일 배너 파일
     */
    private MultipartFile mobBanner;
}
