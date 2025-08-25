package com.kepco.app.core.security;

import lombok.Getter;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;

@Getter
public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    private final String userSe;

    public CustomWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        this.userSe = request.getParameter("userSe");
    }

}
