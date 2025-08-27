package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mber/company")
public class CompanyViewController {

    /**
     * 회사소개 > 한전MCS 개요
     */
    @GetMapping("/overview")
    public String companyOverview() {
        return "/mcs/home/company/overview";
    }

    /**
     * 회사소개 > 회사연혁
     */
    @GetMapping("/history")
    public String companyHistory() {
        return "/mcs/home/company/history";
    }

    /**
     * 회사소개 > CEO 인사말
     */
    @GetMapping("/ceo")
    public String companyCeo() {
        return "/mcs/home/company/ceo";
    }

    /**
     * 회사소개 > 경영방침
     */
    @GetMapping("/policy")
    public String companyPolicy() {
        return "/mcs/home/company/policy";
    }

    /**
     * 회사소개 > 가치체계
     */
    @GetMapping("/mission")
    public String companyMission() {
        return "/mcs/home/company/mission";
    }

    /**
     * 회사소개 > CI > 로고 (Tab)
     */
    @GetMapping("/ci")
    public String companyCi() {
        return "/mcs/home/company/ci";
    }

    /**
     * 회사소개 > CI > 청령캐릭터 (Tab)
     */
    @GetMapping("/ci-character")
    public String companyCicharacter() {
        return "/mcs/home/company/ci-character";
    }

    /**
     * 회사소개 > 조직현황
     */
    @GetMapping("/organization")
    public String companyOrganization() {
        return "/mcs/home/company/organization";
    }

    /**
     * 회사소개 > 사업소 안내
     */
    @GetMapping("/shoplist")
    public String companyShoList() {
        return "/mcs/home/company/shoplist";
    }

    /**
     * 회사소개 > 발전 사업소 안내
     */
    @GetMapping("/powerlist")
    public String companyPowerList() {
        return "/mcs/home/company/powerlist";
    }

    /**
     * 회사소개 > 찾아오시는 길
     */
    @GetMapping("/map")
    public String companyMap() {
        return "/mcs/home/company/map";
    }

}
