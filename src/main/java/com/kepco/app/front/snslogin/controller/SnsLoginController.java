package com.kepco.app.front.snslogin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kepco.app.core.security.util.UserDetailsUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("**/snslogin")
public class SnsLoginController {

    /**
     * 소셜로그인 버튼 있는 로그인화면
     * @param error
     * @param status
     * @param failCnt
     * @param model
     * @return
     */
    @GetMapping("/login")
    public String login(@RequestParam(required = false) String error,
                        @RequestParam(required = false) String status,
                        @RequestParam(required = false) String failCnt,
                        Model model) {

        if (UserDetailsUtil.isAuthorized("ROLE_USER")) {
            return "redirect:/index";
        }

        model.addAttribute("failCnt", failCnt);
        model.addAttribute("error", error);
        model.addAttribute("status", status);
        return "mber/snslogin/login";
    }

    /**
     * 소셜계정 연동 여부 화면으로 리다이렉트
     * @param response
     * @param param
     * @param request
     * @param model
     * @param redirectAttribute
     * @return
     * @throws Exception
     */
    @RequestMapping("/mergeJoin")
    public String chkMergeJoin(HttpServletResponse response, @RequestParam Map<String, Object> param, HttpServletRequest request, Model model,  RedirectAttributes redirectAttribute) throws Exception {
        log.info("call uri : {}", request.getRequestURI());
        if(param.isEmpty()
                || param.get("email") == null
                || param.get("provider") == null
                || param.get("providerId") == null) {
            return "redirect:/mber/support/snslogin/snslogin/login";
        }else{
            redirectAttribute.addFlashAttribute("email", param.get("email"));
            redirectAttribute.addFlashAttribute("provider", param.get("provider"));
            redirectAttribute.addFlashAttribute("providerId", param.get("providerId"));
            redirectAttribute.addFlashAttribute("mobile", param.get("mobile"));
            redirectAttribute.addFlashAttribute("snsname", param.get("snsname"));

            redirectAttribute.addFlashAttribute("mergeSuccess", param.get("mergeSuccess"));
            redirectAttribute.addFlashAttribute("message", param.get("message"));
            return "redirect:/mber/support/snslogin/snslogin/mergeJoin2";
        }
    }

    /**
     * 소셜계정 연동 여부 화면
     * @param response
     * @param param
     * @param request
     * @param model
     * @param redirectAttribute
     * @return
     * @throws Exception
     */
    @RequestMapping("/mergeJoin2")
    public String chkMergeJoin2(HttpServletResponse response, @RequestParam Map<String, Object> param, HttpServletRequest request, Model model, RedirectAttributes redirectAttribute) throws Exception {
        log.info("call uri : {}", request.getRequestURI());
        if(model == null
                || model.getAttribute("email") == null
                || model.getAttribute("provider") == null
                || model.getAttribute("providerId") == null) {
            return "redirect:/mber/support/snslogin/snslogin/login";
        }else{
            redirectAttribute.addFlashAttribute("email", model.getAttribute("email"));
            redirectAttribute.addFlashAttribute("provider", model.getAttribute("provider"));
            redirectAttribute.addFlashAttribute("providerId", model.getAttribute("providerId"));
            redirectAttribute.addFlashAttribute("mobile", model.getAttribute("mobile"));
            redirectAttribute.addFlashAttribute("snsname", model.getAttribute("snsname"));

            redirectAttribute.addFlashAttribute("mergeSuccess", param.get("mergeSuccess"));
            redirectAttribute.addFlashAttribute("message", param.get("message"));
            return "mber/snslogin/chkMergeJoin";
        }
    }

    /**
     * 소셜계정 추가정보입력 화면
     * @param param
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/join")
    public String snsJoinPage(@RequestParam Map<String, Object> param, HttpServletRequest request, Model model) throws Exception {
        log.info("call uri : {}", request.getRequestURI());
        if(param.isEmpty()
                || param.get("email") == null
                || param.get("provider") == null
                || param.get("providerId") == null) {
            return "redirect:/mber/support/snslogin/snslogin/login";
        }else{
            model.addAttribute("email", param.get("email"));
            model.addAttribute("provider", param.get("provider"));
            model.addAttribute("providerId", param.get("providerId"));
            model.addAttribute("mobile", param.get("mobile"));
            model.addAttribute("snsname", param.get("snsname"));
            return "mber/snslogin/join";
        }
    }
}

