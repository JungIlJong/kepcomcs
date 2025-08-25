package com.daonplace.vasanta.domain.mbrOrg.controller;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import com.daonplace.vasanta.domain.authrt.service.AuthrtService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/sys/**/mbrOrg")
@Controller
public class MbrOrgController {

    private final AuthrtService authrtService;

    public MbrOrgController(AuthrtService authrtService) {
        this.authrtService = authrtService;
    }

    @GetMapping("/list")
    public String mbrOrgList() {
        return "sys/mbrOrg/list";
    }

    @GetMapping("/save")
    public String mbrOrgSave(Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/mbrOrg/save";
    }

    @GetMapping("/detail")
    public String mbrOrgDetail(@RequestParam("uuid") String uuid, Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/mbrOrg/detail";
    }

}
