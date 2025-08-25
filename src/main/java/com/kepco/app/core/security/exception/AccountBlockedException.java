package com.kepco.app.core.security.exception;

import org.springframework.security.core.AuthenticationException;

public class AccountBlockedException extends AuthenticationException {
    public AccountBlockedException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public AccountBlockedException(String msg) {
        super(msg);
    }
}
