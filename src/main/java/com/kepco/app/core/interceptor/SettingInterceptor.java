package com.kepco.app.core.interceptor;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kepco.app.domain.setting.service.SettingSysService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RequiredArgsConstructor
public class SettingInterceptor implements HandlerInterceptor {
    private final SettingSysService settingSysService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if(modelAndView != null) {
            modelAndView.addObject("setting", settingSysService.selectAll());
        }
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
}
