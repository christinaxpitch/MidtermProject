package com.skilldistillery.goatevents.data;

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

}
