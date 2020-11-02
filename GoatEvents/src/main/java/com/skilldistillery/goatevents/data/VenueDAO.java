 package com.skilldistillery.goatevents.data;

import com.skilldistillery.goatevents.entities.Comment;
import com.skilldistillery.goatevents.entities.Venue;

public interface VenueDAO {
	
	public Venue addVenue(Venue venue);
	public Venue updateVenue(int id, Venue Venue);
	public boolean deleteVenue(int id);
	
}
