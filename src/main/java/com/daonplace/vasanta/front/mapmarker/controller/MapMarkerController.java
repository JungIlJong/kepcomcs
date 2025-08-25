package com.daonplace.vasanta.front.mapmarker.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mber/**/map")
public class MapMarkerController {

    @Value("${map.naver.clientId:null}")
    private String naverClientId;

    @ModelAttribute("naverClientId")
    public String getNaverClientId() {
        return naverClientId;
    }

    @GetMapping
    public String map() {
        return "mber/map/map";
    }
}
