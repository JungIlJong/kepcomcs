package com.kepco.app.core.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class LanguageController {

    @GetMapping("/changeLanguage")
    public void changeLanguage(@RequestParam(value = "lang", required = false, defaultValue = "ko") String lang, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("locale", lang);
    }
}
