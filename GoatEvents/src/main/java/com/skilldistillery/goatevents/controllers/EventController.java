package com.skilldistillery.goatevents.controllers;

import java.text.ParseException;
import java.time.LocalDate;
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
	public ModelAndView addEvent(Event event, String sTime, String eTime, String eDate, int vid, RedirectAttributes ra) throws ParseException {
		LocalTime startTime = LocalTime.parse(sTime);
		event.setStartTime(startTime);
		LocalTime endTime = LocalTime.parse(eTime);
		event.setEndTime(endTime);
		
		LocalDate date = LocalDate.parse(eDate);
		event.setEventDate(date);
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
	
	@RequestMapping(path= "deleteEventHomepage.do")
	public String dch() {
		return "event/deleteEvent";
	}
	
	@RequestMapping(path = "deleteEventForm.do", method = RequestMethod.GET)
	public ModelAndView deleteEvent(Integer eid) {
		dao.deleteEvent(eid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/deleted");
		return mv;
	}
	
}
