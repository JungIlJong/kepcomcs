package com.daonplace.vasanta.core.security.handler;

import com.daonplace.vasanta.common.CommonErrorCode;
import com.daonplace.vasanta.common.CommonResponse;
import com.daonplace.vasanta.domain.mbr.mbrSttsCd;
import com.daonplace.vasanta.core.security.exception.AccountApprovedException;
import com.daonplace.vasanta.core.security.exception.AccountBlockedException;
import com.daonplace.vasanta.core.security.exception.AccountDroppedException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
