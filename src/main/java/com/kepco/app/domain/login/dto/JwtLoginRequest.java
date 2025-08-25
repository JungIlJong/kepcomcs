package com.kepco.app.domain.login.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtLoginRequest {
    private String username;
    private String password;
    private boolean rememberMe;
}
