package com.daonplace.vasanta.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 관리자가 댓글을 수정하기 위한 DTO 클래스
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
public class UpdateSysAnswer {
    /**
     * 댓글 ID
     */
    @NotBlank(message = "{answer.update.answerId.notblank}")
    private String answerId;
    /**
     * 게시글 ID
     */
    private String nttId;

    /**
     * 댓글 내용
     */
    @Size(max = 200, min = 0, message = "{answer.answerCn.max}")
    private String answerCn;

    /**
     * 사용 여부
     */
    private String useAt;

    /**
     * 댓글 작성자
     */
    private String wrterNm;

    private String password;
}
