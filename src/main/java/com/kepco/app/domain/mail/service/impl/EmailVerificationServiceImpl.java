package com.kepco.app.domain.mail.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.kepco.app.domain.mail.dto.EmailVerification;
import com.kepco.app.domain.mail.dto.Mail;
import com.kepco.app.domain.mail.mapper.EmailVerificationMapper;
import com.kepco.app.domain.mail.service.EmailVerificationService;
import com.kepco.app.domain.mail.service.MailService;

import java.security.SecureRandom;
import java.time.LocalDateTime;

@Slf4j
@Service("emailVerificationService")
public class EmailVerificationServiceImpl extends EgovAbstractServiceImpl implements EmailVerificationService {

    private final MailService mailService;
    private final EmailVerificationMapper emailVerificationMapper;
    
    // 인증 코드 길이
    private static final int VERIFICATION_CODE_LENGTH = 6;
    // 인증 코드 유효 시간 (분)
    private static final int VERIFICATION_CODE_EXPIRY_MINUTES = 30;
    
    public EmailVerificationServiceImpl(MailService mailService, EmailVerificationMapper emailVerificationMapper) {
        this.mailService = mailService;
        this.emailVerificationMapper = emailVerificationMapper;
    }

    @Override
    public boolean sendVerificationEmail(String email) {
        try {
            // 인증 코드 생성
            String verificationCode = generateVerificationCode();
            
            // 만료 시간 설정 (현재 시간 + 30분)
            LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(VERIFICATION_CODE_EXPIRY_MINUTES);
            
            // DB에 인증 정보 저장
            EmailVerification emailVerification = new EmailVerification();
            emailVerification.setEmailAddr(email);
            emailVerification.setVerificationCode(verificationCode);
            emailVerification.setExpiryTime(expiryTime);
            emailVerification.setVerified(false);
            
            emailVerificationMapper.insertEmailVerification(emailVerification);
            
            // 메일 발송
            Mail mail = new Mail();
            mail.setTo(email);
            mail.setSubject("[SafeNow] 이메일 인증 코드 안내");
            
            String mailContent = "안녕하세요, SafeNow 서비스입니다.\n\n" +
                    "회원가입을 위한 인증 코드는 다음과 같습니다:\n\n" +
                    "인증 코드: " + verificationCode + "\n\n" +
                    "이 코드는 " + VERIFICATION_CODE_EXPIRY_MINUTES + "분 동안 유효합니다.\n" +
                    "본 메일에 심각한 문제가 있다면 관리자에게 문의하시기 바랍니다.\n\n" +
                    "감사합니다.\n" +
                    "SafeNow 팀";
            
            mail.setText(mailContent);
            
            return mailService.sendMail(mail);
            
        } catch (Exception e) {
            log.error("이메일 인증 코드 발송 중 오류 발생: {}", e.getMessage(), e);
            return false;
        }
    }

    @Override
    public boolean verifyEmail(String email, String verificationCode) {
        try {
            EmailVerification search = new EmailVerification();
            search.setEmailAddr(email);
            search.setVerificationCode(verificationCode);
            
            EmailVerification result = emailVerificationMapper.selectEmailVerification(search);
            
            if (result != null) {
                result.setVerified(true);
                emailVerificationMapper.updateEmailVerification(result);
                return true;
            }
            
            return false;
        } catch (Exception e) {
            log.error("이메일 인증 검증 중 오류 발생: {}", e.getMessage(), e);
            return false;
        }
    }

    @Override
    public boolean isEmailVerified(String email) {
        // 구현이 필요하면 추가
        return false;
    }

    @Override
    public void cleanupExpiredVerifications() {
        try {
            int deletedCount = emailVerificationMapper.deleteExpiredVerification();
            log.info("만료된 인증 정보 {} 건 삭제", deletedCount);
        } catch (Exception e) {
            log.error("만료된 인증 정보 삭제 중 오류 발생: {}", e.getMessage(), e);
        }
    }
    
    /**
     * 무작위 인증 코드 생성
     * @return 생성된 인증 코드
     */
    private String generateVerificationCode() {
        String CHARACTERS = "0123456789";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(VERIFICATION_CODE_LENGTH);
        
        for (int i = 0; i < VERIFICATION_CODE_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(randomIndex));
        }
        
        return sb.toString();
    }
}
