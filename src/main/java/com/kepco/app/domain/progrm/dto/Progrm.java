package com.kepco.app.domain.progrm.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

/**
 * 프로그램을 관리하기 위한 DTO 클래스
 * @author 기업부설연구소 박규영
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
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */
@Alias(value = "progrm")
@Getter
@Setter
public class Progrm {

    private String progrmId;

    private String progrmNm;

    private String progrmDc;

    private String progrmUrl;

    /**
     * 최초등록자ID
     */
    private String frstRegisterId;

    /**
     * 최초등록일시
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime frstRegistDt;

    /**
     * 최종수정자ID
     */
    private String lastUpdusrId;

    /**
     * 최종수정일시
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime lastUpdtDt;
}
