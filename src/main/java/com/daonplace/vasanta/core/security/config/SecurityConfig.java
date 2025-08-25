package com.daonplace.vasanta.core.security.config;

import com.daonplace.vasanta.core.security.CustomAuthenticationEntryPoint;
import com.daonplace.vasanta.core.security.CustomWebAuthenticationDetailsSource;
import com.daonplace.vasanta.core.security.filter.BbsRoleFilter;
import com.daonplace.vasanta.core.security.filter.CustomIpFilter;
import com.daonplace.vasanta.core.security.filter.CustomLoginProcessingFilter;
import com.daonplace.vasanta.core.security.handler.CustomAccessDeniedHandler;
import com.daonplace.vasanta.core.security.handler.CustomAuthenticationFailureHandler;
import com.daonplace.vasanta.core.security.handler.CustomAuthenticationSuccessHandler;
import com.daonplace.vasanta.core.security.provider.CustomAuthenticationProvider;
import com.daonplace.vasanta.core.security.service.CustomUserDetailsService;
import com.daonplace.vasanta.core.security.util.AuthenticationManagerUtil;
import com.daonplace.vasanta.domain.accessip.service.AccessIpService;
import com.daonplace.vasanta.domain.lgnlog.service.LgnLogService;
import com.daonplace.vasanta.domain.login.service.LoginService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;

@Slf4j
@RequiredArgsConstructor
@Configuration
public class SecurityConfig {

    private final ObjectMapper objectMapper;

    private final LoginService loginService;

    private final Environment env;

    private final AccessIpService accessIpService;

    private final PasswordEncoder passwordEncoder;

    private final LgnLogService lgnLogService;

    private final BbsRoleFilter bbsRoleFilter;


    @Order(2)
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        AuthenticationManager authenticationManager = AuthenticationManagerUtil.create(http, customAuthenticationProvider());

        http
                .requestMatcher(new OrRequestMatcher(
                        new AntPathRequestMatcher("/api/sys/**"),
                        new AntPathRequestMatcher("/sys/**"),
                        new AntPathRequestMatcher("/api/login"),
                        new AntPathRequestMatcher("/file", HttpMethod.POST.name())
                ))
                .csrf(csrf -> csrf
                        .csrfTokenRepository(httpSessionCsrfTokenRepository())
                        .ignoringAntMatchers("/file/ckeditor", "/file/ckeditor&responseType=json", "/testUpload"))
                .formLogin().disable()
                .httpBasic().disable()
                .authenticationManager(authenticationManager)
                .authorizeHttpRequests(authz -> authz
                        .antMatchers("/swagger-ui/**", "/v3/api-docs/**", "/swagger-ui.html").permitAll()
                        .antMatchers("/login", "/oauth2/**").permitAll()

                        .antMatchers("/sys/login").permitAll()
                        .antMatchers("/api/login").permitAll()
                        .antMatchers("/api/token/verify").permitAll()
                        .antMatchers("/sys/**", "/api/sys/**").hasRole("ADMIN"))
                .exceptionHandling(e -> e
                        .authenticationEntryPoint(customAuthenticationEntryPoint()))
//                        .accessDeniedHandler(customAccessDeniedHandler()))
                .addFilterBefore(customIpFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterAfter(customLoginProcessingFilter(authenticationManager), UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(bbsRoleFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public AuthenticationEntryPoint customAuthenticationEntryPoint() {
        return new CustomAuthenticationEntryPoint(this.objectMapper);
    }

    @Bean
    public AccessDeniedHandler customAccessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }

    @Bean
    public CustomWebAuthenticationDetailsSource webAuthenticationDetailsSource() {
        return new CustomWebAuthenticationDetailsSource();
    }

    @Bean
    public HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository() {
        HttpSessionCsrfTokenRepository repository = new HttpSessionCsrfTokenRepository();
        repository.setParameterName("anticsrf");
        return repository;
    }

    public CustomLoginProcessingFilter customLoginProcessingFilter(AuthenticationManager authenticationManager) throws Exception {
        CustomLoginProcessingFilter filter = new CustomLoginProcessingFilter(objectMapper);
        filter.setAuthenticationManager(authenticationManager);
        filter.setAuthenticationSuccessHandler(customAuthenticationSuccessHandler());
        filter.setAuthenticationFailureHandler(customAuthenticationFailureHandler());
        return filter;
    }

    @Bean
    public CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler(objectMapper, lgnLogService);
    }

    @Bean
    public CustomAuthenticationFailureHandler customAuthenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler(objectMapper);
    }

    private CustomAuthenticationProvider customAuthenticationProvider() {
        return new CustomAuthenticationProvider(customUserDetailsService(), passwordEncoder, env, loginService);
    }

    @Bean
    public CustomUserDetailsService customUserDetailsService() {
        return new CustomUserDetailsService(loginService);
    }

    public CustomIpFilter customIpFilter() {
        return new CustomIpFilter(accessIpService, new AntPathRequestMatcher("/sys/**"), new AntPathRequestMatcher("/api/sys/**"));
    }

}
