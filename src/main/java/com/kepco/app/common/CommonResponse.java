package com.kepco.app.common;

import org.springframework.http.ResponseEntity;

public class CommonResponse {

    public static ResponseEntity<?> empty() {
        return ResponseEntity.ok().build();
    }

    public static ResponseEntity<?> success(Object data) {
        return ResponseEntity.ok().body(data);
    }

    public static ResponseEntity<?> error(ErrorCode errorCode) {
        ErrorResponse error = ErrorResponse.of(errorCode);
        return ResponseEntity.status(errorCode.getStatusCode()).body(error);
    }

    public static ResponseEntity<?> error(ErrorCode errorCode, Object data) {
        ErrorResponse error = ErrorResponse.of(errorCode, data);
        return ResponseEntity.status(errorCode.getStatusCode()).body(error);
    }

}
