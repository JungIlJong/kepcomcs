package com.kepco.app.common.util;

import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

public abstract class ClientUtils {

    public static String getClientIp(HttpServletRequest request) {
        String ipAddr = request.getHeader("X-Forwarded-For");
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("Proxy-Client-IP");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("HTTP_CLIENT_IP");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("X-Real-IP");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("X-RealIP");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getHeader("REMOTE_ADDR");
        }
        if (!StringUtils.hasText(ipAddr)) {
            ipAddr = request.getRemoteAddr();
        }
        return ipAddr;
    }

    public static String getOsName(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.toLowerCase().contains("windows")) {
            return "Windows";
        } else if (userAgent.toLowerCase().contains("mac")) {
            return "macOS";
        } else if (userAgent.toLowerCase().contains("x11") || userAgent.toLowerCase().contains("linux")) {
            return "Linux";
        } else if (userAgent.toLowerCase().contains("iphone") || userAgent.toLowerCase().contains("ipad")) {
            return "iOS";
        } else if (userAgent.toLowerCase().contains("android")) {
            return "Android";
        } else {
            return "Unknown OS";
        }
    }



}
