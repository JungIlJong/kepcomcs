package com.kepco.app.domain.popup.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

/**
 * 관리자가 팝업을 관리하기 위한 DTO 클래스
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
@Alias(value = "sysPopup")
public class SysPopup {

    /**
     * 팝업 ID
     */
    private String popupId;

    /**
     * 팝업명
     */
    private String popupNm;

    /**
     * 게시순위
     */
    private int sortOrdr;

    /**
     * URL
     */
    private String url;

    /**
     * 팝업가로위치
     */
    private int popupWithLc;

    /**
     * 팝업가로크기
     */
    private int popupWithSize;

    /**
     * 팝업세로위치
     */
    private int popupVrticlLc;

    /**
     * 팝업세로크기
     */
    private int popupVrticSize;

    /**
     * 반영여부
     */
    private String ntceAt;

    /**
     * 게시 시작날짜
     */
    private LocalDateTime ntceBgnde;

    /**
     * 게시 종료날짜
     */
    private LocalDateTime ntceEndde;

    /**
     * 그만부기 여부
     */
    private String stopViewSetupAt;

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
     * 팝업 이미지 파일
     */
    private MultipartFile imgFile;
}
