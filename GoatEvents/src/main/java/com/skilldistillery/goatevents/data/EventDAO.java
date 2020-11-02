package com.skilldistillery.goatevents.data;

import com.skilldistillery.goatevents.entities.Event;

public interface EventDAO {
	Event addEvent(Event newEvent);
	
	Event  deleteEvent(int id);
	
	Event updateEvent(int id, Event event);
}
