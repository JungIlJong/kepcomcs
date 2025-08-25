package com.kepco.app.front.setting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kepco.app.core.security.util.UserDetailsUtil;

@RequestMapping("/m/settings")
@Controller
public class SettingController {

    @GetMapping("")
    public String settings() {
        if (!UserDetailsUtil.isAuthenticated()) {
            return "redirect:/mber/support/login/login";
        }

        return "mber/settings/settings";
    }

}
