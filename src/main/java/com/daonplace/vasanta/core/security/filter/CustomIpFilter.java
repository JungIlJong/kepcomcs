package com.daonplace.vasanta.core.security.filter;

import com.daonplace.vasanta.common.util.ClientUtils;
import com.daonplace.vasanta.domain.accessip.service.AccessIpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.web.util.matcher.IpAddressMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Slf4j
public class CustomIpFilter extends OncePerRequestFilter {

    private final AccessIpService accessIpService;

    private final RequestMatcher[] requestMatchers;

    public CustomIpFilter(AccessIpService accessIpService, RequestMatcher... requestMatchers) {
        this.accessIpService = accessIpService;
        this.requestMatchers = requestMatchers;

    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String clientIp = ClientUtils.getClientIp(request);

        List<String> allowedIpList = accessIpService.selectAllAccessIpList();

        boolean isAllowed = false;

        for (String allowedIp : allowedIpList) {
            IpAddressMatcher ipAddressMatcher = new IpAddressMatcher(allowedIp);
            if (ipAddressMatcher.matches(clientIp)) {
                isAllowed = true;
                break;
            }
        }

        if (!isAllowed) {
            log.info("IP address [{}] not allowed", clientIp);
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Forbidden IP");
            return;
        }
        filterChain.doFilter(request, response);
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        for (RequestMatcher requestMatcher : requestMatchers) {
            if (requestMatcher.matches(request)) {
                return false;
            }
        }
        return true;
    }
}
