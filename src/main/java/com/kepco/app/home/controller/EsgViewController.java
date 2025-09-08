package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@RequestMapping("/mber/esg")
public class EsgViewController {


    /**
     * ESG 경영 > 안전경영 > 안전보건 경영소개
     */
    @GetMapping("/safety/safety-introduction")
    public String esg_safety_safetyintroduction() {
        return "/mcs/home/esg/safety/safety-introduction";
    }

    /**
     * ESG 경영 > 안전경영 > 안전보건 경영방침
     */
    @GetMapping("/safety/safety-policy")
    public String esg_safety_safetypolicy() {
        return "/mcs/home/esg/safety/safety-policy";
    }

    /**
     * ESG 경영 > 안전경영 > 안전관리 조직도
     */
    @GetMapping("/safety/safety-organization")
    public String esg_safety_safetyorganization() {
        return "/mcs/home/esg/safety/safety-organization";
    }

    /**
     * ESG 경영 > 안전경영 > 안전경영소식
     */
    @GetMapping("/safety/safetynews-list")
    public String esg_safety_safetynewslist() {
        return "/mcs/home/esg/safety/safetynews-list";
    }

    /**
     * ESG 경영 > 안전경영 > 국민을 위한 안전활동
     * @return
     */
    @GetMapping("/safety/safetyact/safetyact-list")
    public String esg_safety_safetyactlist() {
        return "/mcs/home/esg/safety/safetyact-list";
    }

    /**
     * ESG 경영 > 윤리경영 > 윤리경영소개
     */
    @GetMapping("/ethic/ethic-introduction")
    public String esg_ehic_ethicintruduction() {
        return "/mcs/home/esg/ethic/ethic-introduction";
    }

    /**
     * ESG 경영 > 윤리경영 > 부패방지방침
     */
    @GetMapping("/ethic/cpa")
    public String esg_ehic_corruptiorevention() {
        return "/mcs/home/esg/ethic/corruption-prevention";
    }

    /**
     * ESG 경영 > 윤리경영 > 윤리경영 홍보자료
     */
    @GetMapping("/ethic/ethicpromotion-list")
    public String esg_ehic_ethicpromotionlist() {
        return "/mcs/home/esg/ethic/ethicpromotion-list";
    }

