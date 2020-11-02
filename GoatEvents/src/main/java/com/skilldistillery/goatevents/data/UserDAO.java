package com.skilldistillery.goatevents.data;

import java.util.List;

import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

public interface UserDAO {

	User addUser(User newUser);

	User addUserVenue(User newUser, Venue newVenue);

	User updateUser(int id, User user);

	boolean deactivateUser(int id);

	List<Venue> venueFavoritesList();

	Venue addVenue(Venue newVenue);

	Address addAddress(Address newAddress);

}
