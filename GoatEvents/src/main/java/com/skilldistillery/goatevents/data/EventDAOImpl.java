package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.Venue;

@Transactional
@Service
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Event addEvent(Event newEvent) {
		em.persist(newEvent);
		em.flush();
		return newEvent;
	}

	@Override
	public boolean deleteEvent(int id) {
		Event deletedEvent = em.find(Event.class, id);
		em.remove(deletedEvent);
		boolean eventWasDeleted = !em.contains(deletedEvent);
		em.flush();
		return eventWasDeleted;
	}

	@Override
	public Event updateEvent(int id, Event event) {
		Event updatedEvent = em.find(Event.class, id);
		updatedEvent.setTitle(event.getTitle());
		updatedEvent.setDescription(event.getDescription());
		updatedEvent.setStartTime(event.getStartTime());
		updatedEvent.setEndTime(event.getEndTime());
		updatedEvent.setEventDate(event.getEventDate());
		updatedEvent.setImage(event.getImage());
		updatedEvent.setMaxCapacity(event.getMaxCapacity());
//		Stretch Goal
//		updatedEvent.setVenue(event.getVenue());
		updatedEvent.setNumOfTickets(event.getNumOfTickets());
		
		em.flush();
		return null;
	}

	@Override
	public Event findById(int id) {
		Event event = em.find(Event.class, id);
		em.flush();
		return event;
		
	}

	@Override
	public Venue findVenueById(int id) {
		em.flush();
		return em.find(Venue.class, id);
	}
	
	@Override
	public List<Venue> findAll() {
		List<Venue> venues = null;
		String jpql = "SELECT v FROM Venue v";
		venues = em.createQuery(jpql, Venue.class).getResultList();
		return venues;
	}

	
	

}
