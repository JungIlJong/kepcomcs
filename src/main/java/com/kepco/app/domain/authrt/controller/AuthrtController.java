package com.kepco.app.domain.authrt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sys/**/authrt")
@Controller
public class AuthrtController {

    @GetMapping("/list")
    public String authrtList() {
        return "sys/authrt/list";
    }

    @GetMapping("/detail")
    public String authrtDetail() {
        return "sys/authrt/detail";
    }

    @GetMapping("/save")
    public String authrtSave() {
        return "sys/authrt/save";
    }

}
