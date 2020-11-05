package com.skilldistillery.goatevents.controllers;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.data.GoatDAO;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class EventController {
	@Autowired
	private EventDAO dao;
	@Autowired
	private GoatDAO gdao;

	ModelAndView mv = new ModelAndView();

	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView create(int id) {
		mv.addObject("venue", dao.findVenueById(id));
		mv.setViewName("event/createEvent");
		return mv;
	}

	@RequestMapping(path = "updateEventHome.do", method = RequestMethod.GET)
	public ModelAndView updateHome(int id) {
		mv.addObject("event", dao.findById(id));
		mv.setViewName("event/update");
		return mv;
	}

	@RequestMapping(path = "event.do", method = RequestMethod.POST)

	public ModelAndView addEvent(Event event, String sTime, String eTime, String eDate, Venue venue, RedirectAttributes ra)
			throws ParseException {
		LocalTime startTime = LocalTime.parse(sTime);
		event.setStartTime(startTime);
		LocalTime endTime = LocalTime.parse(eTime);
		event.setEndTime(endTime);
		LocalDate date = LocalDate.parse(eDate);
		event.setEventDate(date);
		
		event.setVenue(venue);
		Event newEvent = dao.addEvent(event);
//		newEvent.setVenue(venue);
		ra.addFlashAttribute("venue", newEvent.getVenue());
		ra.addFlashAttribute("event", newEvent);
		mv.setViewName("redirect:eventAdded.do");
		return mv;

	}

	@RequestMapping(path = "eventAdded.do", method = RequestMethod.GET)
	public ModelAndView created() {
		mv.setViewName("event/showEvent");
		return mv;
	}

	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public ModelAndView updateEvent(Event event, String sTime, String eTime, String eDate, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		System.out.println(event);
		LocalTime startTime = LocalTime.parse(sTime);
		event.setStartTime(startTime);
		LocalTime endTime = LocalTime.parse(eTime);
		event.setEndTime(endTime);
		LocalDate date = LocalDate.parse(eDate);
		event.setEventDate(date);
		Event updatedEvent = dao.updateEvent(event);
		mv.addObject("event", updatedEvent);
		mv.addObject("venue", updatedEvent.getVenue());
		User updatedUser = gdao.getUserByID(user.getId());
		session.setAttribute("loginUser", updatedUser);
		System.out.println(updatedEvent);
		mv.setViewName("event/showEvent");
		return mv;
	}

	@RequestMapping(path = "deleteEventHomepage.do")
	public String dch(Integer id) {
		return "event/deleteEvent";
	}

	@RequestMapping(path = "deleteEventForm.do", method = RequestMethod.GET)
	public ModelAndView deleteEvent(Integer id, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		Event eventToDelete = dao.findById(id);
		eventToDelete.setVenue(null);
		dao.deleteEvent(eventToDelete.getId());
		User updatedUser = gdao.getUserByID(user.getId());
		session.setAttribute("loginUser", updatedUser);
		mv.setViewName("event/deleted");
		return mv;
	}

	@RequestMapping(path = "getVenue.do", params = "venid")
	public String showVenue(Integer venid, Model model) {
		Venue venue = dao.findVenueById(venid);
		model.addAttribute("venue", venue);
		return "venue/showVenue";
	}

}
