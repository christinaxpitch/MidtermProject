package com.skilldistillery.goatevents.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.entities.User;

@Controller
public class SearchController {

	@Autowired
	private GoatDAO dao;
	
	@RequestMapping (path = "search.do")
	public String search(Model model) {
	User testuser = dao.getTestUser();
		if(testuser.getImage() == null) {
			testuser.setImage("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg");
		}
		model.addAttribute("user", testuser);
		return "searchresult";
	}
	
	

}
