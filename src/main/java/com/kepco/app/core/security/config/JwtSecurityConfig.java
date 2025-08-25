package com.kepco.app.core.security.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;

import com.kepco.app.core.security.filter.JwtCookieFilter;
import com.kepco.app.core.security.filter.JwtHeaderFilter;
import com.kepco.app.core.security.service.CustomUserDetailsService;
import com.kepco.app.core.security.service.JwtService;


@Configuration
@RequiredArgsConstructor
public class JwtSecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;

    private final JwtService jwtService;

    private final HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository;

    @Order(1)
    @Bean
    public SecurityFilterChain jwtSecurityFilterChain(HttpSecurity http) throws Exception {
        http
                .requestMatcher(new OrRequestMatcher(
                        new AntPathRequestMatcher("/api/mber/**"),
                        new AntPathRequestMatcher("/mber/**"),
                        new AntPathRequestMatcher("/api/v1/**")
                ))
                .csrf(AbstractHttpConfigurer::disable)
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .formLogin(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(autzh -> autzh
                        .antMatchers("/swagger-ui/**", "/v3/api-docs/**", "/swagger-ui.html").permitAll()
                        .antMatchers("/api/v1/login").permitAll()
                        .anyRequest().permitAll())
                .addFilterBefore(jwtCookieFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(jwtHeaderFilter(), UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public JwtCookieFilter jwtCookieFilter() {
        return new JwtCookieFilter(jwtService, customUserDetailsService,
                "/sys/**",
                "/api/sys/**",
                "/api/v1/login",
                "/api/token/verify",
                "/api/v1/refresh",
                "/api/findId",
                "/api/findPw",
                "/**/*.css",
                "/**/*.js",
                "/**/*.png",
                "/**/*.json",
                "/file/**",
                "/api/mber/popups/**",
                "/api/banners");
    }

    @Bean
    public JwtHeaderFilter jwtHeaderFilter() {
        return new JwtHeaderFilter(jwtService, customUserDetailsService,
                "/sys/**",
                "/api/sys/**",
                "/api/v1/login",
                "/api/token/verify",
                "/api/v1/refresh",
                "/api/findId",
                "/api/findPw",
                "/**/*.css",
                "/**/*.js",
                "/**/*.png",
                "/**/*.json",
                "/file/**",
                "/api/mber/popups/**",
                "/api/banners");
    }
}
