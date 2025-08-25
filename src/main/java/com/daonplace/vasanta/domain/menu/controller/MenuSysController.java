package com.daonplace.vasanta.domain.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sys/**/{menuSe}menu")
@Controller
public class MenuSysController {

    @GetMapping("/list")
    public String sysMenuList(@PathVariable("menuSe") String menuSe, Model model) {
        model.addAttribute("menuSe", menuSe);
        return "sys/menu/list";
    }

}
