package com.kepco.app.core.security.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;

import com.kepco.app.core.security.handler.OAuth2AuthenticationSuccessHandler;
import com.kepco.app.core.security.handler.Oauth2AuthenticationFailureHandler;
import com.kepco.app.core.security.provider.CustomAuthenticationProvider;
import com.kepco.app.core.security.service.CustomOAuth2UserService;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.security.service.SnsLoginService;

@RequiredArgsConstructor
@Configuration
public class SnsSecurityConfig {

    private final UserDetailsService userDetailsService;
    private final SnsLoginService snsLoginService;
    private final JwtService jwtService;

    @Order(1)
    @Bean
    public SecurityFilterChain snsMberFilterChain(HttpSecurity http) throws Exception {

        http
                .requestMatcher(new OrRequestMatcher(
                        new AntPathRequestMatcher("/oauth2/**"),
                        new AntPathRequestMatcher("/api/snslogin/**"),
                        new AntPathRequestMatcher("/oauth2/callback/**")
                ))
                .cors()
                .and()
                .httpBasic().disable()
                .authorizeRequests()
                .antMatchers("/oauth2/**", "/api/snslogin/**").permitAll()
                .and()
                .oauth2Login()
                .loginPage("/mber/support/login/login")
                .redirectionEndpoint()
                .baseUri("/oauth2/callback/**")
                .and()
                .userInfoEndpoint()
                .userService(customOAuth2UserService())
                .and()
                .successHandler(oAuth2AuthenticationSuccessHandler())
                .failureHandler(oauth2AuthenticationFailureHandler()).permitAll();
        return http.build();
    }

    @Bean
    public CustomOAuth2UserService customOAuth2UserService() {
        return new CustomOAuth2UserService();
    }

    @Bean
    public OAuth2AuthenticationSuccessHandler oAuth2AuthenticationSuccessHandler() {
        return new OAuth2AuthenticationSuccessHandler(snsLoginService, userDetailsService, jwtService);
    }

    @Bean
    public Oauth2AuthenticationFailureHandler oauth2AuthenticationFailureHandler() {
        return new Oauth2AuthenticationFailureHandler();
    }
}
