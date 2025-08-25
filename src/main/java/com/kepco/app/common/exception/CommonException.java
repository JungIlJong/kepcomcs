package com.kepco.app.common.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

import com.kepco.app.common.ErrorCode;

@Getter
public class CommonException extends RuntimeException {
    private ErrorCode errorCode;
    private Object data;

    public CommonException(ErrorCode errorCode) {
        super(errorCode.getErrorMessage());
        this.errorCode = errorCode;
        Map<String, String> data = new HashMap<>();
        data.put("message", errorCode.getErrorMessage());
        this.data = data;
    }

    public CommonException(ErrorCode errorCode, Object data) {
        super(errorCode.getErrorMessage());
        this.errorCode = errorCode;
        this.data = data;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("status", errorCode.getStatusCode());
        map.put("code", errorCode.getErrorCode());
        map.put("message", errorCode.getErrorMessage());
        map.put("data", data);
        return map;
    }
}