    /**
     * ESG 경영 > 윤리경영 > 윤리경영 홍보자료 > 상세
     */
    @GetMapping("/ethic/ethicpromotion-view")
    public String openmanage_ethicpromotionview(Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "10");
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/esg/ethic/ethicpromotion-view";
    }

    /**
     * ESG 경영 > 윤리경영 > 신문고
     */
    @GetMapping("/ethic/report")
    public String esg_ehic_report() {
        return "/mcs/home/esg/ethic/report";
    }

    /**
     * ESG 경영 > 윤리경영 > 공익신고센터
     */
    @GetMapping("/ethic/whistleblowing")
    public String esg_ehic_whistleblowing() {
        return "/mcs/home/esg/ethic/whistleblowing";
    }

    /**
     * ESG 경영 > 윤리경영 > 청렴·윤리 소식지
     */
    @GetMapping("/ethic/integrity-list")
    public String esg_ehic_integritylist() {
        return "/mcs/home/esg/ethic/integrity-list";
    }

    /**
     * ESG 경영 > 윤리경영 > 청렴·윤리 소식지 > 상세
     */
    @GetMapping("/ethic/integrity-view")
    public String esg_ehic_integrityview() {
        return "/mcs/home/esg/ethic/integrity-view";
    }

    /**
     * ESG 경영 > 윤리경영 > 제재현황
     */
    @GetMapping("/ethic/punishment-list")
    public String esg_ehic_punishmentlist() {
        return "/mcs/home/esg/ethic/punishment-list";
    }

    /**
     * ESG 경영 > 윤리경영 > 제재현황 > 상세
     */
    @GetMapping("/ethic/punishment-view")
    public String esg_ehic_punishmentview() {
        return "/mcs/home/esg/ethic/punishment-view";
    }

    /**
     * ESG 경영 > 인권경영 > 인권경영 소개
     */
    @GetMapping("/hmr/hm-introduction")
    public String esg_hmr_hmintroduction() {
        return "/mcs/home/esg/hmr/hm-introduction";
    }

    /**
     * ESG 경영 > 인권경영 > 인권경영 선언문
     */
    @GetMapping("/hmr/hm-declaration")
    public String esg_hmr_hmdeclaration() {
        return "/mcs/home/esg/hmr/hm-declaration";
    }

    /**
     * ESG 경영 > 탄소중립 > 탄소중립 소개
     */
    @GetMapping("/carbon-neutral/neutral-introduction")
    public String esg_carbon_neutral_neutral_introduction() {
        return "/mcs/home/esg/carbon-neutral/neutral-introduction";
    }

    /**
     * ESG 경영 > 탄소중립 > 탄소중립활동
     */
    @GetMapping("/carbon-neutral/neutral-list")
    public String esg_carbon_neutral_neutral_list() {
        return "/mcs/home/esg/carbon-neutral/neutral-list";
    }

    /**
     * ESG 경영 > 탄소중립 > 탄소중립활동 > 상세
     */
    @GetMapping("/carbon-neutral/neutral-view")
    public String esg_carbon_neutral_neutral_view() {
        return "/mcs/home/esg/carbon-neutral/neutral-view";
    }

    /**
     * ESG 경영 > 탄소중립 > 탄소중립사업
     */
    @GetMapping("/carbon-neutral/neutral-industry")
    public String esg_carbon_neutral_neutral_industry() {
        return "/mcs/home/esg/carbon-neutral/neutral-industry";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동
     */
    @GetMapping("/social/social-activity")
    public String esg_social_activity() {
        return "/mcs/home/esg/social/social-activity";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 한국사회보장정보원
     */
    @GetMapping("/social/ssis-list")
    public String esg_social_ssis_list() {
        return "/mcs/home/esg/social/ssis-list";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 한국사회보장정보원 > 상세
     */
    @GetMapping("/social/ssis-view")
    public String esg_social_ssis_view() {
        return "/mcs/home/esg/social/ssis-view";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 한국에너지공단
     */
    @GetMapping("/social/energy-list")
    public String esg_social_energy_list() {
        return "/mcs/home/esg/social/energy-list";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 한국에너지공단 > 상세
     */
    @GetMapping("/social/energy-view")
    public String esg_social_energy_view() {
        return "/mcs/home/esg/social/energy-view";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 고객만족도활동
     */
    @GetMapping("/social/safety-list")
    public String esg_social_safety_list() {
        return "/mcs/home/esg/social/safety-list";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 고객만족도활동 > 상세
     */
    @GetMapping("/social/safety-view")
    public String esg_social_safety_view() {
        return "/mcs/home/esg/social/safety-view";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 취약계층발굴
     */
    @GetMapping("/social/weak-list")
    public String esg_social_weak_list() {
        return "/mcs/home/esg/social/weak-list";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌활동소식 > 취약계층발굴 > 상세
     */
    @GetMapping("/social/weak-view")
    public String esg_social_weak_view() {
        return "/mcs/home/esg/social/weak-view";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌문의
     */
    @GetMapping(value = "/social/socialinquiry-list")
    public String esg_social_socialinquiry_list() {
        return "/mcs/home/esg/social/socialinquiry-list";
    }

    /**
     * ESG 경영 > 사회적가치 > 사회공헌문의 > 비밀번호 확인
     */
    @GetMapping("/social/socialinquiry-pwd")
    public String esg_socialsocialinquiry_pwd(Model model, HttpServletRequest request) {
        model.addAttribute("board_no", request.getParameter("board_no"));
        return "/mcs/home/esg/social/socialinquiry-pwd";
    }

    @GetMapping("/ethic/report-certification")
    public String esg_ehic_reportcertification() {
        return "/mcs/home/esg/ethic/report-certification";
    }

    @RequestMapping(value = "/ethic/report-form", method = RequestMethod.GET)
    public String esg_ehic_reportform(Locale locale, Model model) {

        return "/mcs/home/esg/ethic/report-form";
    }

    @RequestMapping(value = "/ethic/report-agree", method = RequestMethod.GET)
    public String esg_ehic_reportagree(Locale locale, Model model) {

        return "/mcs/home/esg/ethic/report-agree";
    }


    @RequestMapping(value = "/safety/safetyact-view", method = RequestMethod.GET)
    public String esg_safety_safetyactview(Locale locale, Model model) {

        return "/mcs/home/esg/safety/safetyact-view";
    }


    @RequestMapping(value = "/safety/safetynews-view", method = RequestMethod.GET)
    public String esg_safety_safetynewsview(Locale locale, Model model) {

        return "/mcs/home/esg/safety/safetynews-view";
    }


    @RequestMapping(value = "/social/mou-list", method = RequestMethod.GET)
    public String esg_social_mou_list(Locale locale, Model model) {

        return "/mcs/home/esg/social/mou-list";
    }

    @RequestMapping(value = "/social/mou-view", method = RequestMethod.GET)
    public String esg_social_mou_view(Locale locale, Model model) {

        return "/mcs/home/esg/social/mou-view";
    }

    @RequestMapping(value = "/social/socialinquiry-agree", method = RequestMethod.GET)
    public String esg_social_socialinquiry_agree(Locale locale, Model model) {

        return "/mcs/home/esg/social/socialinquiry-agree";
    }

    @RequestMapping(value = "/social/socialinquiry-certification", method = RequestMethod.GET)
    public String esg_social_socialinquiry_certification(Locale locale, Model model) {

        return "/mcs/home/esg/social/socialinquiry-certification";
    }

    @RequestMapping(value = "/social/socialinquiry-form", method = RequestMethod.GET)
    public String esg_social_socialinquiry_form() {
        return "/mcs/home/esg/social/socialinquiry-form";
    }

    @RequestMapping(value = "/social/socialinquiry-view", method = RequestMethod.GET)
    public String esg_socialsocialinquiry_view( Model model, HttpServletRequest request) {
        model.addAttribute("board_type", "23");
        model.addAttribute("board_no", request.getParameter("board_no"));
        model.addAttribute("board_pwd", request.getParameter("board_pwd"));
        return "/mcs/home/esg/social/socialinquiry-view";
    }

}
