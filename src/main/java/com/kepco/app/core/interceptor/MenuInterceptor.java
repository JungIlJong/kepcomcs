package com.kepco.app.core.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.accesslog.mapper.AccessLogMapper;
import com.kepco.app.domain.menu.dto.Menu;
import com.kepco.app.domain.menu.mapper.MenuSysMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class MenuInterceptor implements HandlerInterceptor {

    private static final String INDEX_URL = "/index";

    private static final String DIR = "DIR";

    private final MenuSysMapper menuSysMapper;

    private final AccessLogMapper accessMapper;

    public MenuInterceptor(MenuSysMapper menuSysMapper, AccessLogMapper accessMapper) {
        this.menuSysMapper = menuSysMapper;
        this.accessMapper = accessMapper;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean result = false;

        String requestURI = request.getRequestURI();

        final String subRequestURI = requestURI.substring(0, requestURI.lastIndexOf("/"));

        List<Menu> menuList = new ArrayList<>();

//        List<String> authorityList = UserDetailsUtil.getAuthorityList();
        menuList = menuSysMapper.selectMenuList("MNGR");

        for (Menu menu : menuList) {
            String url = menu.getUrl();
            if (StringUtils.hasText(url) && !url.equals(DIR)) {
                url = url.substring(0, url.lastIndexOf("/"));
            }

            if (url.equals(subRequestURI)) {
                result = true;
                break;
            }
        }

        if (result) {
            request.setAttribute("menuList", menuList);
            return result;
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return result;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {

            String requestURI = request.getRequestURI();
            log.info("### requestURI: {}", requestURI);
            modelAndView.addObject("requestUri", requestURI);

            final String subRequestURI = requestURI.substring(0, requestURI.lastIndexOf("/"));

            Map<Long, Menu> menuMap = new HashMap<>();

            List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

            String menuNm = "";
            for (Menu menu : menuList) {
                if (menu.getUrl().contains(subRequestURI)) {
                    modelAndView.addObject("menuTitle", menu.getMenuNm());
                    menuNm = menu.getMenuNm();
                }
                menuMap.put(menu.getMenuId(), menu);
            }

            for (Menu menu : menuList) {
                Long upperMenuId = menu.getUpperMenuId();
                if (upperMenuId != null) {
                    Menu upperMenu = menuMap.get(upperMenuId);
                    if (upperMenu != null) {
                        upperMenu.getChildList().add(menu);
                    }
                }
            }

            if (!menuList.isEmpty()) {
                modelAndView.addObject("menuItems", menuList.get(0));
            }
            
            if (requestURI.startsWith("/sys/") && !requestURI.contains("/api")) {
                Map<String, Object> paramMap = new HashMap<>();
                paramMap.put("userId", UserDetailsUtil.getId());
                paramMap.put("userNm", UserDetailsUtil.getName());
                paramMap.put("clientIp", request.getRemoteAddr());
                paramMap.put("url", requestURI);
                paramMap.put("menuNm", menuNm);
                accessMapper.insertAccessLog(paramMap);
            }
        }
    }

}
