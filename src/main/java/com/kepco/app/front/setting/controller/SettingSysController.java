package com.kepco.app.front.setting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/settings")
public class SettingSysController {

    @GetMapping("/setting")
    public String setting() {
        return "/sys/setting/setting";
    }
}
