package com.kepco.app.core.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kepco.app.domain.menu.dto.Menu;
import com.kepco.app.domain.menu.mapper.MenuSysMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        if (requestURI.equals(INDEX_URL)) {
            request.setAttribute("menuList", menuList);
            return true;
        }

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

            for (Menu menu : menuList) {
                if (menu.getUrl().contains(subRequestURI)) {
                    modelAndView.addObject("menuTitle", menu.getMenuNm());
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
        }
    }

}
