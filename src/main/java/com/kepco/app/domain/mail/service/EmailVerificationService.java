package com.kepco.app.domain.mail.service;

public interface EmailVerificationService {
    
    /**
     * 인증 코드를 생성하고 이메일로 발송
     * @param email 이메일 주소
     * @return 인증 코드 생성 및 발송 성공 여부
     */
    boolean sendVerificationEmail(String email);
    
    /**
     * 이메일과 인증코드의 유효성을 검증
     * @param email 이메일 주소
     * @param verificationCode 인증 코드
     * @return 인증 성공 여부
     */
    boolean verifyEmail(String email, String verificationCode);
    
    /**
     * 특정 이메일의 인증 상태 확인
     * @param email 이메일 주소
     * @return 인증 상태
     */
    boolean isEmailVerified(String email);
    
    /**
     * 만료된 인증 정보 삭제
     */
    void cleanupExpiredVerifications();
}
