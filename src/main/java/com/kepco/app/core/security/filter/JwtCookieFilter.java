package com.kepco.app.core.security.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.kepco.app.common.exception.CommonException;
import com.kepco.app.core.security.context.UserContext;
import com.kepco.app.core.security.service.CustomUserDetailsService;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.util.CookieUtil;
import com.kepco.app.core.vo.LoginVO;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
public class JwtCookieFilter extends OncePerRequestFilter {
    private final List<RequestMatcher> permitAllRequestMatchers = new ArrayList<>();
    private final JwtService jwtService;
    private final CustomUserDetailsService customUserDetailsService;

    public JwtCookieFilter(JwtService jwtService, CustomUserDetailsService customUserDetailsService, String... permitAllList) {
        this.jwtService = jwtService;
        this.customUserDetailsService = customUserDetailsService;
        setPermitAllRequestMatchers(permitAllList);
    }


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = CookieUtil.getValue(request, "access_token");
        if (StringUtils.hasText(token)) {
            try {
                if(jwtService.isTokenValid(token)) {
                    setAuthentication(token);
                }
            } catch (CommonException e) {
                removeCookie(response, "access_token");
                checkRefreshToken(request, response);
            }
        } else {
            checkRefreshToken(request, response);
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

    private void checkRefreshToken(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String refreshToken = CookieUtil.getValue(request, "refresh_token");
        if (StringUtils.hasText(refreshToken)) {
            try {
                if(jwtService.isTokenValid(refreshToken)) {
                    String username = jwtService.extractUsername(refreshToken);
                    String mbrNm = jwtService.extractMbrNm(refreshToken);
                    Map<String, Object> extraClaims = new HashMap<>();
                    extraClaims.put("id", username);
                    extraClaims.put("mbrNm", mbrNm);
                    String accessToken = jwtService.generateAccessToken(extraClaims, username);
                    jwtService.createAccessTokenCookie(response, accessToken);
                    setAuthentication(accessToken);
                }
            } catch (CommonException e) {
                removeCookie(response, "refresh_token");
            }
        }
    }

    private void setAuthentication(String token) {
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

    private void setPermitAllRequestMatchers(String... permitAllList) {
        for (String permitAll : permitAllList) {
            permitAllRequestMatchers.add(new AntPathRequestMatcher(permitAll));
        }
        permitAllRequestMatchers.add(new RegexRequestMatcher("/api/mber/bbs/\\d+$", HttpMethod.GET.name()));
    }

    private void removeCookie(HttpServletResponse response, String cookieName) {
        Cookie cookie = new Cookie(cookieName, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
