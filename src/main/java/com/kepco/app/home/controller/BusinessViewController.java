package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mber/business")
public class BusinessViewController {

    /**
     * 사업소개 > 한전MCS 경쟁력
     */
    @GetMapping("/competitive")
    public String business_competitive() {
        return "/mcs/home/business/competitive";
    }

    /**
     * 사업소개 > 전력고객서비스
     */
    @GetMapping("/customerservice")
    public String business_customerservice() {
        return "/mcs/home/business/customerservice";
    }

    /**
     * 사업소개 > 사업혁신방향
     */
    @GetMapping("/innovation")
    public String businessr_innovation() {
        return "/mcs/home/business/innovation";
    }

    /**
     * 사업소개 > 배전 및 NTM
     */
    @GetMapping("/shortterm")
    public String business_shortterm() {
        return "/mcs/home/business/shortterm";
    }

    /**
     * 사업소개 > 에너지 전문 P-PaaS
     */
    @GetMapping("/PPaaS")
    public String business_ppaas() {
        return "/mcs/home/business/ppaas";
    }

    /**
     * 사업소개 > 중장기 미래 사업
     */
    @GetMapping("/future")
    public String business_future() {
        return "/mcs/home/business/future";
    }

    /**
     * 사업소개 > 신사업 비전
     */
    @GetMapping("/newbusiness")
    public String business_newbuiness() {
        return "/mcs/home/business/newbusiness";
    }

    /**
     * 사업소개 > Sector Coupling 사업
     */
    @GetMapping("/sector")
    public String business_sector() {
        return "/mcs/home/business/sector";
    }

}
