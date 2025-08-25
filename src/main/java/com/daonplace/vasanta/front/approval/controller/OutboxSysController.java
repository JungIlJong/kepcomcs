package com.daonplace.vasanta.front.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/outbox")
public class OutboxSysController {
    @GetMapping("/list")
    public String outboxSysList() {
        return "sys/approval/outbox/list";
    }

    @GetMapping("/detail")
    public String outboxSysDetail() {
        return "sys/approval/outbox/detail";
    }

}
