package com.kepco.app.domain.home.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class HomeController {

	@GetMapping("/index")
	public String home() {
		return "index";
	}
    @GetMapping("/index2")
    public String home2() {
        return "index_vasanta";
    }
}
