package com.kepco.app.domain.answer.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kepco.app.core.exception.GlobalException;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.answer.dto.DeleteMberAnswer;
import com.kepco.app.domain.answer.dto.MberAnswer;
import com.kepco.app.domain.answer.mapper.AnswerMapper;
import com.kepco.app.domain.answer.service.AnswerService;
import com.kepco.app.domain.report.dto.InsertReport;
import com.kepco.app.domain.report.service.ReportService;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 사용자가 댓글을 사용하기 위한 서비스 구현체
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
@Slf4j
@Service
public class AnswerServiceImpl extends EgovAbstractServiceImpl implements AnswerService {
    private final AnswerMapper answerMapper;
    private final PasswordEncoder passwordEncoder;
    private final ReportService reportService;
    private static final String REPORT_TARGET = "answer";

    public AnswerServiceImpl(AnswerMapper answerMapper, PasswordEncoder passwordEncoder, ReportService reportService) {
        this.answerMapper = answerMapper;
        this.passwordEncoder = passwordEncoder;
        this.reportService = reportService;
    }

    /**
     * 댓글을 생성한다.
     *
     * @param answer 댓글 DTO
     */
    @Override
    @Transactional
    public void insertAnswer(MberAnswer answer) throws FdlException {
        if(answer.getWrterNm() != null) {
            // 비회원
            answer.setPassword(passwordEncoder.encode(answer.getPassword()));
        } else {
            // 회원
            LoginVO loginVO = UserDetailsUtil.getAuthenticatedUser();
            answer.setWrterNm(loginVO.getMbrNm());
            answer.setFrstRegisterId(String.valueOf(loginVO.getMbrId()));
        }
        answerMapper.insertAnswer(answer);
    }

    /**
     * 댓글을 수정한다.
     *
     * @param answer 댓글 DTO
     */
    @Override
    @Transactional
    public void updateAnswer(MberAnswer answer) {
        Map<String, Object> detail = answerMapper.selectAnswerDetail(String.valueOf(answer.getAnswerId()));
        if(detail.containsKey("frstRegisterId")) {
            if(detail.get("frstRegisterId").equals(UserDetailsUtil.getMbrId())) {
                answer.setWrterNm(UserDetailsUtil.getName());
                answerMapper.updateAnswer(answer);
            }
            return;
        }
        if(!passwordEncoder.matches(answer.getPassword(), answerMapper.getPasswordById(answer.getAnswerId()))) {
            throw new GlobalException(HttpStatus.FORBIDDEN, "올바르지 않는 비밀번호입니다.");
        }
        answerMapper.updateAnswer(answer);
    }

    /**
     * 댓글을 논리삭제한다.
     *
     */
    @Override
    @Transactional
    public boolean softDeleteAnswer(DeleteMberAnswer deleteMberAnswer) {
        Map<String, Object> detail = answerMapper.selectAnswerDetail(String.valueOf(deleteMberAnswer.getId()));
        if(Objects.isNull(deleteMberAnswer.getPassword())) {

            if(detail.get("frstRegisterId").equals(UserDetailsUtil.getMbrId())) {
                answerMapper.softDeleteAnswer(String.valueOf(deleteMberAnswer.getId()));
                return true;
            }
            return false;
        }
        if(passwordEncoder.matches(deleteMberAnswer.getPassword(), answerMapper.getPasswordById(String.valueOf(deleteMberAnswer.getId())))) {
            answerMapper.softDeleteAnswer(String.valueOf(deleteMberAnswer.getId()));
            return true;
        }
        return false;
    }

    /**
     * 비밀번호를 확인한다.
     *
     * @param answerId 댓글 ID
     * @param password 입력 비밀번호
     * @return 동일할 경우 TRUE OR FALSE
     */
    @Override
    public boolean checkPassword(String answerId, String password) {
        return passwordEncoder.matches(password, answerMapper.getPasswordById(answerId));
    }

    /**
     * 댓글 상세정보를 조회한다.
     *
     * @param answerId 댓글 ID
     * @return 상세 정보
     */
    @Override
    public Map<String, Object> selectAnswerDetail(String answerId) {
        return answerMapper.selectAnswerDetail(answerId);
    }

    /**
     * 댓글 목록을 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 댓글 목록
     */
    @Override
    public List<Map<String, Object>> selectAnswerList(Map<String, Object> paramMap) {
        paramMap.put("uuid", UserDetailsUtil.getMbrId());
        return answerMapper.selectAnswerList(paramMap);
    }

    /**
     * 댓글 총 갯수를 조회한다.
     *
     * @param paramMap 조회할 정보가 담긴 Map
     * @return 총 갯수
     */
    @Override
    public int selectAnswerTotCnt(Map<String, Object> paramMap) {
        return answerMapper.selectAnswerTotCnt(paramMap);
    }

    @Override
    public boolean checkWriter(String answerId) {
        return answerMapper.checkWriter(answerId, UserDetailsUtil.getId());
    }

    @Override
    @Transactional
    public void report(Long answerId) {
        reportService.insertReport(new InsertReport(answerId, UserDetailsUtil.getMbrId(), REPORT_TARGET));
    }
}
