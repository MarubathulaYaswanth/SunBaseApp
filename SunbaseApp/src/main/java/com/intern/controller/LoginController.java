package com.intern.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intern.entity.Memberdata;
import com.intern.service.Loginservice;

@Controller
public class LoginController {
	
	private Loginservice loginservice;
	
	@Autowired
	public LoginController(Loginservice loginservice) {
		super();
		this.loginservice = loginservice;
	}



	@RequestMapping(value="/goToHome")
	public String homepage(@RequestParam String loginid,@RequestParam String password,Model model) {
		boolean isvalid=loginservice.validate(loginid, password);
		if(isvalid==true) {
			List<Memberdata> result=loginservice.getData();
			model.addAttribute("Members",result);
			return "/WEB-INF/Home.jsp";
		}else {
			model.addAttribute("responsemsg","Login Credentials are not matched");
		}
		return "Login.jsp";
	}
	
}
