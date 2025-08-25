package com.kepco.app.core.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.exception.AccountApprovedException;
import com.kepco.app.core.security.exception.AccountBlockedException;
import com.kepco.app.core.security.exception.AccountDroppedException;
import com.kepco.app.domain.mbr.mbrSttsCd;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    private final ObjectMapper objectMapper;

    public CustomAuthenticationFailureHandler(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        // TODO 로그인 실패 기록
        String status = "N";

        if (exception instanceof UsernameNotFoundException) {
            // UsernameNotFoundException
        } else if (exception instanceof BadCredentialsException) {
            // BadCredentialsException
        } else if (exception instanceof LockedException) {
            status = mbrSttsCd.LOCKED.getSttsCd();
        } else if (exception instanceof AccountApprovedException) {
            status = mbrSttsCd.PENDING.getSttsCd();
        } else if (exception instanceof AccountBlockedException) {
            status = mbrSttsCd.BLOCKED.getSttsCd();
        } else if (exception instanceof AccountDroppedException) {
            status = mbrSttsCd.DROPPED.getSttsCd();
        } else if (exception instanceof AccountExpiredException) {
            status = mbrSttsCd.EXPIRED.getSttsCd();
        }

        Map<String, Object> payload = new HashMap<>();
        payload.put("status", status);

        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        response.setCharacterEncoding("UTF-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);

        objectMapper.writeValue(response.getWriter(), CommonResponse.error(CommonErrorCode.UNAUTHORIZED, payload));
    }

}
