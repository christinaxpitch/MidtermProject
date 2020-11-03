package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.Comment;
import com.skilldistillery.goatevents.entities.Venue;

@Service
@Transactional
public class VenueDAOImpl implements VenueDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Venue addVenue(Venue venue) {
		em.persist(venue);
		em.flush();
		return venue;
	}

	@Override
	public Venue updateVenue(int id, Venue venue) {
		Venue newVenue = em.find(Venue.class, id);		
		newVenue.setName(venue.getName());
//		newVenue.setAddress(venue.getAddress());
		newVenue.setCapacity(venue.getCapacity());
		newVenue.setDescription(venue.getDescription());
//		newVenue.setLogo(venue.getLogo());
//		newVenue.setCreatedAt(venue.getCreatedAt());
		newVenue.setLastUpdate(venue.getLastUpdate());
		em.flush();
		return newVenue;
	}

	@Override
	public boolean deleteVenue(int id) {
		Venue deleteVenue = em.find(Venue.class, id);
		em.remove(deleteVenue);	
		boolean VenueWasDeleted = !em.contains(deleteVenue);
		em.flush();
		return VenueWasDeleted;
	}

	@Override
	public List<Venue> findAllVenues() {
			String jpql = "SELECT v FROM Venue v";
			return em.createQuery(jpql, Venue.class).getResultList();
	}



}


