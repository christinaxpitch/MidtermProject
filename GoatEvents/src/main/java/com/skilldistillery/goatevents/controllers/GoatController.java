package com.skilldistillery.goatevents.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.data.UserDAO;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class GoatController {

	@Autowired
	private GoatDAO dao;
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		model.addAttribute("eventList", dao.findAllEvents());
		return "Home";
	}

	@RequestMapping(path = "user.do")
	public String userProfile(Model model, HttpSession session) {
//		model.addAttribute("user", dao.getTestUser());
		User user = (User) session.getAttribute("loginUser");
//		System.out.println(user.getVenues().get(0).getEvents());
		System.out.println("*************************" + user.getVenues().size());
//		System.out.println(user.getVenues().get(0).getVenueAmenities());
		if (user.getVenues().size() > 0) {
			List<Venue> userVenues = userDao.venueFavoritesList(user);
			System.out.println("*************************" + userVenues);
//		List<Venue> userVenues = user.getVenues();
			System.out.println("*************************" + user.getVenues().get(0));

			model.addAttribute("venueFavoritesList", userVenues);
		}
		return "userProfilePage";
	}

	@RequestMapping(path = "vendor.do")
	public String vendorProfile(Model model, HttpSession session) {
		model.addAttribute("user", dao.getTestUser());
		return "user";
	}

}
