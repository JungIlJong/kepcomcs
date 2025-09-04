package com.kepco.app.domain.login.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kepco.app.common.util.ClientUtils;
import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.lgnlog.dto.LgnLog;
import com.kepco.app.domain.lgnlog.service.LgnLogService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Controller
public class LoginController {

    private final SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();

    private final LgnLogService lgnLogService;

    public LoginController(LgnLogService lgnLogService) {
        this.lgnLogService = lgnLogService;
    }

    @GetMapping("/sys/login")
    public String sysLogin(@RequestParam(required = false) String error,
                           @RequestParam(required = false) String status,
                           @RequestParam(required = false) String failCnt,
                           Model model) {
        if (UserDetailsUtil.isAuthenticated()) {
            return "redirect:/sys/system/menu/mngrmenu/list";
        }

        model.addAttribute("failCnt", failCnt);
        model.addAttribute("error", error);
        model.addAttribute("status", status);

        return "sys/login/login";
    }

    @GetMapping("/sys/logout")
    public String sysLogout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        LgnLog lgnLog = new LgnLog();
        lgnLog.setAcsrId(Long.parseLong(UserDetailsUtil.getMbrId()));
        lgnLog.setAcsrNm(UserDetailsUtil.getName());
        lgnLog.setAcsrIpAddr(ClientUtils.getClientIp(request));
        lgnLog.setAcsrOsNm(ClientUtils.getOsName(request));
        lgnLog.setCntnSe("O");

        lgnLogService.insertLgnLog(lgnLog);

        if (authentication != null) {
            this.logoutHandler.logout(request, response, authentication);
        }

        return "redirect:/sys/login";
    }

    @GetMapping("/mber/**/login")
    public String login(
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String failCnt,
            Model model) {

        if (UserDetailsUtil.isAuthenticated()) {
            return "redirect:/index";
        }

        model.addAttribute("failCnt", failCnt);
        model.addAttribute("error", error);
        model.addAttribute("status", status);
        return "login/login";
    }

    @GetMapping("/mber/**/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        if (authentication != null) {
            LgnLog lgnLog = new LgnLog();
            lgnLog.setAcsrId(Long.parseLong(UserDetailsUtil.getMbrId()));
            lgnLog.setAcsrNm(UserDetailsUtil.getName());
            lgnLog.setAcsrIpAddr(ClientUtils.getClientIp(request));
            lgnLog.setAcsrOsNm(ClientUtils.getOsName(request));
            lgnLog.setCntnSe("O");

            lgnLogService.insertLgnLog(lgnLog);
            this.logoutHandler.logout(request, response, authentication);
        }
        Cookie accessToken = new Cookie("access_token", "");
        accessToken.setMaxAge(0);
        accessToken.setPath("/");
        response.addCookie(accessToken);

        Cookie refreshToken = new Cookie("refresh_token", "");
        refreshToken.setMaxAge(0);
        refreshToken.setPath("/");
        response.addCookie(refreshToken);
        return "redirect:/mber/support/login/login";
    }

    @GetMapping("/mber/**/findId")
    public String findId() {
        return "login/findId";
    }

    @GetMapping("/mber/**/findPw")
    public String findPw() {
        return "login/findPw";
    }

    @GetMapping("/mber/**/resetPw")
    public String findPw(HttpServletRequest request) {
        if (Objects.isNull(request.getSession().getAttribute("uuid"))) {
            return "cmmn/error404";
        }

        return "login/resetPw";
    }

}
