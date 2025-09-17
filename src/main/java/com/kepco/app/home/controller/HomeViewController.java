package com.kepco.app.home.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.kepco.app.home.api.InitPageSearchDataSet;

@Controller
public class HomeViewController {

	@Autowired
	@Qualifier("requestMappingHandlerMapping")
	private RequestMappingHandlerMapping requestHandlerMapping;
	
	@RequestMapping(value = "/setsearchpage", method = RequestMethod.GET)
	public String setsearchpage() {
		
		try {
	        InetAddress local;
	        local = InetAddress.getLocalHost();
	        String ip = local.getHostAddress();
	        System.out.println("local ip : " + ip);
	        System.out.println("local ip : " + local.getHostName());
	        InitPageSearchDataSet test = InitPageSearchDataSet.getInstance();
	        if(!test.getFirst_bool())
	        {
	        	for (int i = 0; i < 100; i++) {
	    			System.out.println(i + " *******************************************");
	    		}
		        test.setPageController(requestHandlerMapping);
		        test.setTestStr(local.getHostName());
		        test.logic();
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "index";
	}
	
	@RequestMapping(value = "/robots.txt")
	@ResponseBody
	public String robots() {
		return "User-agent: *\nAllow: /\n";
	}
	
	@GetMapping("/nicetest")
	public String customer_nicetest() {
		return "/mcs/home/NiceTest";
	}
	
	@GetMapping("/checkplus_success")
	public String customer_checkplussuccess() {
		return "/mcs/home/checkplus_success";
	}
	
	@GetMapping("/checkplus_success2")
	public String customer_checkplussuccess2() {
		return "/mcs/home/checkplus_success2";
	}
	
	@GetMapping("/checkplus_opinion_success")
	public String customer_checkplusopinionsuccess() {
		return "/mcs/home/checkplus_opinion_success";
	}

	@GetMapping("/checkplus_integrity_success")
	public String customer_checkplusintegritysuccess() {
		return "/mcs/home/checkplus_integrity_success";
	}

	@GetMapping("/checkplus_cooperation_success")
	public String customer_checkpluscooperationsuccess() {
		return "/mcs/home/checkplus_cooperation_success";
	}

	@GetMapping("/checkplus_socialinquiry_success")
	public String customer_checkplussocialinquirysuccess() {
		return "/mcs/home/checkplus_socialinquiry_success";
	}
	
	@GetMapping("/mber/esg/ethic/whistleblowingReward")
	public String esg_ehic_whistleblowingReward() {
		return "/mcs/home/esg/ethic/whistleblowing_reward";
	}

	@GetMapping("/mber/conscience/report")
	public String conscience_report() {
		return "/mcs/home/conscience/report";
	}
	
	@GetMapping(value = "/mber/conscience/report-agree")
	public String conscience_report_agree() {
		return "/mcs/home/conscience/report-agree";
	}
	
	@PostMapping("/mber/conscience/report-certification")
	public String conscience_report_certification_post(Model model, HttpServletRequest request) {
		model.addAttribute("agreeYn",request.getParameter("agreeYn"));
		return "/mcs/home/conscience/report-certification";
	}

	@GetMapping("/mber/conscience/report-certification")
	public String conscience_report_certification_get() {
		return "/mcs/home/conscience/report-certification";
	}
	
	@GetMapping("/mber/conscience/report-form")
	public String conscience_report_form() {
		return "/mcs/home/conscience/report-form";
	}


}













