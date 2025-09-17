package com.kepco.app.core.interceptor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kepco.app.domain.menu.dto.Menu;
import com.kepco.app.domain.menu.mapper.MenuSysMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserMenuInterceptor implements HandlerInterceptor {

    private static final String INDEX_URL = "/index";

    private static final String DIR = "DIR";

    private final MenuSysMapper menuSysMapper;

    public UserMenuInterceptor(MenuSysMapper menuSysMapper) {
        this.menuSysMapper = menuSysMapper;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean result = false;
        log.info("userMenuInterceptor {}", request.getRequestURI());

        String requestURI = request.getRequestURI();

        final String subRequestURI = requestURI.substring(0, requestURI.lastIndexOf("/"));

        List<Menu> menuList = menuSysMapper.selectMenuList("MBER");
        request.setAttribute("menuList", menuList);
        return true;
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

            for (Menu menu : menuList) {
                if (menu.getUrl().contains(subRequestURI)) {
                    modelAndView.addObject("menuTitle", menu.getMenuNm());
                    modelAndView.addObject("menuSj", menu.getMenuSj());
                }
                menuMap.put(menu.getMenuId(), menu);
            }

            List<Menu> breadcrumb = new ArrayList<>();
            Menu currentMenu = null;

            for (Menu menu : menuList) {
                Long upperMenuId = menu.getUpperMenuId();
                if (upperMenuId != null) {
                    Menu upperMenu = menuMap.get(upperMenuId);
                    if (upperMenu != null) {
                        upperMenu.getChildList().add(menu);
                    }
                }
                
                if (menu.getUrl() != null && menu.getUrl().contains(subRequestURI)) {
                    currentMenu = menu;
                }
            }
            
            while (currentMenu != null) {
            	String resolvedUrl;

                if ("HOME".equalsIgnoreCase(currentMenu.getMenuNm()) || currentMenu.getUpperMenuId() == 0) {
                    resolvedUrl = "/"; 
                } else {
                    resolvedUrl = resolveMenuUrl(currentMenu, menuMap);
                }
                
        	    currentMenu.setUrl(resolvedUrl);
        	    breadcrumb.add(currentMenu);

        	    Long upperId = currentMenu.getUpperMenuId();
        	    currentMenu = (upperId != null) ? menuMap.get(upperId) : null;
            }

            Collections.reverse(breadcrumb);
            modelAndView.addObject("breadcrumb", breadcrumb);

            if (!menuList.isEmpty()) {
                modelAndView.addObject("menuItems", menuList.get(0));
            }
        }
    }

    private String resolveMenuUrl(Menu menu, Map<Long, Menu> menuMap) {
        if (!"DIR".equals(menu.getMenuTy())) {
            return menu.getUrl(); 
        }

        for (Menu child : menu.getChildList()) {
            if (child.getUrl() != null && !"DIR".equals(child.getMenuTy())) {
                return child.getUrl();
            }
        }

        for (Menu child : menu.getChildList()) {
            String url = resolveMenuUrl(child, menuMap);
            if (url != null) return url;
        }

        return null; 
    }
}
