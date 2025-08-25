package com.kepco.app.core.security.service;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Service;

import com.kepco.app.common.CommonErrorCode;
import com.kepco.app.common.exception.CommonException;

import javax.servlet.http.HttpServletResponse;
import java.security.Key;
import java.util.Date;
import java.util.Map;
import java.util.function.Function;

@Slf4j
@Service("jwtService")
public class JwtService {

    private final String secret;

    private final String accessTokenExpiration;

    private final String refreshTokenExpiration;


    public JwtService(Environment env) {
        this.secret = env.getProperty("token.secret");
        this.accessTokenExpiration = env.getProperty("token.accessTokenExpiration");
        this.refreshTokenExpiration = env.getProperty("token.refreshToeknExpiration");
    }

    public String generateAccessToken(Map<String, Object> extraClaims, String username) {
        return Jwts.builder()
                .setClaims(extraClaims)
                .setSubject(username)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + Long.parseLong(accessTokenExpiration)))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public String generateRefreshToken(Map<String, Object> extraClaims, String username) {
        return Jwts.builder()
                .setClaims(extraClaims)
                .setSubject(username)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + Long.parseLong(refreshTokenExpiration)))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public void createAccessTokenCookie(HttpServletResponse response, String token) {
        int maxAge = (int) (Long.parseLong(accessTokenExpiration + 60000) / 1000);

        ResponseCookie cookie = ResponseCookie.from("access_token", token)
                .httpOnly(true)
                .secure(true)
                .path("/")
                .maxAge(maxAge)
                .sameSite("Lax")
                .build();

        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());
    }

    public void createRefreshTokenCookie(HttpServletResponse response, String token) {
        int maxAge = (int) (Long.parseLong(refreshTokenExpiration + 60000) / 1000);

        ResponseCookie cookie = ResponseCookie.from("refresh_token", token)
                .httpOnly(true)
                .secure(true)
                .path("/")
                .maxAge(maxAge)
                .sameSite("Lax")
                .build();

        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());
    }

    public boolean isTokenValid(String token) {
        try {
            Jwts.parserBuilder()
                    .setSigningKey(getSignInKey())
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
            return true;
        } catch (ExpiredJwtException e) {
            log.debug("Expired JWT token: {}", e.getMessage());
            throw new CommonException(CommonErrorCode.EXPIRED);
        } catch (MalformedJwtException e) {
            log.debug("Malformed JWT token: {}", e.getMessage());
            throw new CommonException(CommonErrorCode.EXPIRED);
        } catch (UnsupportedJwtException e) {
            log.debug("Unsupported JWT token: {}", e.getMessage());
            throw new CommonException(CommonErrorCode.EXPIRED);
        } catch (IllegalArgumentException e) {
            log.debug("IllegalArgument JWT token: {}", e.getMessage());
            throw new CommonException(CommonErrorCode.EXPIRED);
        } catch (Exception e) {
            log.debug("Exception: {}", e.getMessage());
            throw new CommonException(CommonErrorCode.EXPIRED);
        }
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    public String extractMbrNm(String token) {
        Claims claims = extractAllClaims(token);
        return (String) claims.get("mbrNm");
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    private Key getSignInKey() {
        byte[] keyBytes = Decoders.BASE64.decode(secret);
        return Keys.hmacShaKeyFor(keyBytes);
    }

}
