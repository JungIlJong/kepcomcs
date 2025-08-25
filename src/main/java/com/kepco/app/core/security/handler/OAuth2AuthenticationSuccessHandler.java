package com.kepco.app.core.security.handler;


import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.kepco.app.core.security.context.UserContext;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.security.service.SnsLoginService;
import com.kepco.app.core.vo.LoginVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
public class OAuth2AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final SnsLoginService snsLoginService;
    private final UserDetailsService mberUserDetailsService;
    private final JwtService jwtService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {

        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        String provider = oAuth2User.getAttribute("provider");
        String providerId = oAuth2User.getAttribute("id");
        String targetUrl = "/index";
        Map<String, Object> userInfo = findUserByProviderInfo(provider, providerId);
        if (userInfo != null) {
            // 회원 있을 때
            String username = String.valueOf(userInfo.get("LOGIN_ID"));
            String password = null;

            UserContext userContext = (UserContext) mberUserDetailsService.loadUserByUsername(username);
            LoginVO loginVO = userContext.getLoginVO();
            String sttusCode = loginVO.getSttsCd();

            // 계정이 있을 경우
            if(sttusCode.equals("A")) { // 정상일 경우
                Map<String, Object> extraClaims = new HashMap<>();
                extraClaims.put("id", loginVO.getId());
                extraClaims.put("mbrNm", loginVO.getMbrNm());
                String accessToken = jwtService.generateAccessToken(extraClaims, loginVO.getId());
                jwtService.createAccessTokenCookie(response, accessToken);
                String refreshToken = jwtService.generateRefreshToken(extraClaims, loginVO.getId());
                jwtService.createRefreshTokenCookie(response, refreshToken);
            } else {
                // 비정상일 경우
                targetUrl = "/err/errorLogin?code=" + sttusCode;
            }
        } else {
            snsLoginService.joinMbr(oAuth2User.getAttributes());
            targetUrl = "/err/errorLogin?code=joinSuccess";
        }
        sendRedirect(request, response, targetUrl);
    }

    private Map<String, Object> findUserByProviderInfo(String provider, String providerId) {
        Map<String, Object> param = new HashMap<>();
        param.put("providerId", providerId);
        param.put("provider", provider);
        return snsLoginService.selectSnsMemberInfo(param);
    }

    private void sendRedirect(HttpServletRequest request, HttpServletResponse response, String targetUrl) throws IOException {
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
}
