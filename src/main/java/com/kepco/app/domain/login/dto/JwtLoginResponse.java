package com.kepco.app.domain.login.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtLoginResponse {
    private String accessToken;
    private String refreshToken;
}
