package com.daonplace.vasanta.front.push.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/push")
public class PushSysController {

    @GetMapping("/list")
    public String list() {
        return "push/list";
    }

    @GetMapping("/save")
    public String save() {
        return "push/save";
    }

}
