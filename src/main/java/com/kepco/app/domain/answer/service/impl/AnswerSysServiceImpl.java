package com.kepco.app.domain.answer.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.domain.answer.dto.SysAnswer;
import com.kepco.app.domain.answer.mapper.AnswerSysMapper;
import com.kepco.app.domain.answer.service.AnswerSysService;

import java.util.List;
import java.util.Map;

/**
 * 관리자가 댓글을 관리하기 위한 서비스 구현 클래스
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
@Service("answerSysService")
public class AnswerSysServiceImpl extends EgovAbstractServiceImpl implements AnswerSysService {

    private final AnswerSysMapper answerSysMapper;

    public AnswerSysServiceImpl(AnswerSysMapper answerSysMapper) {
        this.answerSysMapper = answerSysMapper;
    }

    /**
     * 댓글을 생성한다.
     *
     * @param answer 댓글 DTO
     * @throws FdlException
     */
    @Override
    @Transactional
    public void insertAnswer(SysAnswer answer) throws FdlException {
        answerSysMapper.insertAnswer(answer);
    }

    /**
     * 댓글을 수정한다.
     *
     * @param answer 댓글 DTO
     */
    @Override
    @Transactional
    public void updateAnswer(SysAnswer answer) {
        answerSysMapper.updateAnswer(answer);
    }

    /**
     * 뎃글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 댓글 리스트
     */
    @Override
    public List<Map<String, Object>> selectAnswerList(Map<String, Object> paramMap) {
        return answerSysMapper.selectAnswerList(paramMap);
    }

    /**
     * 댓글 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    @Override
    public int selectAnswerTotCnt(Map<String, Object> paramMap) {
        return answerSysMapper.selectAnswerTotCnt(paramMap);
    }

    /**
     * 댓글을 삭제한다.
     *
     * @param answerId 삭제할 댓글 ID
     */
    @Override
    @Transactional
    public void deleteAnswerById(String answerId) {
        answerSysMapper.deleteAnswerById(answerId);
    }

    /**
     * 게시글을 통해 댓글을 삭제한다.
     *
     * @param nttId 삭제할 댓글의 게시글 ID
     */
    @Override
    @Transactional
    public void deleteAnswerByNttId(String nttId) {
        answerSysMapper.deleteAnswerByNttId(nttId);
    }

}
