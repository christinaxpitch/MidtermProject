package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		em.close();
		return venue;
	}

	@Override
	public Venue updateVenue(int id, Venue Venue) {
		Venue newVenue = em.find(Venue.class, id);		
		newVenue.setName(newVenue.getName());
		newVenue.setAddress(newVenue.getAddress());
		newVenue.setCapacity(newVenue.getCapacity());
		newVenue.setDescription(newVenue.getDescription());
		newVenue.setLogo(newVenue.getLogo());
		newVenue.setCreatedAt(newVenue.getCreatedAt());
		newVenue.setLastUpdate(newVenue.getLastUpdate());
		return newVenue;
	}

	@Override
	public boolean deleteVenue(int id) {
		Venue deleteVenue = em.find(Venue.class, id);
		em.remove(deleteVenue);	
		boolean VenueWasDeleted = !em.contains(deleteVenue);
		em.flush();
		em.close();
		return VenueWasDeleted;
	}

	@Override
	public List<Venue> findAllVenues() {
			String jpql = "SELECT * FROM Venue v";
			return em.createQuery(jpql, Venue.class).getResultList();
	}

}


