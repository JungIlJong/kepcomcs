package com.daonplace.vasanta.front.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/draft")
public class DraftSysController {

    @GetMapping("/save")
    public String draftSysSave() {
        return "sys/approval/draft/save";
    }

}
