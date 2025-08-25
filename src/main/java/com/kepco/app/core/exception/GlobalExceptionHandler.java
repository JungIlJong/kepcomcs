package com.kepco.app.core.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.TypeMismatchException;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kepco.app.core.security.util.UserDetailsUtil;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(value = GlobalException.class)
    public void globalException(GlobalException e, HttpServletResponse response) throws IOException {
        log.info("GlobalException EsntlId: {}, Status: {}, Message: {}", UserDetailsUtil.getId(), e.getHttpStatus().toString(), e.getMessage());
        response.sendError(e.getHttpStatus().value());
    }

    @ResponseBody
    @ExceptionHandler(value = {NumberFormatException.class, TypeMismatchException.class})
    public ResponseEntity typeException(Exception e) {
        log.info("{}", e.getMessage());
        return ResponseEntity.badRequest().body(e.getMessage());
    }

    /**
     * Rest 통신 에러 핸들러
     *
     * @param e Exception 장보
     * @return 에러 상태 및 에러 정보
     */
    @ResponseBody
    @ExceptionHandler(value = GlobalRestException.class)
    public ResponseEntity<List<String>> globalException(GlobalRestException e) {
        log.info("GlobalRestException EsntlId: {}, Status: {}, Message: {}", UserDetailsUtil.getId(), e.getHttpStatus().toString(), e.getErrorMessage());
        return ResponseEntity.status(e.getHttpStatus())
                .body(new ArrayList<>(e.getErrorMessage()));
    }

    /**
     * Valid 에러 처리 핸들러
     *
     * @param e Valid 정보
     * @return 에러메시지
     */
    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<List<String>> valid(MethodArgumentNotValidException e) {
        log.info("MethodArgumentNotValidException EsntlId: {}, Status: {}, Message: {}", UserDetailsUtil.getId(), HttpStatus.BAD_REQUEST.toString(), e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body((e.getFieldErrors().stream().map(DefaultMessageSourceResolvable::getDefaultMessage))
                        .collect(Collectors.toList())
                );
    }

    /**
     * Valid 에러 처리 핸들러
     *
     * @param e Valid 정보
     * @return 에러메시지
     */
    @ResponseBody
    @ExceptionHandler(BindException.class)
    public ResponseEntity<List<String>> valid(BindException e) {
        log.info("BindException EsntlId: {}, Status: {}, Message: {}", UserDetailsUtil.getId(), HttpStatus.BAD_REQUEST.toString(), e.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body((e.getFieldErrors().stream().map(DefaultMessageSourceResolvable::getDefaultMessage)
                        .collect(Collectors.toList()))
                );
    }

    /**
     * Valid 에러 처리 핸들러
     *
     * @param e Valid 정보
     * @return 에러메시지
     */
    @ResponseBody
    @ExceptionHandler(ConstraintViolationException.class)
    public void valid(ConstraintViolationException e, HttpServletResponse response) throws IOException {
        log.info("ConstraintViolationException {}", e.getLocalizedMessage());
        response.sendError(HttpStatus.BAD_REQUEST.value());
    }
}
