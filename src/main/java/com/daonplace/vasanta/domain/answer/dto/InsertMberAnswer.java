package com.daonplace.vasanta.domain.answer.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 사용자가 댓글을 생성하기 위한 DTO 클래스
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
 *   2024.03.30  김선홍         최초 생성
 * </pre>
 */
@Getter
@Setter
public class InsertMberAnswer {

    /**
     * 게시글 ID
     */
    @NotBlank(message = "{answer.nttId.notblank}")
    private String nttId;

    /**
     * 댓글 내용
     */
    @Size(max = 200, message = "{answer.answerCn.max}")
    @NotBlank(message = "{answer.answerCn.notblank}")
    private String answerCn;

    /**
     * 비밀번호
     */
    @Size(max = 200)
    private String password;

    /**
     * 작성자명
     */
    @Size(max = 50)
    private String wrterNm;
}
