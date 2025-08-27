package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/mber/open-manage")
public class OpenManageViewController {

    /**
     * 열린경영 > 경영공시
     */
    @GetMapping("/public-notice")
    public String openmanage_publicnotice() {
        return "/mcs/home/open-manage/public-notice";
    }

    /**
     * 열린경영 > 결산공고
     */
    @GetMapping("/settlement-announcement")
    public String openmanage_settlementannouncement() {
        return "/mcs/home/open-manage/settlement-announcement";
    }

    /**
     * 열린경영 > 결산공고 > 상세
     */
    @GetMapping("/settlement-announcement-view")
    public String copenmanage_settlementannouncementview(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "25");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/open-manage/settlement-announcement-view";
    }

    /**
     * 열린경영 > 사업실명제
     */
    @GetMapping("/business-realname")
    public String openmanage_businessrealname() {
        return "/mcs/home/open-manage/business-realname";
    }

    /**
     * 열린경영 > 사업실명제 > 실명제 목록
     */
    @GetMapping("/realname-list")
    public String openmanage_realnamelist() {
        return "/mcs/home/open-manage/realname-list";
    }

    /**
     * 열린경영 > 입찰정보 > 입찰안내
     * @return
     */
    @GetMapping("/bid-info")
    public String openmanage_bidinfo() {
        return "/mcs/home/open-manage/bid-info";
    }

    /**
     * 열린경영 > 입찰정보 > 입찰공고
     */
    @GetMapping("/bid-notice")
    public String openmanage_bidnotice() {
        return "/mcs/home/open-manage/bid-notice";
    }

    /**
     * 열린경영 > 입찰정보 > 입찰공고 > 상세
     */
    @GetMapping("/bid-notice-view")
    public String openmanage_bidnoticeview() {
        return "/mcs/home/open-manage/bid-notice-view";
    }

    /**
     * 열린경영 > 입찰정보 > 자료실
     */
    @GetMapping("/bid-list")
    public String openmanage_bidlist() {
        return "/mcs/home/open-manage/bid-list";
    }

    /**
     * 열린경영 > 입찰정보 > 수의계약현황
     */
    @GetMapping("/contract-list")
    public String openmanage_contractlist() {
        return "/mcs/home/open-manage/contract-list";
    }

    /**
     * 열린경영 > 채용정보 > 인재상
     */
    @GetMapping("/talented-person")
    public String openmanage_talentedperson() {
        return "/mcs/home/open-manage/talented-person";
    }

    /**
     * 열린경영 > 채용정보 > 채용공고
     */
    @GetMapping("/recruit-list")
    public String openmanage_newbusiness() {
        return "/mcs/home/open-manage/recruit-list";
    }

    /**
     * 열린경영 > 공공데이터 개방·제공
     */
    @GetMapping("/open-data")
    public String open_data() {
        return "/mcs/home/open-manage/open-data";
    }

    @GetMapping("/recruit-view")
    public String openmanage_recruitview() {
        return "/mcs/home/open-manage/recruit-view";
    }

    @GetMapping("/punish_list")
    public String punish_list() {
        return "/mcs/home/open-manage/punish_list";
    }

    @GetMapping("/punish_view")
    public String punish_view() {
        return "/mcs/home/open-manage/punish_view";
    }

    @GetMapping("/recommend_list")
    public String recommend_list() {
        return "/mcs/home/open-manage/recommend_list";
    }

    @GetMapping("/recommend_view")
    public String recommend_view() {
        return "/mcs/home/open-manage/recommend_view";
    }

}
