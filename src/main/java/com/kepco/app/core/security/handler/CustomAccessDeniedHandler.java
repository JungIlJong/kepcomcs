package com.kepco.app.core.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.core.util.WebUtil;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    private String errorPage;

    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {

        if (WebUtil.isAjax(request)) {
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            response.getWriter().write(objectMapper.writeValueAsString(ResponseEntity.status(HttpStatus.FORBIDDEN)));
        } else {
            StringBuilder sb = new StringBuilder(errorPage);
            sb.append("?exception=");
            sb.append(accessDeniedException.getMessage());
            String deniedUrl = sb.toString();
            redirectStrategy.sendRedirect(request, response, deniedUrl);
        }
    }

    public void setErrorPage(String errorPage) {
        if ((errorPage != null) && !errorPage.startsWith("/")) {
            throw new IllegalArgumentException("errorPage mus begin with '/'");
        }

        this.errorPage = errorPage;
    }
}
