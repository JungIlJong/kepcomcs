package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 게시글을 수정하기 위한 DTO 클래스
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
public class UpdateSysNtt {

    /**
     * 게시글 ID
     */
    @NotBlank
    private String nttId;

    /**
     * 게시판 ID
     */
    private String bbsId;

    /**
     * 부모 게시글 ID
     */
    private String parntscttId;

    /**
     * 제목
     */
    private String nttSj;

    /**
     * 내용
     */
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
     * 썸네일 URL
     */
    private String thumbUrl;

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
     * 첨부파일 목록
     */
    private MultipartFile[] files;

    /**
     * 삭제 파일 ID 목록
     */
    private List<String> removeFileList;
    
    /**
     * 답변
     */
    private String nttReply;
    
    /**
     * 처리상태
     */
    private String nttStatus;
}
