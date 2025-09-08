package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 관리자가 게시글을 생성하기 위한 DTO 클래스
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
@ToString
public class InsertSysNtt {

    /**
     * 게시판 ID
     */
    @NotBlank
    private String bbsId;

    /**
     * 부모 게시글 ID
     */
    private String parntscttId;

    /**
     * 제목
     */
    @NotBlank
    private String nttSj;

    /**
     * 내용
     */
    @NotBlank
    private String nttCn;

    /**
     * 비밀글 여부
     */
    private String secretAt;

    /**
     * 공지사항 여부
     */
    private String noticeAt;

    /**
     * 사용여부
     */
    private String useAt;

    /**
     * 작성자명
     */
    private String wrterNm;

    /**
     * 비밀번호
     */
    private String password;
    
    /**
     * 시작일
     */
    private String nttStartDt;
    
    /**
     * 종료일
     */
    private String nttEndDt;

    /**
     * 썸네일 URL
     */
    private String thumbUrl;

    /**
     * 첨부파일 목록
     */
    private List<MultipartFile> files;

}
