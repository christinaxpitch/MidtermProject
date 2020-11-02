package com.skilldistillery.goatevents.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.entities.User;

@Controller
public class SignUpController {

	@Autowired
	private SignUpController SignUpDao;

	@RequestMapping(path = "signUp.do")
	public String signUp(Model model) {
		model.addAttribute("user", SignUpDao.getTestUser());
		return "SignUp";
	}

}
