package com.kepco.app.core.security.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.exception.CommonException;
import com.kepco.app.core.security.context.UserContext;
import com.kepco.app.core.security.service.CustomUserDetailsService;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.vo.LoginVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Deprecated
@Slf4j
public class JwtFilter extends OncePerRequestFilter {

    private final List<RequestMatcher> permitAllRequestMatchers = new ArrayList<>();

    private final JwtService jwtService;

    private final CustomUserDetailsService customUserDetailsService;


    public JwtFilter(JwtService jwtService, CustomUserDetailsService customUserDetailsService, String... permitAllList) {
        this.jwtService = jwtService;
        this.customUserDetailsService = customUserDetailsService;
        setPermitAllRequestMatchers(permitAllList);
    }

    private void setPermitAllRequestMatchers(String... permitAllList) {
        for (String permitAll : permitAllList) {
            permitAllRequestMatchers.add(new AntPathRequestMatcher(permitAll));
        }
        permitAllRequestMatchers.add(new RegexRequestMatcher("/api/mber/bbs/\\d+$", HttpMethod.GET.name()));
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            Optional.ofNullable(extractToken(request, "access_token"))
                    .ifPresent(this::setAuthentication);
        } catch (CommonException exception) {
            if(exception.getErrorCode().equals(CommonErrorCode.EXPIRED)) {
                String refreshToken = checkCookie(request, "refresh_token");
                if (StringUtils.hasText(refreshToken)) {
                    String username = jwtService.extractUsername(refreshToken);
                    String mbrNm = jwtService.extractMbrNm(refreshToken);

                    Map<String, Object> extraClaims = new HashMap<>();
                    extraClaims.put("id", username);
                    extraClaims.put("mbrNm", mbrNm);

                    String accessToken = jwtService.generateAccessToken(extraClaims, username);
                    jwtService.createAccessTokenCookie(response, accessToken);
                    this.setAuthentication(accessToken);
                }
            } else {
                removeCookie(response);
            }
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

    private String extractToken(HttpServletRequest request, String cookieName) {
        return Optional.ofNullable(checkHeaderAuthorization(request))
                .orElseGet(() -> checkCookie(request, cookieName));
    }


    /**
     * 토큰이 유효하면 인증 정보를 설정합니다.
     */
    private void setAuthentication(String token) {
        if (!jwtService.isTokenValid(token)) {
            return;
        }

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

    /**
     * Authorization 헤더에서 토큰을 추출합니다.
     */
    private String checkHeaderAuthorization(HttpServletRequest request) {
        return Optional.ofNullable(request.getHeader(HttpHeaders.AUTHORIZATION))
                .filter(StringUtils::hasText)
                .map(header -> header.replace("Bearer ", ""))
                .orElse(null);
    }

    /**
     * 쿠키에서 토큰을 추출합니다.
     */
    private String checkCookie(HttpServletRequest request, String cookieName) {
        return Optional.ofNullable(request.getCookies())
                .filter(cookies -> cookies.length > 0)
                .map(cookies -> Arrays.stream(cookies)
                        .filter(cookie -> cookieName.equalsIgnoreCase(cookie.getName()))
                        .findFirst()
                        .map(Cookie::getValue)
                        .orElse(null))
                .orElse(null);
    }

    private void removeCookie(HttpServletResponse response) {
        Cookie cookie = new Cookie("access_token", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
