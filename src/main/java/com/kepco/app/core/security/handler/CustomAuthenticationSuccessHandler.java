package com.kepco.app.core.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.common.util.ClientUtils;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.lgnlog.dto.LgnLog;
import com.kepco.app.domain.lgnlog.service.LgnLogService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final ObjectMapper objectMapper;

    private final LgnLogService lgnLogService;

    public CustomAuthenticationSuccessHandler(ObjectMapper objectMapper, LgnLogService lgnLogService) {
        this.objectMapper = objectMapper;
        this.lgnLogService = lgnLogService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        LgnLog lgnLog = new LgnLog();
        lgnLog.setAcsrId(Long.parseLong(UserDetailsUtil.getMbrId()));
        lgnLog.setAcsrNm(UserDetailsUtil.getName());
        lgnLog.setAcsrIpAddr(ClientUtils.getClientIp(request));
        lgnLog.setAcsrOsNm(ClientUtils.getOsName(request));
        lgnLog.setCntnSe("I");

        lgnLogService.insertLgnLog(lgnLog);

        response.setStatus(HttpStatus.OK.value());
        response.setCharacterEncoding("UTF-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        objectMapper.writeValue(response.getWriter(), CommonResponse.success(1));
    }
}
