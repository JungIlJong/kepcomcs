package com.daonplace.vasanta.front.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sys/**/report")
public class ReportSysController {

    @GetMapping("/list")
    public String list() {
        return "/sys/report/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("type") String type) {
        if ("answer".equalsIgnoreCase(type)) {
            return "/sys/report/answerDetail";
        }
        if ("ntt".equalsIgnoreCase(type)) {
            return "/sys/report/nttDetail";
        }
        if ("mbr".equalsIgnoreCase(type)) {
            return "/sys/report/mbrDetail";
        }
        return "redirect:/sys/**/report/list";
    }
}
