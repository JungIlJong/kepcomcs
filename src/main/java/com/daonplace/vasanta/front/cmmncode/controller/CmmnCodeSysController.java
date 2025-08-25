package com.daonplace.vasanta.front.cmmncode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sys/**/cmmncode")
@Controller
public class CmmnCodeSysController {

    @GetMapping("/list")
    public String cmmnCodeList() {
        return "cmmncode/list";
    }

}
