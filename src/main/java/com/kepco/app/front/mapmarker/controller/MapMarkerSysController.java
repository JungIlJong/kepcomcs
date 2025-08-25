package com.kepco.app.front.mapmarker.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/**/mapmarker")
public class MapMarkerSysController {
    @Value("${map.naver.clientId:null}")
    private String naverClientId;

    @ModelAttribute("naverClientId")
    public String getNaverClientId() {
        return naverClientId;
    }

    @GetMapping("/list")
    public String list() {
        return "sys/mapmarker/list";
    }

    @GetMapping("/save")
    public String save() {
        return "sys/mapmarker/save";
    }


    @GetMapping("/detail")
    public String detail() {
        return "sys/mapmarker/detail";
    }
}
