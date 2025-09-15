package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@RequestMapping("/mber/customer")
public class CustomerViewController {


    /**
     * 고객소통 > 홍보센터 > 언론속의 한전MCS
     */
    @GetMapping("/press-list")
    public String customer_presslist() {
        return "/mcs/home/customer/press-list";
    }

    /**
     * 고객소통 > 홍보센터 > 언론속의 한전MCS > 상세
     */
    @GetMapping("/press-view")
    public String customer_pressview(Model model, HttpServletRequest request) {
        return "/mcs/home/customer/press-view";
    }

    /**
     * 고객소통 > 홍보센터 > 보도·설명자료
     */
    @GetMapping("/press-explanatory")
    public String customer_pressexplanatory() {
        return "/mcs/home/customer/press-explanatory";
    }

    /**
     * 고객소통 > 홍보센터 > 보도·설명자료 > 상세
     */
    @GetMapping("/press-explanatory-view")
    public String customer_pressexplanatoryview(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "25");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/press-explanatory-view";
    }

    /**
     * 고객소통 > 홍보센터 > 뉴스레터
     */
    @GetMapping("/press-news")
    public String customer_pressnews() {
        return "/mcs/home/customer/press-news";
    }

    /**
     * 고객소통 > 홍보센터 > 뉴스레터 > 상세
     */
    @GetMapping("/press-news-view")
    public String customer_pressnewsyview(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "27");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/press-news-view";
    }

    /**
     * 고객소통 > 홍보센터 > 홍보영상
     */
    @GetMapping("/press-video")
    public String customer_pressviedo() {
        return "/mcs/home/customer/press-video";
    }

    /**
     * 고객소통 > 홍보센터 > 홍보영상 > 상세
     */
    @GetMapping("/press-video-view")
    public String customer_pressvideoyview(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "26");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/press-video-view";
    }

    /**
     * 고객소통 > 일반공지
     */
    @GetMapping("/notice-list")
    public String noticeListPage() {
        return "/mcs/home/customer/notice-list";
    }

    /**
     * 고객소통 > 일반공지 > 상세
     */
    @GetMapping("/notice-view")
    public String noticeViewPage(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "29");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/notice-view";
    }

    /**
     * 고객소통 > 신사업 및 협력사업 문의·제안
     */
    @GetMapping("/cooperation-list")
    public String customer_cooperation_list() {
        return "/mcs/home/customer/cooperation-list";
    }

    /**
     * 고객소통 > 신사업 및 협력사업 문의·제안 > 비밀번호 확인
     */
    @GetMapping("/cooperation-pwd")
    public String customer_cooperation_pwd(Model model, HttpServletRequest request) {
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/cooperation-pwd";
    }

    /**
     * 고객소통 > 청렴·부패 신고
     */
    @GetMapping("/integrity-agree")
    public String customer_integrity_agree() {
        return "/mcs/home/customer/integrity-agree";
    }

    /**
     * 고객소통 > 전력 에너지 뉴스
     */
    @GetMapping("/news-list")
    public String customer_news_list() {
        return "/mcs/home/customer/news-list";
    }

    /**
     * 고객소통 > 로컬생산품 판로지원
     */
    @GetMapping("/localproduct-list")
    public String customer_localproduct_list() {
        return "/mcs/home/customer/localproduct-list";
    }

    /**
     * 고객소통 > 로컬생산품 판로지원 > 상세
     */
    @GetMapping("/localproduct-view")
    public String customer_localproduct_view(Model model, HttpServletRequest request) {
        return "/mcs/home/customer/localproduct-view";
    }

    @GetMapping("/privacypolicy")
    public String customer_privacypolicy() {
        return "/mcs/home/customer/privacypolicy";
    }

    @GetMapping("/localproduct-form")
    public String customer_localproduct_form(Model model, HttpServletRequest request) {
        return "/mcs/home/customer/localproduct-form";
    }

    @GetMapping("/localproduct-pwd{procType}")
    public String customer_localproduct_pwd(Model model, HttpServletRequest request, @PathVariable String procType) {
        model.addAttribute("procType", procType);
        model.addAttribute("board_type", "36");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/customer/localproduct-pwd";
    }

    @GetMapping("/privacypolicy_{number}")
    public String customer_privacypolicy_221228(@PathVariable String number) {
        return "/mcs/home/customer/privacypolicy_" + number;
    }

    @GetMapping("/opinion")
    public String customer_opinion() {
        return "/mcs/home/customer/opinion";
    }

    @GetMapping("/opinion-agree")
    public String customer_opinion_agree() {
        return "/mcs/home/customer/opinion-agree";
    }

    @GetMapping("/opinion-certification")
    public String customer_opinion_certification() {
        return "/mcs/home/customer/opinion-certification";
    }

    @GetMapping("/complete")
    public String customer_complete() {
        return "/mcs/home/customer/complete";
    }

    @GetMapping("/cooperation-view")
    public String customer_cooperation_view(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "21");
        model.addAttribute("board_no", request.getParameter("board_no"));
        model.addAttribute("board_pwd", request.getParameter("board_pwd"));
        return "/mcs/home/customer/cooperation-view";
    }

    @GetMapping("/integrity-view")
    public String customer_integrity_view(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "21");
        model.addAttribute("board_no", request.getParameter("board_no"));
        model.addAttribute("board_pwd", request.getParameter("board_pwd"));
        //return "/common/error400";
        return "/mcs/home/customer/integrity-view";
    }

    @GetMapping("/integrity-certification")
    public String customer_integrity_certification() {
        //return "/common/error400";
        return "/mcs/home/customer/integrity-certification";
    }

	/*
	@RequestMapping(value = "/newbusiness-view", method = RequestMethod.GET)
	public String customer_newbusiness_view(Locale locale, Model model) {

		return "/mcs/home/customer/newbusiness-view";
	}
	*/

	/*
	@RequestMapping(value = "/safety-view", method = RequestMethod.GET)
	public String customer_safety_view(Locale locale, Model model) {

		return "/mcs/home/customer/safety-view";
	}
	*/


    @RequestMapping(value = "/cooperation-agree", method = RequestMethod.GET)
    public String customer_cooperation_agree(Locale locale, Model model) {

        return "/mcs/home/customer/cooperation-agree";
    }

    @RequestMapping(value = "/cooperation-certification", method = RequestMethod.GET)
    public String customer_cooperation_certification(Locale locale, Model model) {

        return "/mcs/home/customer/cooperation-certification";
    }

    @RequestMapping(value = "/cooperation-form", method = RequestMethod.GET)
    public String customer_cooperation_form(Locale locale, Model model) {

        return "/mcs/home/customer/cooperation-form";
    }

    @RequestMapping(value = "/integrity-form", method = RequestMethod.GET)
    public String customer_integrity_form(Locale locale, Model model) {

        return "/mcs/home/customer/integrity-form";
    }
    @RequestMapping(value = "/newbusiness-form", method = RequestMethod.GET)
    public String customer_newbusiness_form(Locale locale, Model model) {

        return "/mcs/home/customer/newbusiness-form";
    }

    @RequestMapping(value = "/safety-form", method = RequestMethod.GET)
    public String customer_safety_form(Locale locale, Model model) {

        return "/mcs/home/customer/safety-form";
    }

    @RequestMapping(value = "/integrity-pwd", method = RequestMethod.GET)
    public String customer_integrity_pwd(Locale locale, Model model, HttpServletRequest request) {
        model.addAttribute("board_no", request.getParameter("board_no"));

        return "/mcs/home/customer/integrity-pwd";
    }

    @RequestMapping(value = "/integrity-list", method = RequestMethod.GET)
    public String customer_integrity_list(Locale locale, Model model) {

        return "/mcs/home/customer/integrity-list";
    }
	/*
	@RequestMapping(value = "/newbusiness-list", method = RequestMethod.GET)
	public String customer_newbusiness_list(Locale locale, Model model) {

		return "/mcs/home/customer/newbusiness-list";
	}
	*/

    @RequestMapping(value = "/news-view", method = RequestMethod.GET)
    public String customer_news_view(Locale locale, Model model) {

        return "/mcs/home/customer/news-view";
    }

	/*
	@RequestMapping(value = "/safety-list", method = RequestMethod.GET)
	public String customer_safety_list(Locale locale, Model model) {

		return "/mcs/home/customer/safety-list";
	}
	*/

}
