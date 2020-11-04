 package com.skilldistillery.goatevents.data;

import java.util.List;

import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.Comment;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

public interface VenueDAO {
	
	public Venue addVenue(Venue venue);
	public Venue updateVenue(int id, Venue Venue);
	public boolean deleteVenue(int id);
	public List<Venue> findAllVenues();
	public Venue findVenueByManagerID(User user);
	public Address createVenueAddress(Address newAddress);
	public User saveUser(User user, Venue newVenue);
}
