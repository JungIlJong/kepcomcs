package com.kepco.app.domain.org.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kepco.app.domain.authrt.dto.Authrt;
import com.kepco.app.domain.authrt.service.AuthrtService;

import java.util.List;

@RequestMapping("/sys/**/org")
@Controller
public class OrgSysController {
    private final AuthrtService authrtService;

    public OrgSysController(AuthrtService authrtService) {
        this.authrtService = authrtService;
    }

    @GetMapping("/list")
    public String sysMenuList(Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/org/list";
    }

}
