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
	
	@RequestMapping(path = "updateVenue.do", method = RequestMethod.GET)
	public ModelAndView updateVenue(Integer id, Venue venue) {
		venueDAO.updateVenue(id, venue);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/updateVenue");
		return mv;
}
	
	@RequestMapping(path = "confirmAddedVenue1.do", method = RequestMethod.GET)
	public ModelAndView updatedVenueConfirmed(Venue venue) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("venue/updatedVenueConfirmed");
		return mv;
}
	
	@RequestMapping(path = "findVenueByID.do", params = "id", method = RequestMethod.GET)
	public ModelAndView venueByID(@RequestParam("id") Integer a) {
		ModelAndView mv = new ModelAndView();
		Venue v;
		try {
		v = eventDAO.findVenueById(a);
			mv.addObject("venue", v);
			mv.setViewName("venue/updateVenue");
		} catch (Exception e) {
			mv.setViewName("venue/updateVenue");
		}
		return mv;
	}
}