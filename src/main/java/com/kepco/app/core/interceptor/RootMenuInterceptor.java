package com.kepco.app.core.interceptor;

import lombok.extern.slf4j.Slf4j;
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
public class RootMenuInterceptor implements HandlerInterceptor {

    private static final String INDEX_URL = "/index";

    private static final String DIR = "DIR";

    private final MenuSysMapper menuSysMapper;

    public RootMenuInterceptor(MenuSysMapper menuSysMapper) {
        this.menuSysMapper = menuSysMapper;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
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
