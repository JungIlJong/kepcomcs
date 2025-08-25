package com.daonplace.vasanta.domain.ntt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sys/**/ntt")
public class NttSysController {

    @GetMapping("/list")
    public String list() {
        return "sys/ntt/list";
    }

    @GetMapping("/save")
    public String save() {
        return "sys/ntt/save";
    }

    @GetMapping("/detail")
    public String update() {
        return "sys/ntt/update";
    }

    @GetMapping("/reply")
    public String reply(@RequestParam String reply) {
        if(reply.equalsIgnoreCase("Y")) {
            return "sys/ntt/reply/update";
        }
        return "sys/ntt/reply/save";
    }
}
