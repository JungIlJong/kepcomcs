package com.kepco.app.domain.mail.api;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.domain.mail.service.EmailVerificationService;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/emailVerification")
public class EmailVerificationApi {

    private final EmailVerificationService emailVerificationService;

    public EmailVerificationApi(EmailVerificationService emailVerificationService) {
        this.emailVerificationService = emailVerificationService;
    }

    /**
     * 이메일 인증 코드 발송
     * @param param 요청 파라미터
     * @return 응답
     */
    @PostMapping("/sendCode")
    public ResponseEntity sendVerificationCode(@RequestBody Map<String, String> param) {
        log.info("이메일 인증 코드 발송 요청: {}", param.get("emlAddr"));
        
        if (param.get("emlAddr") == null || param.get("emlAddr").isEmpty()) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }
        
        boolean result = emailVerificationService.sendVerificationEmail(param.get("emlAddr"));
        
        if (result) {
            Map<String, Object> data = new HashMap<>();
            data.put("success", true);
            data.put("message", "인증 코드가 발송되었습니다. 이메일을 확인해주세요.");
            return CommonResponse.success(data);
        } else {
            return CommonResponse.error(CommonErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
    
    /**
     * 이메일 인증 코드 검증
     * @param param 요청 파라미터
     * @return 응답
     */
    @PostMapping("/verify")
    public ResponseEntity verifyCode(@RequestBody Map<String, String> param) {
        String emlAddr = param.get("emlAddr");
        String code = param.get("verificationCode");
        
        log.info("이메일 인증 코드 검증 요청: {}, code: {}", emlAddr, code);
        
        if (emlAddr == null || emlAddr.isEmpty() || code == null || code.isEmpty()) {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }
        
        boolean result = emailVerificationService.verifyEmail(emlAddr, code);
        
        if (result) {
            Map<String, Object> data = new HashMap<>();
            data.put("verified", true);
            data.put("message", "이메일 인증이 완료되었습니다.");
            return CommonResponse.success(data);
        } else {
            return CommonResponse.error(CommonErrorCode.BAD_REQUEST);
        }
    }
}
