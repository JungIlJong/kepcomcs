package com.kepco.app.core.security.provider;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Oauth2Provider {
    NAVER("naver"),
    KAKAO("kakao");
    private final String providerId;

}
