package com.skilldistillery.goatevents.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goatevents.data.UserDAO;
import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class SignUpController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "signUpInput.do")
	public String signUpInput() {
		return "signUpInput";
	}

	@RequestMapping(path = "signUp.do")
	public String signUp(User newUser, Address address, Venue venue, Model model) {
		User user = userDao.addUser(newUser);
		if (address != null && !address.getStreet().equals("")) {
			System.err.println("*********************************" + address);
			Address userAddress = userDao.addAddress(address);
			user.setAddress(userAddress);

			if (venue != null) {
				System.err.println("*********************************" + venue);
				venue.setAddress(userAddress);
				Venue venueAddress = userDao.addVenue(venue);
			}
		}
		model.addAttribute("eventList", userDao.findAllEvents());
		model.addAttribute("user", user);
		
		return "Home";
	}
	@RequestMapping(path = "login.do" , method= RequestMethod.GET)
	public String loginUser(Model mode , String email, String password, HttpSession session){
		User user = userDao.login(email, password);
		if(user != null) {
			if(user.getImage() == null) {
				user.setImage("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg");
			}
			session.setAttribute("loginUser", user);
		}
		boolean isVendor = userDao.isVendor(user);
		if(isVendor == true) {
			
		System.out.println(user);
		return "vendorProfilePage";
		}
		return "userProfilePage";
	}

}
