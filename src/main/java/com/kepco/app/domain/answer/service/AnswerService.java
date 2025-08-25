package com.kepco.app.domain.answer.service;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import com.kepco.app.domain.answer.dto.DeleteMberAnswer;
import com.kepco.app.domain.answer.dto.MberAnswer;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 댓글을 사용하기 위한 서비스 인터페이스
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
public interface AnswerService {

    /**
     * 댓글을 생성한다.
     *
     * @param answer 댓글 DTO
     */
    void insertAnswer(MberAnswer answer) throws FdlException;

    /**
     * 댓글을 수정한다.
     *
     * @param answer 댓글 DTO
     */
    void updateAnswer(MberAnswer answer) throws FdlException;

    /**
     * 댓글을 논리삭제한다.
     *
     * @param answerId 논리 삭제할 댓글 ID
     */
    boolean softDeleteAnswer(DeleteMberAnswer deleteMberAnswer);

    /**
     * 비밀번호를 확인한다.
     *
     * @param answerId 댓글 ID
     * @param password 입력 비밀번호
     * @return 동일할 경우 TRUE OR FALSE
     */
    boolean checkPassword(String answerId, String password);

    /**
     * 댓글 상세정보를 조회한다.
     *
     * @param answerId 댓글 ID
     * @return 상세 정보
     */
    Map<String, Object> selectAnswerDetail(String answerId);

    /**
     * 댓글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 댓글 목록
     */
    List<Map<String, Object>> selectAnswerList(Map<String, Object> paramMap);

    /**
     * 댓글 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    int selectAnswerTotCnt(Map<String, Object> paramMap);

    /**
     * 작성자를 확인한다.
     *
     * @param answerId 댓글 ID
     * @return True/False
     */
    boolean checkWriter(String answerId);

    /**
     * 댓글을 신고한다.
     *
     * @param answerId
     */
    void report(Long answerId);
}
