package com.skilldistillery.goatevents.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class SearchController {

	@Autowired
	private GoatDAO dao;
	
	@RequestMapping (path = "search.do")
	public String search(Model model, String keyword) {
		keyword= "Doug";
	User testuser = dao.getTestUser();
		if(testuser.getImage() == null) {
			testuser.setImage("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg");
		}
		List<Event> eventList =  dao.findEventFromSearch(keyword);
		List<Venue> venueList = dao.findVenueFromSearch(keyword);
		int count = 0;
		for (Event event : eventList) {
			if(event.getImage() == null) {
			event.setImage("https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg");
			}
			count++;
		}
		for (Venue venue : venueList) {
			count++;
			if(venue.getLogo() == null) {
				venue.setLogo("https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg");
			}
		}
			
		model.addAttribute("count", count);
		model.addAttribute("keyword", keyword);
		model.addAttribute("events", eventList);
		model.addAttribute("venues", venueList);
		model.addAttribute("user", testuser);
		return "searchresult";
	}
	
	

}
