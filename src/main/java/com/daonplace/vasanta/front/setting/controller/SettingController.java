package com.daonplace.vasanta.front.setting.controller;

import com.daonplace.vasanta.core.security.util.UserDetailsUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
