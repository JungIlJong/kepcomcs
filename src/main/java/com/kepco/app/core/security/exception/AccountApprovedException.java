package com.kepco.app.core.security.exception;

import org.springframework.security.core.AuthenticationException;

public class AccountApprovedException extends AuthenticationException {
    public AccountApprovedException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public AccountApprovedException(String msg) {
        super(msg);
    }
}
