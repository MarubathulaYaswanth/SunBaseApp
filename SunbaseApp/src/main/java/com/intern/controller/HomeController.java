package com.intern.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.intern.entity.Memberdata;
import com.intern.service.HomeService;

@Controller
public class HomeController {
	
	
	private HomeService homeservice;
	
	@Autowired
	public HomeController(HomeService homeservice) {
		this.homeservice = homeservice;
	}
	
	@RequestMapping(value="/memberpage")
	public String memberPage(Model model) {
		return "/WEB-INF/Member.jsp";
	}
	@RequestMapping(value="/home")
	public String homePage(Model model) {
		List<Memberdata> result=homeservice.getData();
		model.addAttribute("Members",result);
		return "/WEB-INF/Home.jsp";
	}

	@RequestMapping(value="/addmemberPage")
	public String saveData(@RequestParam String firstname,@RequestParam String lastname,@RequestParam String street,@RequestParam String address,@RequestParam String city,@RequestParam String state,@RequestParam String email,@RequestParam String phone,Model model) {
		boolean issaved=homeservice.saveData(firstname,lastname,street,address,city,state,email,phone);
		if(issaved) {
			model.addAttribute("saveresponse","Member data saved successfully");
		}else {
			model.addAttribute("saveresponse","Member data failed to save");
		}
		return "/WEB-INF/Member.jsp";
	}
	
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String firstname,@RequestParam String lastname,@RequestParam String street,@RequestParam String address,@RequestParam String city,@RequestParam String state,@RequestParam String email,@RequestParam String phone,Model model) {
		System.out.println("enter into home controller");
		homeservice.editData(firstname,lastname,street,address,city,state,email,phone);
		List<Memberdata> result=homeservice.getData();		
		model.addAttribute("Members",result);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/DeleteMember/{email}")
	public String deleteMember(@PathVariable String email,Model model) {
		Memberdata member=homeservice.getMember(email);
		boolean isdelete=homeservice.deleteMember(member);
		List<Memberdata> result=homeservice.getData();		
		model.addAttribute("Members",result);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String searchMember(@RequestParam String email, Model model) {
	    Memberdata members= homeservice.getMember(email);
	    System.out.println(members);
	    // Add the search result directly to the model
	    model.addAttribute("searchResult", members);
	    
	    return "redirect:/home";
	}

}
