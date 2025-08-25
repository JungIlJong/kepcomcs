package com.kepco.app.domain.answer.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.answer.dto.MberAnswer;

import java.util.List;
import java.util.Map;

/**
 * 사용자가 댓글을 사용하기 위한 Mapper 인터페이스
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
@Mapper("answerMapper")
public interface AnswerMapper {

    /**
     * 댓글을 생성한다.
     *
     * @param answer 댓글 DTO
     */
    void insertAnswer(MberAnswer answer);

    /**
     * 댓글을 수정한다.
     *
     * @param answer 댓글 DTO
     */
    void updateAnswer(MberAnswer answer);

    /**
     * 댓글을 논리삭제한다.
     *
     * @param answerId 논리 삭제할 댓글 ID
     */
    void softDeleteAnswer(String answerId);

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

    boolean checkWriter(String answerId, String uuid);

    String getPasswordById(String id);
}
