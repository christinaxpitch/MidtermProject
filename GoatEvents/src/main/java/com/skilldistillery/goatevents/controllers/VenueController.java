package com.skilldistillery.goatevents.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.data.UserDAO;
import com.skilldistillery.goatevents.data.VenueDAO;
import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.User;
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
	public String updateVenueHomepage(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("loginUser");
		Venue userVenue = venueDAO.findVenueByManagerID(loggedInUser);
		model.addAttribute("venue", userVenue);

		return "venue/updateVenue";
	}
//	find the venue for that manager and add that attribute 
	
//	@RequestMapping(path = "addVenue.do", method = RequestMethod.POST)
//	public ModelAndView addVenue(Venue newVenue, String venueName, int venueCapacity, String venueDescription) {
//		newVenue.setName(venueName);
//		newVenue.setCapacity(venueCapacity);
//		newVenue.setDescription(venueDescription);
//		venueDAO.addVenue(newVenue);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("venue/addVenueConfirmed");
//		return mv;
//}
	
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
	
		
	@RequestMapping(path = "addVenue.do")
	public String addVenue(Address newAddress, Venue newVenue, Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (newAddress != null && !newAddress.getStreet().equals("")) {
			System.err.println("*********************************" + newAddress);
			Address userAddress = venueDAO.createVenueAddress(newAddress);
			user.setAddress(userAddress);
			model.addAttribute("newAddress", userAddress);

			if (newVenue != null) {
				System.err.println("*********************************" + newVenue);
				newVenue.setAddress(userAddress);
				Venue venue = venueDAO.addVenue(newVenue);
				venue.setUser(user);
				model.addAttribute("newVenue", newVenue);
				user = venueDAO.saveUser(user, newVenue);
			}
		}
		model.addAttribute("user", user);
		
		return "venue/addedVenueConfirmed";
	}
	
	
}