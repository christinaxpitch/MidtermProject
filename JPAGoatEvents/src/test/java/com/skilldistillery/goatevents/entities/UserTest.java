package com.skilldistillery.goatevents.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("GoatEvents");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("test user entity mapping")
	void test() {
		assertNotNull(user);
		assertEquals("dFresh", user.getUsername());
		assertEquals("Vendor", user.getRole());
		assertEquals("Sigmon", user.getLastName());

	}

	@Test
	@DisplayName("test user mapping to address")
	void test2() {
		assertNotNull(user);
		assertEquals("123 Sesame St.", user.getAddress().getStreet());
		assertEquals("Denver", user.getAddress().getCity());
		assertEquals("80014", user.getAddress().getZip());

	}

	@Test
	@DisplayName("test manager user mapping to venue")
	void test3() {
		assertNotNull(user);
		assertNotNull(user.getVenues());
		assertTrue(user.getVenues().size() > 0);
		assertEquals(50000, user.getVenues().get(0).getCapacity());
	}

	@Test
	@DisplayName("test user mapping to comment")
	void test4() {
		assertNotNull(user);
		assertNotNull(user.getUserComments());
		assertTrue(user.getUserComments().size() > 0);
		assertEquals("Dude the beer and bacon were of GOD!!", user.getUserComments().get(0).getContent());
	}

}
