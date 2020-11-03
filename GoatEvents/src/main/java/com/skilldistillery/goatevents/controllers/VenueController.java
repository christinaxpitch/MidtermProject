package com.skilldistillery.goatevents.controllers;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.data.VenueDAO;
import com.skilldistillery.goatevents.entities.Venue;
public class VenueController {
	
	private GoatDAO dao;
	private VenueDAO venueDAO;
	
	
//	this method is the href on the vendor profile page that brings the vendor to addVenue page
	@RequestMapping (path = "addVenueHomepage.do")
	public String addVenueHomepage() {
		return "venue/addVenue";
	}
//	this method is the href on the vendor profile page that brings the vendor to updateVenue page
	@RequestMapping (path = "updateVenueHomepage.do")
	public String updateVenueHomepage() {
		return "venue/updateVenue";
	}
	
	
	@RequestMapping(path = "vendor.do")
	public String vendorProfile(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "user";
	}
//	@RequestMapping (path = 
//			"venue.do")
//	public String venuePage(Model model) {
//		List<Venue> venueList = venueDAO.findAllVenues();
//		model.addAttribute("venues", venueList);
//		return "venue/";
//	}
	
	@RequestMapping(path = "addVenue.do", method = RequestMethod.GET)
	public ModelAndView addVenue(Venue venue) {
		venueDAO.addVenue(venue);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/addVenue");
		return mv;
}
	
	@RequestMapping(path = "confirmAddedVenue.do", method = RequestMethod.GET)
	public ModelAndView confirmAddedVenue(Venue venue) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/addedVenueConfirmed");
		return mv;
}
	
	@RequestMapping(path = "updateVenue.do", method = RequestMethod.GET)
	public ModelAndView updateVenue(Integer id, Venue venue) {
		venueDAO.updateVenue(id, venue);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/updateVenue");
		return mv;
}
	
	@RequestMapping(path = "confirmAddedVenue.do", method = RequestMethod.GET)
	public ModelAndView updatedVenueConfirmed(Venue venue) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/updatedVenueConfirmed");
		return mv;
}
}