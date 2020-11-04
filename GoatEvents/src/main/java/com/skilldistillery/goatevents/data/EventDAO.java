package com.skilldistillery.goatevents.data;

import java.util.List;

import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.Venue;

public interface EventDAO {
	public Event addEvent(Event newEvent);
	
	public boolean  deleteEvent(int id);
	
	public Event updateEvent(int id, Event event);

	Event findById(int id);
	
	Venue findVenueById(int id);

	List<Venue> findAll();
}
