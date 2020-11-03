package com.skilldistillery.goatevents.controllers;

import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.Venue;

@Controller
public class EventController {
	@Autowired
	private EventDAO dao;
	
	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView create() {
		int id = 1;
		ModelAndView mv = new ModelAndView();
		mv.addObject("venue", dao.findVenueById(id));
		mv.setViewName("event/createEvent");
		return mv;
	}
	
	@RequestMapping(path = "event.do" , method = RequestMethod.POST)
	public ModelAndView addEvent(Event event, String sTime, int vid, RedirectAttributes ra) {
		LocalTime startTime = LocalTime.parse(sTime);
		event.setStartTime(startTime);
		Venue venue = dao.findVenueById(vid);
		Event newEvent = dao.addEvent(event);
		newEvent.setVenue(venue);
		
		
		ModelAndView mv = new ModelAndView();
		ra.addFlashAttribute("event", newEvent);
		mv.setViewName("redirect:eventAdded.do");
		return mv;
		
	}
	@RequestMapping(path = "eventAdded.do", method = RequestMethod.GET)
	public ModelAndView created() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("event/showEvent");
	return mv;
	}
	
//	@RequestMapping(path= "deleteEventInput.do")
//	public ModelAndView deleteEventInput() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("event/deleteEvent");
//		return mv;
//	}
//	
//	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.GET)
//	public ModelAndView deleteEvent(Integer id) {
//		dao.deleteEvent(id);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("event/deleted");
//		return mv;
//	}
	
}
