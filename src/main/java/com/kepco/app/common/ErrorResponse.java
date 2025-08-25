package com.kepco.app.common;

import lombok.Getter;

@Getter
public class ErrorResponse {

    private final int statusCode;

    private final int errorCode;

    private final String errorMessage;

    private final Object data;

    private ErrorResponse(ErrorCode error, Object data) {
        this.statusCode = error.getStatusCode();
        this.errorCode = error.getErrorCode();
        this.errorMessage = error.getErrorMessage();
        this.data = data;
    }

    public static ErrorResponse of(ErrorCode error) {
        return new ErrorResponse(error, null);
    }

    public static ErrorResponse of(ErrorCode errorCode, Object data) {
        return new ErrorResponse(errorCode, data);
    }

}
