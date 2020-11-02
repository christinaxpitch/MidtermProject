package com.skilldistillery.goatevents.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.User;


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
	public List<Object> findFromSearch(String search) {
		String jpql = "SELECT e FROM Event e"
				+ " WHERE title LIKE :title "
				+ "OR eventDate LIKE :date "
				+ "OR description LIKE :desc";
		List<Object> emps = em.createQuery(jpql, Object.class).setParameter("title", "%" + search + "%").setParameter("date", "%" + search + "%").setParameter("desc", "%" + search + "%").getResultList();
		
		return null;
	}

}
