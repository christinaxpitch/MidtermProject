package com.skilldistillery.goatevents.data;

import com.skilldistillery.goatevents.entities.Event;

public interface EventDAO {
	public Event addEvent(Event newEvent);
	
	public boolean  deleteEvent(int id);
	
	public Event updateEvent(int id, Event event);

	Event findById(int id);
}
