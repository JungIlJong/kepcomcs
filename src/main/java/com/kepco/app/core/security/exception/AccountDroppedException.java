package com.kepco.app.core.security.exception;

import org.springframework.security.core.AuthenticationException;

public class AccountDroppedException extends AuthenticationException {
    public AccountDroppedException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public AccountDroppedException(String msg) {
        super(msg);
    }
}
