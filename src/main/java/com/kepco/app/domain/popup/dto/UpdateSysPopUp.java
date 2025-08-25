package com.kepco.app.domain.popup.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

/**
 * 관리자가 팝업을 수정하기 위한 DTO 클래스
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
public class UpdateSysPopUp {

    /**
     * 팝업 ID
     */
    @NotBlank(message = "{popup.popupId.notblank}")
    private String popupId;

    /**
     * 팝업명
     */
    @NotBlank(message = "{popup.popupNm.notblank}")
    @Size(max = 60, min = 1, message = "{popup.update.popupNm.size}")
    private String popupNm;

    /**
     * 게시순위
     */
    @Max(value = 99, message = "{popup.sortOrdr.max}")
    @Min(value = -99, message = "{popup.sortOrdr.min}")
    private int sortOrdr;

    /**
     * URL
     */
    @Size(max = 200, min = 0, message = "{popup.url.size}")
    private String url;

    /**
     * 반영여부
     */
    @Size(min = 1, max = 1, message = "{popup.update.ntceAt.min}")
    private String ntceAt;

    /**
     * 게시 시작날짜
     */
    @NotNull(message = "{popup.ntceBgnde.notblank}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceBgnde;

    /**
     * 게시 종료날짜
     */
    @NotNull(message = "{popup.ntceEndde.notblank}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime ntceEndde;

    /**
     * 팝업 이미지 파일
     */
    private MultipartFile imgFile;
}
