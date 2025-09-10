package com.kepco.app.domain.bbs.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 게시판을 관리하기 위한 DTO 클래스
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
@Alias(value = "sysBbs")
public class SysBbs {

    /**
     * 게시판 ID
     */
    private String bbsId;

    /**
     * 게시판명
     */
    private String bbsNm;

    /**
     * 게시판타입코드
     */
    private String bbsTyCode;

    /**
     * 파일사이즈
     */
    private int fileAtchSize;
    /**
     * 파일갯수
     */
    private int fileAtchCo;

    /**
     *
     */
    private String secretUseAt;

    /**
     * 댓글여부
     */
    private String answerAt;

    /**
     * 사용여부
     */
    private String useAt;

    /**
     * 답글여부
     */
    private String replyAt;

    /**
     * 허용확장자
     */
    private String permExtsn;

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
     * 권한목록
     */
    private List<Map<String, Object>> roles;

    /**
     * 첨부파일 표시여부
     */
    private String fileAt;

    /**
     * 카드형목록 여부
     */
    private String cardAt;
}
