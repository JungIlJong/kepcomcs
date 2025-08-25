package com.kepco.app.core.exception;


import lombok.Getter;
import org.springframework.http.HttpStatus;

import java.util.Collections;
import java.util.List;

/**
 * REST 통신 공통 에러 Exception
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.30
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Getter
public class GlobalRestException extends RuntimeException {

    private final HttpStatus httpStatus;
    private final List<String> errorMessage;

    public GlobalRestException(HttpStatus httpStatus, String errorMessage) {
        this.errorMessage = Collections.singletonList(errorMessage);
        this.httpStatus = httpStatus;
    }

    public GlobalRestException(HttpStatus httpStatus, List<String> errorMessage) {
        this.errorMessage = errorMessage;
        this.httpStatus = httpStatus;
    }
}
