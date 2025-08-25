package com.kepco.app.core.security.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.core.vo.LoginVO;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomLoginProcessingFilter extends AbstractAuthenticationProcessingFilter {

    private final ObjectMapper objectMapper;

    public CustomLoginProcessingFilter(ObjectMapper objectMapper) {
        super(new AntPathRequestMatcher("/api/login", "POST"));
        this.objectMapper = objectMapper;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
        LoginVO loginVO = objectMapper.readValue(request.getReader(), LoginVO.class);

        if (!StringUtils.hasText(loginVO.getId()) || !StringUtils.hasText(loginVO.getPswd())) {
            throw new AuthenticationServiceException("AuthenticationServiceException");
        }

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(loginVO, loginVO.getPswd());
        return this.getAuthenticationManager().authenticate(token);
    }

}
