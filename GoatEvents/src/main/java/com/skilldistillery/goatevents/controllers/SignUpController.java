package com.skilldistillery.goatevents.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.UserDAO;
import com.skilldistillery.goatevents.data.VenueDAO;
import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class SignUpController {

	@Autowired
	private UserDAO userDao;
//	private VenueDAO venueDao;

	@RequestMapping(path = "signUpInput.do")
	public String signUpInput() {
		return "signUpInput";
	}

	@RequestMapping(path = "signUp.do")
	public String signUp(User newUser, Address address, Venue venue, Model model) {
		User user = userDao.addUser(newUser);
		if (address != null && ! address.getStreet().equals("")) {
			System.err.println("*********************************" + address);
			Address userAddress = userDao.addAddress(address);
			user.setAddress(userAddress);

			if (venue != null) {
				System.err.println("*********************************" + venue);
				venue.setAddress(userAddress);
				Venue venueAddress = userDao.addVenue(venue);
			}
		}
		model.addAttribute("user", user);
		return "Home";
	}

}
