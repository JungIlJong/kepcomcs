package com.kepco.app.domain.snslogin.api;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import com.kepco.app.core.security.service.SnsLoginService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.Map;


@Slf4j
@Controller
@RequestMapping("**/api/**/snslogin")
public class SnsLoginApi {

    @Resource(name = "passwordEncoder")
    private PasswordEncoder passwordEncoder;

    @Resource(name = "modelMapper")
    private ModelMapper modelMapper;

    @Resource(name="snsLoginService")
    private SnsLoginService snsLoginService;

    /**
     * 일반회원과 소셜계정 연동
     * @param param
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/mergeAccount")
    public String mergeAccountPage(@RequestParam Map<String, Object> param, HttpServletRequest request, Model model) throws Exception {
        String message = "";
        String mergeSuccess = "";

        model.addAttribute("email", param.get("email"));
        model.addAttribute("mberId", param.get("username"));
        model.addAttribute("provider", param.get("provider"));
        model.addAttribute("providerId", param.get("providerId"));
        model.addAttribute("mobile", param.get("mobile"));
        model.addAttribute("snsname", param.get("snsname"));

        CharSequence rawPassword = String.valueOf(param.get("password"));
        param.put("mberId", param.get("username"));
        Map<String, Object> chkExistMber = snsLoginService.checkMberExist(param);
        if(chkExistMber != null){
            String encodedPassword = String.valueOf(chkExistMber.get("PASSWORD"));
            boolean flag = passwordEncoder.matches(rawPassword, encodedPassword);

            if(flag){
                // 회원 존재, 비밀번호 매치 시 기존 기존 계정과 연동
                param.put("esntlId", chkExistMber.get("ESNTL_ID"));
                param.put("mberId", chkExistMber.get("USER_ID"));
                param.put("email", param.get("email"));
                param.put("provider", param.get("provider"));
                param.put("providerId", param.get("providerId"));
                int insertMberSns = snsLoginService.insertMberSns(param);
                if(insertMberSns > 0){
                    mergeSuccess = "Y";
                }else{
                    mergeSuccess = "N";
                    message = "잠시후에 다시 시도해 주세요.";
                }
            }else{
                // 로그인 실패
                mergeSuccess = "N";
                message = "아이디와 비밀번호를 다시 확인해주세요.";
            }
        }else{
            // 회원 없을 때
            mergeSuccess = "N";
            message = "아이디와 비밀번호를 다시 확인해주세요.";
        }

        String targetUrl = UriComponentsBuilder.fromUriString("/snslogin/mergeJoin")
                .queryParam("email", param.get("email"))
                .queryParam("provider",  param.get("provider"))
                .queryParam("providerId",  param.get("providerId"))
                .queryParam("mobile",  param.get("mobile"))
                .queryParam("snsname",  param.get("snsname"))
                .queryParam("mergeSuccess",  mergeSuccess)
                .queryParam("message",  message)
                .build()
                .encode(StandardCharsets.UTF_8)
                .toUriString();

        return "redirect:" + targetUrl;
    }

    /**
     * 소셜계정 회원가입
     * @param param
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @PostMapping("/snsJoin")
    public String snsJoin(@RequestParam Map<String, Object> param, HttpServletRequest request, Model model) throws Exception {
        log.info("call uri : {}", request.getRequestURI());
        log.info("param : {}", param);

        param.put("password", "sns" + param.get("provider").toString() + param.get("providerId").toString());


        int insertMberSns = snsLoginService.insertMberSns(param);

        return "mber/join/step3";
    }

}
