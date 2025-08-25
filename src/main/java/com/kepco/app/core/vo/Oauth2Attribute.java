package com.kepco.app.core.vo;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepco.app.core.security.provider.Oauth2Provider;

import lombok.Builder;
import lombok.Getter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Getter
public class Oauth2Attribute {
    private final Map<String, Object> attributes;
    private final String nameAttributeKey;
    private final String oauthId;
    private final String id;
    private final String nickname;
    private final String email;
    private final String picture;
    private final Oauth2Provider provider;

    @Builder
    public Oauth2Attribute(Map<String, Object> attributes, String nameAttributeKey, String oauthId, String id, String nickname, String email, String picture, Oauth2Provider provider) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.oauthId = oauthId;
        this.id = id;
        this.nickname = nickname;
        this.email = email;
        this.picture = picture;
        this.provider = provider;
    }

    @SneakyThrows
    public static Oauth2Attribute of(String registrationId, String userNameAttributeName, Map<String, Object> attributes) {
        log.info("userNameAttributeName = {}", new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(userNameAttributeName));
        log.info("attributes = {}", new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(attributes));
        String registrationIdToLower = registrationId.toLowerCase();
        switch (registrationIdToLower) {
            case "naver": return ofNaver(userNameAttributeName, attributes);
            case "kakao": return ofKakao(userNameAttributeName, attributes);
//            default: throw new OAuth2RegistrationException("해당 소셜 로그인은 현재 지원하지 않습니다.");
            default: throw null;
        }
    }

    @SuppressWarnings("unchecked")
    private static Oauth2Attribute ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        response.put("provider", "naver");
        return Oauth2Attribute.builder()
                .id((String) response.get("id"))
                .oauthId((String) response.get("id"))
                .nickname((String) response.get("name"))
                .email((String) response.get("email"))
                .picture((String) response.get("profile_image"))
                .provider(Oauth2Provider.NAVER)
                .attributes(response)
                .nameAttributeKey("id")
                .build();
    }

    @SuppressWarnings("unchecked")
    private static Oauth2Attribute ofKakao(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> account = (Map<String, Object>) attributes.get("kakao_account");
        Map<String, Object> profile = (Map<String, Object>) account.get("profile");
        account.put("provider", "kakao");
        account.put("id", attributes.get(userNameAttributeName).toString());
        account.put("name", profile.get("nickname"));
        return Oauth2Attribute.builder()
                .id(attributes.get(userNameAttributeName).toString())
                .oauthId(attributes.get(userNameAttributeName).toString())
                .nickname((String) profile.get("nickname"))
                .email((String) account.get("email"))
                .picture((String) profile.get("profile_image"))
                .provider(Oauth2Provider.KAKAO)
                .attributes(account)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }

    public Map<String, Object> convertToMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("key", id);
        map.put("email", email);
        map.put("provider", provider);
        return map;
    }

}
