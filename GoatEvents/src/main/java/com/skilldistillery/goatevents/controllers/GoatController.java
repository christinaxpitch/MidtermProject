package com.skilldistillery.goatevents.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;

@Controller
public class GoatController {

	@Autowired
	private GoatDAO dao;
	
	
	@RequestMapping (path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "Home";
	}
	@RequestMapping (path = "signUp.do")
	public String signUp(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "SignUp";
	}

}
