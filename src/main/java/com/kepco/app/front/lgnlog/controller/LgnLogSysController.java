package com.kepco.app.front.lgnlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sys/**/lgnlog")
@Controller
public class LgnLogSysController {

    @GetMapping("/list")
    public String sysLoginLogList() {
        return "lgnlog/sysList";
    }

}
