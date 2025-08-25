package com.kepco.app.domain.login.api;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.CommonResponse;
import com.kepco.app.core.security.service.JwtService;
import com.kepco.app.core.vo.LoginVO;
import com.kepco.app.domain.login.dto.*;
import com.kepco.app.domain.login.service.LoginService;
import com.kepco.app.domain.mbr.dto.Mbr;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Slf4j
@RequestMapping("/api")
@RestController
@Tag(name = "인증", description = "로그인 및 인증 관련 API")
public class LoginApi {

    private final LoginService loginService;

    private final JwtService jwtService;

    public LoginApi(LoginService loginService, JwtService jwtService) {
        this.loginService = loginService;
        this.jwtService = jwtService;
    }

    @Operation(
        summary = "로그인 API",
        description = "사용자 ID와 비밀번호를 이용하여 로그인하고 JWT 토큰을 발급합니다. " +
                      "응답에는 access_token 쿠키와 rememberMe가 true인 경우 refresh_token 쿠키도 포함됩니다."
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200", 
            description = "로그인 성공. 응답 헤더에 access_token 쿠키와 rememberMe가 true인 경우 refresh_token 쿠키가 포함됩니다.", 
            content = @Content(schema = @Schema(implementation = JwtLoginResponse.class))
        ),
        @ApiResponse(responseCode = "401", description = "인증 실패"),
        @ApiResponse(responseCode = "400", description = "잘못된 요청")
    })
    @PostMapping("/v1/login")
    public ResponseEntity<?> login(
            @Parameter(description = "로그인 요청 정보", required = true) 
            @RequestBody @Valid JwtLoginRequest jwtLoginRequest, 
            HttpServletResponse response) {
        LoginResult result = loginService.login(jwtLoginRequest);
        if (!result.isSuccess()) {
            return CommonResponse.error(result.getErrorCode());
        }
        LoginVO loginVO = result.getLoginVO();
        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("id", loginVO.getId());
        extraClaims.put("mbrNm", loginVO.getMbrNm());
        boolean rememberMe = Boolean.TRUE.equals(jwtLoginRequest.isRememberMe());
        String accessToken = jwtService.generateAccessToken(extraClaims, loginVO.getId());
        jwtService.createAccessTokenCookie(response, accessToken);
        JwtLoginResponse loginResponse = new JwtLoginResponse();
        loginResponse.setAccessToken(accessToken);
        if (rememberMe) {
            String refreshToken = jwtService.generateRefreshToken(extraClaims, loginVO.getId());
            jwtService.createRefreshTokenCookie(response, refreshToken);
            loginResponse.setRefreshToken(refreshToken);
        }
        return CommonResponse.success(loginResponse);
    }

    @Operation(
        summary = "토큰 갱신 API",
        description = "리프레시 토큰을 이용하여 새로운 액세스 토큰을 발급합니다. " +
                      "리프레시 토큰은 Authorization 헤더(Bearer 방식) 또는 refresh_token 쿠키에서 추출합니다. " +
                      "응답에는 새로운 access_token 쿠키가 포함됩니다."
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200", 
            description = "토큰 갱신 성공. 응답 헤더에 새로운 access_token 쿠키가 포함됩니다.", 
            content = @Content(schema = @Schema(implementation = Map.class))
        ),
        @ApiResponse(responseCode = "401", description = "인증 실패 또는 유효하지 않은 리프레시 토큰")
    })
    @PostMapping("/v1/refresh")
    public ResponseEntity<?> refreshAccessToken(
            HttpServletRequest request, 
            HttpServletResponse response, 
            @Parameter(description = "리프레시 토큰 (쿠키에서 자동으로 추출)")
            @CookieValue(name = "refresh_token", required = false) String refreshToken) {
        if (StringUtils.hasText(request.getHeader(HttpHeaders.AUTHORIZATION))) {
            String token = request.getHeader(HttpHeaders.AUTHORIZATION).replace("Bearer ", "");
            if (jwtService.isTokenValid(token)) {
                log.debug("Authorization Header Refresh Token");
                String username = jwtService.extractUsername(token);
                String mbrNm = jwtService.extractMbrNm(token);

                Map<String, Object> extraClaims = new HashMap<>();
                extraClaims.put("id", username);
                extraClaims.put("mbrNm", mbrNm);

                String accessToken = jwtService.generateAccessToken(extraClaims, username);

                Map<String, Object> resultMap = new HashMap<>();
                resultMap.put("accessToken", accessToken);
                jwtService.createAccessTokenCookie(response, accessToken);
                return CommonResponse.success(resultMap);
            }
        }
        if (Objects.nonNull(refreshToken)) {
            log.debug("Cookie Refresh Token");
            if (jwtService.isTokenValid(refreshToken)) {
                log.debug("Authorization Header Refresh Token");
                String username = jwtService.extractUsername(refreshToken);
                String mbrNm = jwtService.extractMbrNm(refreshToken);

                Map<String, Object> extraClaims = new HashMap<>();
                extraClaims.put("id", username);
                extraClaims.put("mbrNm", mbrNm);

                String accessToken = jwtService.generateAccessToken(extraClaims, username);

                Map<String, Object> resultMap = new HashMap<>();
                resultMap.put("accessToken", accessToken);
                jwtService.createAccessTokenCookie(response, accessToken);
                return CommonResponse.success(resultMap);
            }
        }

        return CommonResponse.error(CommonErrorCode.UNAUTHORIZED);
    }

    @GetMapping("/logout")
    public ResponseEntity<?> logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("access_token", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        return CommonResponse.success(1);
    }

    @PostMapping("/findId")
    public ResponseEntity<?> apiFindId(@RequestBody FindId findId) {
        Mbr mbr = loginService.selectMbrByMbrNmAndEmlAddr(findId);

        if (Objects.isNull(mbr)) {
            return CommonResponse.error(CommonErrorCode.NOT_FOUND);
        }

        return CommonResponse.success(mbr);
    }

    @PostMapping("/findPw")
    public ResponseEntity<?> apiFindPw(@RequestBody FindPw findPw, HttpServletRequest request) {
        Mbr mbr = loginService.selectMbrByIdAndMbrNmAndEmlAddr(findPw);

        if (Objects.isNull(mbr)) {
            return CommonResponse.error(CommonErrorCode.NOT_FOUND);
        }

        String uuid = mbr.getUuid();

        request.getSession().setAttribute("uuid", uuid);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }

    @PostMapping("/resetPw")
    public ResponseEntity<?> apiResetPw(@RequestBody ResetPw resetPw, HttpServletRequest request) {
        if (Objects.isNull(request.getSession().getAttribute("uuid"))) {
            return CommonResponse.error(CommonErrorCode.NOT_FOUND);
        }

        String uuid = (String) request.getSession().getAttribute("uuid");
        resetPw.setUuid(uuid);

        loginService.updateMbrPswdByUuid(resetPw);

        request.getSession().removeAttribute("uuid");

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("uuid", uuid);

        return CommonResponse.success(resultMap);
    }

    @Operation(
        summary = "토큰 유효성 검사 API",
        description = "액세스 토큰의 유효성을 검사합니다."
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200", 
            description = "토큰 유효성 성공", 
            content = @Content(schema = @Schema(implementation = Map.class))
        ),
        @ApiResponse(responseCode = "401", description = "인증 실패 또는 유효하지 않은 액세스 토큰")
    })
    @GetMapping("/v1/token/verify")
    public ResponseEntity<?> verifyToken(@CookieValue(name = "access_token", required = false) String token) {
        Map<String, Object> resultMap = new HashMap<>();
        boolean result = false;
        if(Objects.nonNull(token)) {
            result = jwtService.isTokenValid(token);
        }
        resultMap.put("result", result);
        return ResponseEntity.ok(resultMap);
    }
}
