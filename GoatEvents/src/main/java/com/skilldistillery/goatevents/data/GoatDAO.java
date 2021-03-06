package com.skilldistillery.goatevents.data;

import java.util.List;

import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

public interface GoatDAO {
	
	User getUserByID(int id);

	List<Event> findEventFromSearch(String keyword);

	List<Venue> findVenueFromSearch(String keyword);

	List<Event> findAllEvents();

	Event buyTicket(Event e);

	Venue findVenuebyId(Integer id);

	User addFavVenue(User user, Venue favVenue);

	User addFavEvent(User user, Event favEvent);

	User removeFavVenue(User user, Venue favVenue);

	User removeFavEvent(User user, Event favEvent);

}
