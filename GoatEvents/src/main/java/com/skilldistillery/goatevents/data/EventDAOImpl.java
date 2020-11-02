package com.skilldistillery.goatevents.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.Transactional;

import com.skilldistillery.goatevents.entities.Event;

@Transactional
public class EventDAOImpl implements EventDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("GoatEvents");

	@Override
	public Event addEvent(Event newEvent) {
		EntityManager em = emf.createEntityManager();
		em.persist(newEvent);
		em.flush();
		em.close();
		return newEvent;
	}

	@Override
	public boolean deleteEvent(int id) {
		EntityManager em = emf.createEntityManager();
		Event deletedEvent = em.find(Event.class, id);
		boolean eventWasDeleted = !em.contains(deletedEvent);
		em.flush();
		em.close();
		return eventWasDeleted;
	}

	@Override
	public Event updateEvent(int id, Event event) {
		EntityManager em = emf.createEntityManager();
		
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
		em.close();
		return null;
	}

}
