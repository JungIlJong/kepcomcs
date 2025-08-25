package com.daonplace.vasanta.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

/**
 * 관리자가 댓글을 관리하기 위한 DTO 클래스
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
@Alias(value = "sysAnswer")
public class SysAnswer {
    /**
     * 댓글 ID
     */
    private String answerId;

    /**
     * 게시글 ID
     */
    private String nttId;

    /**
     * 댓글 내용
     */
    private String answerCn;

    /**
     * 사용여부
     */
    private String useAt;

    /**
     * 비밀번호
     */
    private String password;

    /**
     * 작성자명
     */
    private String wrterNm;

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
