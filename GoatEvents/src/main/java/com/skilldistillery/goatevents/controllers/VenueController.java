package com.skilldistillery.goatevents.controllers;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.data.VenueDAO;
import com.skilldistillery.goatevents.entities.Venue;
public class VenueController {
	
	private GoatDAO dao;
	private VenueDAO venueDAO;
	
	
	@RequestMapping(path = "vendor.do")
	public String vendorProfile(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "user";
	}
	@RequestMapping (path = 
			"venue.do")
	public String venuePage(Model model) {
		List<Venue> venueList = venueDAO.findAllVenues();
		model.addAttribute("venues", venueList);
		return "Venue";
	}
}