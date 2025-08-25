package com.kepco.app.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 사용자가 댓글을 수정하기 위한 DTO 클래스
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
public class UpdateMBerAnswer {

    /**
     * 댓글 ID
     */
    @NotBlank(message = "answer.answerId.notblank")
    private String answerId;

    /**
     * 댓글 내용
     */
    @NotBlank(message = "answer.answerCn.notblank")
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
}
