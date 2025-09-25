package com.kepco.app.core.security.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.kepco.app.core.vo.LoginVO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserDetailsUtil {

    public static LoginVO getAuthenticatedUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof LoginVO) {
            return (LoginVO) authentication.getPrincipal();
        } else {
            return new LoginVO();
        }
    }

    public static boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.getPrincipal() instanceof LoginVO;
    }

    public static boolean isAuthorized(String roleCode) {
        if (roleCode == null) {
            roleCode = "";
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                if (authority.getAuthority().equals(roleCode)) {
                    return true;
                }
            }
        }

        return false;
    }

    public static boolean isAuthorized(List<String> roleList) {
        if (roleList == null) {
            roleList = new ArrayList<>();
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                for (String role : roleList) {
                    if (authority.getAuthority().equals(role)) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    public static List<String> getAuthorityList() {
        List<String> authorityList = new ArrayList<>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                authorityList.add(authority.getAuthority());
            }
            return authorityList;
        }

        return new ArrayList<>();
    }

    public static String getId() {
        return getAuthenticatedUser().getId();
    }

    public static String getMbrId() {
    	return String.valueOf(getAuthenticatedUser().getMbrId());
    }

    public static String getName() {
        return getAuthenticatedUser().getMbrNm();
    }

    public static String getUuid() {
        return getAuthenticatedUser().getUuid();
    }

}
