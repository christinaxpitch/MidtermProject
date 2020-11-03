package com.skilldistillery.goatevents.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.data.VenueDAO;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class VenueController {
	
	@Autowired
	private GoatDAO dao;
	@Autowired
	private VenueDAO venueDAO;
	@Autowired
	private EventDAO eventDAO;
	
	
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
	
	
//	@RequestMapping(path = "vendor.do")
//	public String vendorProfile(Model model) {
//		model.addAttribute("user", dao.getTestUser());
//		return "user";
//	}
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
	
	@RequestMapping(path = "updateVenue.do", method = RequestMethod.POST)
	public ModelAndView updateVenue(Integer vid, Venue venue) {
		Venue v = venueDAO.updateVenue(vid, venue);
		ModelAndView mv = new ModelAndView();
		mv.addObject(v);
		mv.setViewName("venue/updatedVenueConfirmed");
		return mv;
}
	
	@RequestMapping(path = "confirmAddedVenue1.do", method = RequestMethod.GET)
	public ModelAndView updatedVenueConfirmed(Venue venue) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/updatedVenueConfirmed");
		return mv;
}
	
	@RequestMapping(path= "findVenueHomepage.do")
	public String dch() {
		return "venue/updateFirstPage";
	}
	
	
	@RequestMapping(path = "findVenueByID.do", params = "vid", method = RequestMethod.GET)
	public String showFilm(Integer vid, Model model) {
		try {
			Venue venue = eventDAO.findVenueById(vid);
			model.addAttribute("venue", venue);
		} catch (Exception e) {
			return "venue/updateVenue";
		}
		return "venue/updateVenue";
	}
}