package com.kepco.app.domain.bbs.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Map;

/**
 * 관리자가 게시판을 수정하기 위한 DTO 클래스
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
public class UpdateSysBbs {

    /**
     * 게시판 ID
     */
    @Size(max = 255, message = "{bbs.bbsNm.size}")
    @NotBlank(message = "{bbs.update.bbsId.notblank}")
    private String bbsId;

    /**
     * 게시판명
     */
    @NotBlank(message = "{bbs.update.bbsNm.notblank}")
    private String bbsNm;

    /**
     * 게시판타입코드
     */
    @NotBlank(message = "{bbs.update.bbsTyCode.notblank}")
    private String bbsTyCode;

    /**
     * 첨부파일사이즈
     */
    @NotNull(message = "{bbs.insert.fileAtchAt.notblank}")
    private int fileAtchSize;

    /**
     * 첨부파일갯수
     */
    private int fileAtchCo;

    /**
     * 허용확장자
     */
    @NotBlank(message = "{bbs.permExtsn.size}")
    private String permExtsn;

    /**
     * 권한목록
     */
    @NotNull(message = "{bbs.update.roles.nonnull}")
    private List<Map<String, Object>> roles;

    @NotBlank(message = "{bbs.update.useAt.notblank}")
    private String useAt;

    /**
     * 첨부파일 표시여부
     */
    private String fileAt;
    
    /**
     * 카드형목록 여부
     */
    private String cardAt;
}
