package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

/**
 *  사용자가가 게시글을 사용하기 위한 DTO
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
@Alias(value = "mberNtt")
public class MberNtt {

    /**
     * 게시글 ID
     */
    private String nttId;

    /**
     * 게시판 ID
     */
    private String bbsId;

    /**
     * 게시글 제목
     */
    private String nttSj;

    /**
     * 게시글 내용
     */
    private String nttCn;

    /**
     * 비밀글 여부
     */
    private String secretAt;

    /**
     * 사용 여부
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
     * 썸네일 URL
     */
    private String thumbUrl;

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

    /**
     * 첨부파일
     */
    private MultipartFile[] files;

    /**
     * 삭제 파일 ID 목록
     */
    private List<String> removeFileList;


}
