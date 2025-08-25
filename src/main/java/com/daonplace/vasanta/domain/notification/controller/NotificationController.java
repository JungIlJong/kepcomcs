package com.daonplace.vasanta.domain.notification.controller;

import com.daonplace.vasanta.domain.authrt.dto.Authrt;
import com.daonplace.vasanta.domain.authrt.service.AuthrtService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/sys/**/notification")
@Controller
public class NotificationController {

    private final AuthrtService authrtService;

    public NotificationController(AuthrtService authrtService) {
        this.authrtService = authrtService;
    }

    @GetMapping("/list")
    public String notificationList() {
        return "sys/notification/list";
    }

    @GetMapping("/save")
    public String notificationSave(Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/notification/save";
    }

    @GetMapping("/detail")
    public String notificationDetail(@RequestParam("uuid") String uuid, Model model) {
        List<Authrt> authrtList = authrtService.selectAllAuthrtList();
        model.addAttribute("authrtList", authrtList);
        return "sys/notification/detail";
    }

}
