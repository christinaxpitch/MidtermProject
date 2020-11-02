package com.skilldistillery.goatevents.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
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
		em.close();
		return newUser;
	}

	@Override
	public User addUserVenue(User newUser, Venue newVenue) {
		em.persist(newUser);
		em.flush();
		em.close();
		return newUser;
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
		em.close();
		return updateUser;
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
		em.close();
		if(deactivateUser.getEnabled() == 0) {
			userDeactivated = true;
			return userDeactivated;
		}
		return userDeactivated;
	}

	@Override
	public List<Venue> venueFavoritesList() {
		String sql = "Select v from Venue v join User ";
		List<Venue> list = em.createQuery(sql, Venue.class).getResultList();
		for (Venue venues : list) {
			System.out.println(venues.getEvents());
		}
		return list;
	}
}