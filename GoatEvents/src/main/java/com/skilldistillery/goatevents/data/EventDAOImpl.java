package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Artist;
import com.skilldistillery.goatevents.entities.Comment;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.EventType;
import com.skilldistillery.goatevents.entities.Venue;

@Transactional
@Service
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Event addEvent(Event newEvent) {
		Event event = em.find(Event.class, newEvent.getId());
	
		em.persist(event);
		em.flush();
		return event;
	}

	@Override
	public boolean deleteEvent(int id) {
		Event deleteEvent = em.find(Event.class, id);
		em.remove(deleteEvent);	
		boolean eventWasDeleted = !em.contains(deleteEvent);
		em.flush();
		return eventWasDeleted;
	}

	@Override
	public Event updateEvent(Event event) {
		Event updatedEvent = em.find(Event.class, event.getId());
		updatedEvent.setTitle(event.getTitle());
		updatedEvent.setDescription(event.getDescription());
		updatedEvent.setStartTime(event.getStartTime());
		updatedEvent.setEndTime(event.getEndTime());
		updatedEvent.setEventDate(event.getEventDate());
		updatedEvent.setImage(event.getImage());
		updatedEvent.setMaxCapacity(event.getMaxCapacity());
		updatedEvent.setNumOfTickets(event.getNumOfTickets());
		
		em.persist(updatedEvent);
		em.flush();
		
		return updatedEvent;
	}

	@Override
	public Event findById(int id) {
		Event event = em.find(Event.class, id);
		List<Comment> comments = event.getComments();
		List<EventType> et = event.getEventTypes();
		List<Artist> a = event.getArtists();
		System.out.println(event);
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
