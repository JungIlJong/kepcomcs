package com.kepco.app.core.security.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.kepco.app.core.security.context.UserContext;
import com.kepco.app.core.security.service.CustomUserDetailsService;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.vo.LoginVO;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
public class JwtHeaderFilter extends OncePerRequestFilter {
    private final List<RequestMatcher> permitAllRequestMatchers = new ArrayList<>();
    private final JwtService jwtService;
    private final CustomUserDetailsService customUserDetailsService;

    public JwtHeaderFilter(JwtService jwtService, CustomUserDetailsService customUserDetailsService, String... permitAllList) {
        this.jwtService = jwtService;
        this.customUserDetailsService = customUserDetailsService;
        setPermitAllRequestMatchers(permitAllList);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = checkHeaderAuthorization(request);
        if (StringUtils.hasText(token) && jwtService.isTokenValid(token)) {
            String username = jwtService.extractUsername(token);

            UserContext userContext = (UserContext) customUserDetailsService.loadUserByUsername(username);
            LoginVO loginVO = userContext.getLoginVO();

            // 새 UserContext 생성
            UserContext updatedContext = new UserContext(loginVO, userContext.getAuthorities());

            // 인증 객체 생성 및 설정
            UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken(
                            updatedContext.getLoginVO(),
                            null,
                            updatedContext.getAuthorities());

            SecurityContextHolder.getContext().setAuthentication(authentication);
        }
        filterChain.doFilter(request, response);
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        boolean isPermitAll = false;

        for (RequestMatcher requestMatcher : permitAllRequestMatchers) {
            if (requestMatcher.matches(request)) {
                isPermitAll = true;
                break;
            }
        }
        return isPermitAll;
    }

    private String checkHeaderAuthorization(HttpServletRequest request) {
        return Optional.ofNullable(request.getHeader(HttpHeaders.AUTHORIZATION))
                .filter(StringUtils::hasText)
                .map(header -> header.replace("Bearer ", ""))
                .orElse(null);
    }

    private void setPermitAllRequestMatchers(String... permitAllList) {
        for (String permitAll : permitAllList) {
            permitAllRequestMatchers.add(new AntPathRequestMatcher(permitAll));
        }
        permitAllRequestMatchers.add(new RegexRequestMatcher("/api/mber/bbs/\\d+$", HttpMethod.GET.name()));
    }
}
