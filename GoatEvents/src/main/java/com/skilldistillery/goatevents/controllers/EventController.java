package com.skilldistillery.goatevents.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.goatevents.data.EventDAO;
import com.skilldistillery.goatevents.entities.Event;

@Controller
public class EventController {
	@Autowired
	private EventDAO dao;
	
	@RequestMapping(path= {"/", "home.do"})
	public String index() {
		return "home";
	}
	
	@RequestMapping(path = "event.do" , method = RequestMethod.POST)
	public ModelAndView addEvent(Event event, RedirectAttributes ra) {
		Event newEvent = dao.addEvent(event);
		ModelAndView mv = new ModelAndView();
		ra.addFlashAttribute("event", newEvent);
		mv.setViewName("redirect:eventAdded.do");
		return mv;
	}
	@RequestMapping(path = "eventAdded.do", method = RequestMethod.GET)
	public ModelAndView created() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("event/show");
	return mv;
	}
	
	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.GET)
	public ModelAndView deleteEvent(Integer id) {
		dao.deleteEvent(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/deleted");
		return mv;
	}
	
	
	
	
	
	
}
