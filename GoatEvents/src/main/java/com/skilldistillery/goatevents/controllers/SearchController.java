package com.skilldistillery.goatevents.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class SearchController {

	@Autowired
	private GoatDAO dao;
	@Autowired
	private EventDAO daoEvent;
	
	@RequestMapping (path = "search.do")
	public String search(Model model, String search, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Event> eventList =  dao.findEventFromSearch(search);
		List<Venue> venueList = dao.findVenueFromSearch(search);
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
		String sessionSearch = (String)session.getAttribute("search");
		if((sessionSearch != search)) {
		session.setAttribute("search", search);}
		model.addAttribute("count", count);
		model.addAttribute("keyword", search);
		model.addAttribute("events", eventList);
		model.addAttribute("venues", venueList);
		return "searchresult";
	}
	
	@RequestMapping(path="buyTicket.do")
	public String buyTicket(Model model, Integer id , HttpSession session) {
		User loggedIn =(User)session.getAttribute("loginUser");
		if (loggedIn == null) {
			return "signUpInput";
		}
		Event e = daoEvent.findById(id);
		if(e.getNumOfTickets() > 0) {
		dao.buyTicket(e);}
		String search = (String)session.getAttribute("search");
		List<Event> eventList =  dao.findEventFromSearch(search);
		int count = 0;
		for (Event event : eventList) {
			count++;
		}
		List<Venue> venueList = dao.findVenueFromSearch(search);
		for (Venue venue : venueList) {
			count++;
		}
		model.addAttribute("count", count);
		model.addAttribute("events", eventList);
		model.addAttribute("venues", venueList);
		model.addAttribute("search", search);
		return "searchresult";
	}
	
	@RequestMapping(path="addFavVenue.do")
	public String addFavVenue(Model model, Integer id, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		if(user == null) {
			return "signUpInput";
		}
		System.out.println(user);
		Venue favVenue = dao.findVenuebyId(id);
		System.out.println(favVenue);
		User updated = dao.addFavVenue(user, favVenue);
		model.addAttribute("eventFavoritesList", updated.getEvents());
		model.addAttribute("venueFavoritesList", updated.getVenues());
		session.setAttribute("loginUser", updated);
		return "userProfilePage";
	}
	
	
	@RequestMapping(path="removeFavVenue.do")
	public String removeFavVenue(Model model, Integer id, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		System.out.println(user);
		Venue favVenue = dao.findVenuebyId(id);
		System.out.println(favVenue);
		User updated = dao.removeFavVenue(user, favVenue);
		model.addAttribute("eventFavoritesList", updated.getEvents());
		model.addAttribute("venueFavoritesList", updated.getVenues());
		session.setAttribute("loginUser", updated);
		return "userProfilePage";
	}
	
	
	@RequestMapping(path="addFavEvent.do")
	public String addFavEvent(Model model, Integer id, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		if(user == null) {
			return "signUpInput";
		}
		Event favEvent = daoEvent.findById(id);
		User updated = dao.addFavEvent(user, favEvent);
		model.addAttribute("eventFavoritesList", updated.getEvents());
		model.addAttribute("venueFavoritesList", updated.getVenues());
		session.setAttribute("loginUser", updated);
		return "userProfilePage";
	}
	
	
	@RequestMapping(path="removeFavEvent.do")
	public String removeFavEvent(Model model, Integer id, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		Event favEvent = daoEvent.findById(id);
		User updated = dao.removeFavEvent(user, favEvent);
		model.addAttribute("eventFavoritesList", updated.getEvents());
		model.addAttribute("venueFavoritesList", updated.getVenues());
		session.setAttribute("loginUser", updated);
		return "userProfilePage";
	}
	

}
