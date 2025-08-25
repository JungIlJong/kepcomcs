package com.kepco.app.domain.mail.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class EmailVerification {

    private String emailAddr;
    private String verificationCode;
    private LocalDateTime expiryTime;
    private boolean verified;
    private LocalDateTime verifiedTime;
    private LocalDateTime createdAt;

}
