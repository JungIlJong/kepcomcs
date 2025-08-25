package com.kepco.app.common.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.io.IOException;

@RestControllerAdvice
public class GlobalExceptionAdvice {
    @ExceptionHandler(value = CommonException.class)
    public ResponseEntity<Object> commonException(CommonException e) {
        return ResponseEntity
                .status(e.getErrorCode().getStatusCode())
                .body(e.toMap());
    }
}
