package com.kepco.app.domain.mail.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.kepco.app.domain.mail.dto.EmailVerification;

@Mapper("emailVerificationMapper")
public interface EmailVerificationMapper {
    
    /**
     * 이메일 인증 정보 저장
     * @param emailVerification 이메일 인증 정보
     * @return 저장된 행 수
     */
    int insertEmailVerification(EmailVerification emailVerification);
    
    /**
     * 이메일과 인증코드로 인증 정보 조회
     * @param emailVerification 이메일 인증 정보
     * @return 이메일 인증 정보
     */
    EmailVerification selectEmailVerification(EmailVerification emailVerification);
    
    /**
     * 이메일 인증 상태 업데이트
     * @param emailVerification 이메일 인증 정보
     * @return 업데이트된 행 수
     */
    int updateEmailVerification(EmailVerification emailVerification);
    
    /**
     * 만료된 이메일 인증 정보 삭제
     * @return 삭제된 행 수
     */
    int deleteExpiredVerification();
}
