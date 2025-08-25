package com.daonplace.vasanta.domain.answer.service;

import com.daonplace.vasanta.domain.answer.dto.SysAnswer;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 댓글을 관리하기 위한 서비스 인터페이스
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
public interface AnswerSysService {

    /**
     * 댓글을 생성한다.
     *
     * @param answer 댓글 DTO
     * @throws FdlException
     */
    void insertAnswer(SysAnswer answer) throws FdlException;

    /**
     * 댓글을 수정한다.
     *
     * @param answer 댓글 DTO
     */
    void updateAnswer(SysAnswer answer);

    /**
     * 뎃글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 댓글 리스트
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
     * 댓글을 삭제한다.
     *
     * @param answerId 삭제할 댓글 ID
     */
    void deleteAnswerById(String answerId);

    /**
     * 게시글을 통해 댓글을 삭제한다.
     *
     * @param nttId 삭제할 댓글의 게시글 ID
     */
    void deleteAnswerByNttId(String nttId);
}
