package com.kepco.app.domain.mbr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.service.AuthrtService;

import java.util.List;

@RequestMapping("/sys/**/mbr")
@Controller
public class MbrController {

    private final AuthrtService authrtService;

    public MbrController(AuthrtService authrtService) {
        this.authrtService = authrtService;
    }

    @GetMapping("/list")
    public String mbrList() {
        return "sys/mbr/list";
    }

    @GetMapping("/save")
    public String mbrSave(Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/mbr/save";
    }

    @GetMapping("/detail")
    public String mbrDetail(@RequestParam("uuid") String uuid, Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/mbr/detail";
    }

}
