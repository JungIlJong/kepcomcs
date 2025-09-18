package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 게시글을 관리하기 위한 DTO 클래스
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
/**
 * @author daonplace
 *
 */
@Getter
@Setter
@Alias(value = "sysNtt")
public class SysNtt {

    /**
     * 게시글 ID
     */
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
     * 시작일
     */
    private String nttStartDt;

    /**
     * 종료일
     */
    private String nttEndDt;
    
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
     * 첨부파일 목록
     */
    private MultipartFile[] files;

    /**
     * 삭제 파일 ID 목록
     */
    private List<String> removeFileList;

    /**
     * 신고 ID 목록
     */
    private String reportIds;

    /**
     * 차단 ID 목록
     */
    private String blockIds;
    
    /**
     * e메일
     */
    private String email;

    /**
     *  연락처
     */
    private String authorHp;
    
    /**
     * 머리말
     */
    private String opinionTitleHead;
    
    /**
     * 업체명
     */
    private String cpNm;
    
    /**
     * 지역
     */
    private String area;
    
    /**
     * 주소1
     */
    private String address1;
    
    /**
     * 주소2
     */
    private String address2;
    
    /**
     * 주소3
     */
    private String address3;
    
    /**
     * 회신여부
     */
    private String feedbackYn;
    
    /**
     * 링크URL
     */
    private String linkUrl;

    /**
     * 소속
     */
    private String sosok;
    
    /**
     * 답변
     */
    private String nttReply;
    
    /**
     * 처리상태
     */
    private String nttStatus;
}
