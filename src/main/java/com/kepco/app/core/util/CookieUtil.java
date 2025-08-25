package com.kepco.app.core.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class CookieUtil {

    public static String getValue(HttpServletRequest request, String name) throws UnsupportedEncodingException {
        Cookie[] cookies = request.getCookies();
        if(cookies == null) {
            return "";
        }
        for(Cookie cookie: cookies) {
            if (cookie.getName().equals(name)) {
                return URLDecoder.decode(cookie.getValue(), "UTF-8");
            }
        }
        return "";
    }

    public static Cookie createCookie(String name, String value, int maxAge) throws UnsupportedEncodingException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
        cookie.setPath("/");
        cookie.setMaxAge(maxAge);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        return cookie;
    }

    public static Cookie createCookie(String name, String value, int maxAge, boolean httpOnly) throws UnsupportedEncodingException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
        cookie.setPath("/");
        cookie.setMaxAge(maxAge);
        cookie.setHttpOnly(httpOnly);
        cookie.setSecure(true);
        return cookie;
    }
}
