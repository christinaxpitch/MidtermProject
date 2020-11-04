package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;


@Service
@Transactional
public class GoatDAOJPAImpl implements GoatDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User getTestUser() {
		return em.find(User.class, 1);
	}
	
	@Override
	public List<Event> findAllEvents() {
		String jpql = "SELECT e FROM Event e";
		List<Event> emps = em.createQuery(jpql, Event.class).getResultList();
		return emps;
		
	}
	
	@Override
	public List<Event> findEventFromSearch(String search) {
		String jpql = "SELECT e FROM Event e"
				+ " WHERE title LIKE :title "
//				+ "OR eventDate LIKE :date "
				+ "OR description LIKE :desc "
				+ "ORDER BY eventDate ASC";
		List<Event> emps = em.createQuery(jpql, Event.class).setParameter("title", "%" + search + "%").setParameter("desc", "%" + search + "%").getResultList();
		
		return emps;
	}

	@Override
	public List<Venue> findVenueFromSearch(String search) {
		String jpql = "SELECT v FROM Venue v"
				+ " WHERE name LIKE :title "
				+ "OR description LIKE :desc";
		List<Venue> emps = em.createQuery(jpql, Venue.class).setParameter("title", "%" + search + "%").setParameter("desc", "%" + search + "%").getResultList();
		
		return emps;
	}

	@Override
	public Event buyTicket(Event e) {
		int ticketNumber = e.getNumOfTickets();
		ticketNumber--;
		e.setNumOfTickets(ticketNumber);
		em.persist(e);
		return e;
	}

	@Override
	public Venue findVenuebyId(Integer id) {
		return em.find(Venue.class, id);
			}

	@Override
	public User addFavVenue(User user, Venue favVenue) {
		Venue venueToAdd = em.find(Venue.class, favVenue.getId());
		System.out.println(venueToAdd);
		user.getUserComments();
		user.addVenue(venueToAdd);
		em.persist(user);
		return user;
	}

}
