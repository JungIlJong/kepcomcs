package com.daonplace.vasanta.domain.login.dto;

import com.daonplace.vasanta.common.CommonErrorCode;
import com.daonplace.vasanta.core.vo.LoginVO;
import lombok.Getter;

@Getter
public class LoginResult {
    private final boolean success;
    private final LoginVO loginVO;
    private final CommonErrorCode errorCode;

    public LoginResult(boolean success, CommonErrorCode errorCode) {
        this.success = success;
        this.errorCode = errorCode;
        this.loginVO = null;
    }

    public LoginResult(boolean success, LoginVO loginVO, CommonErrorCode errorCode) {
        this.success = success;
        this.loginVO = loginVO;
        this.errorCode = errorCode;
    }
}
