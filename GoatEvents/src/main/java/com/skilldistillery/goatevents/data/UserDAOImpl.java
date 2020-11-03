package com.skilldistillery.goatevents.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Address;
import com.skilldistillery.goatevents.entities.Event;
import com.skilldistillery.goatevents.entities.User;
import com.skilldistillery.goatevents.entities.Venue;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User addUser(User newUser) {
		em.persist(newUser);
		em.flush();
		return newUser;
	}

	@Override
	public User addUserVenue(User newUser, Venue newVenue) {
		em.persist(newUser);
		em.flush();
		return newUser;
	}

	@Override
	public Venue addVenue(Venue newVenue) {
		em.persist(newVenue);
		em.flush();
		return newVenue;
	}

	@Override
	public Address addAddress(Address newAddress) {
		em.persist(newAddress);
		em.flush();
		return newAddress;
	}

	@Override
	public User updateUser(int id, User user) {
		User updateUser = em.find(User.class, id);
		updateUser.setUsername(user.getUsername());
		updateUser.setPassword(user.getPassword());
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setEmail(user.getEmail());
		em.flush();
		return updateUser;
	}

	@Override
	public List<Event> findAllEvents() {
		String jpql = "SELECT e FROM Event e";
		List<Event> emps = em.createQuery(jpql, Event.class).getResultList();
		return emps;

	}

	/*
	 * TODO This is to deactivate user. Needs to be checked, might just be deleting
	 * user not deactivating. We have an "enabled" column but not exactly sure how
	 * that will work.
	 */
	@Override
	public boolean deactivateUser(int id) {
		boolean userDeactivated = false;
		User deactivateUser = em.find(User.class, id);
		deactivateUser.setEnabled(0);
//		em.remove(deactivateUser);
		em.flush();
		if (deactivateUser.getEnabled() == 0) {
			userDeactivated = true;
			return userDeactivated;
		}
		return userDeactivated;
	}
	@Override
	public List<Venue> venueFavoritesList(User user) {
		int userId = user.getId();
		String sql = "Select u.venues from User u where userId = :id ";
		List<Venue> list = em.createQuery(sql, Venue.class).setParameter("id", userId).getResultList();
		return list;
	}
//	@Override
//	public List<Event> eventFavoritesList() {
//		String sql = "Select u. from  v join User ";
//		List<Venue> list = em.createQuery(sql, Venue.class).getResultList();
//		for (Venue venues : list) {
//			System.out.println(venues.getEvents());
//		}
//		return list;
//	}

	@Override
	public User login(String email, String password) {
		String sql = "Select u from User u where u.email = :email and u.password = :password";
		User login = em.createQuery(sql, User.class).setParameter("email", email).setParameter("password", password)
				.getSingleResult();
//		System.out.println(login);
		return login;
	}
	@Override
	public boolean isVendor(User vendor) {
		boolean isVendor = false;
		int vendorId = vendor.getId();
		String sql = "Select u from User u join Venue v on v.user.id = u.id where v.user.id = :manager and v.user.role like :userrole";
		List<User> login = em.createQuery(sql, User.class).setParameter("manager", vendorId).setParameter("userrole", "%vendor%").getResultList();
		if (login.size() > 0) {
			isVendor = true;
		}
		return isVendor;

	}
}