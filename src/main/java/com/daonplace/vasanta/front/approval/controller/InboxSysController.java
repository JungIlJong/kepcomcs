package com.daonplace.vasanta.front.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/inbox")
public class InboxSysController {
    @GetMapping("/list")
    public String inboxSysList() {
        return "sys/approval/inbox/list";
    }

    @GetMapping("/detail")
    public String inboxSysDetail() {
        return "sys/approval/inbox/detail";
    }

}
