package com.kepco.app.core.security.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.bbs.service.BbsRoleService;
import com.kepco.app.domain.ntt.dto.BbsRole;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Component
public class BbsRoleFilter extends OncePerRequestFilter {

    private final BbsRoleService bbsRoleService;
    private final String path = "^(?!.*\\/sys\\/bbs).*\\/bbs\\/([^/]+)\\/([^/]+).*" ;

    public BbsRoleFilter(BbsRoleService bbsRoleService) {
        this.bbsRoleService = bbsRoleService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        if (requestURI.startsWith("/sys")) {
	        Pattern pattern = Pattern.compile(path);
	        Matcher matcher = pattern.matcher(requestURI);
	        if (!matcher.find()) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "NOT_FOUND");
	            log.error("NOT FOUND BBS PATH: {}", requestURI);
	            return;
	        } else {
	            String result = bbsRoleService.checkRole(matcher.group(1), BbsRole.valueOf(matcher.group(2).toUpperCase()));
	            if (result == null || result.equalsIgnoreCase("N")) {
	                response.sendError(HttpServletResponse.SC_FORBIDDEN, "NOT ALLOW BBS TO MBER");
	                log.error("NOT ALLOW PATH({}) TO USER({})", requestURI, UserDetailsUtil.getMbrId());
	                return;
	            }
	        }
        }
        filterChain.doFilter(request, response);
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
        String requestUri = request.getRequestURI();
        return !requestUri.matches(path);
    }

}
