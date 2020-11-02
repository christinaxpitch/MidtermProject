package com.skilldistillery.goatevents.controllers;

import java.util.List;

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
	public String search(Model model, String keyword) {
	User testuser = dao.getTestUser();
		if(testuser.getImage() == null) {
			testuser.setImage("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg");
		}
		List<Object> searchList =  dao.findFromSearch(keyword);
		
		int count = 0;
		model.addAttribute("count", count);
		model.addAttribute("keyword", keyword);
		model.addAttribute("objects", searchList);
		model.addAttribute("user", testuser);
		return "searchresult";
	}
	
	

}
