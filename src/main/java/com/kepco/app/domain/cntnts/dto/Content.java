package com.kepco.app.domain.cntnts.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

/**
 * 콘텐츠를 관리하기 위한 DTO 클래스
 *
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
@Alias(value = "content")
public class Content {

    /**
     * 콘텐츠 ID
     */
    private String cntntsId;

    /**
     * 콘텐츠명
     */
    private String cntntsNm;

    /**
     * 콘텐츠 내용
     */
    private String cntntsCn;

    /**
     * 콘텐츠 설명
     */
    private String cntntsDc;

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
}
