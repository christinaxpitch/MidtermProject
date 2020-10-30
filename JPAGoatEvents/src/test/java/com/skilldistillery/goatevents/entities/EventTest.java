package com.skilldistillery.goatevents.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class EventTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}

	@Test
	@DisplayName("test Event entity mapping")
	void test() {
		assertNotNull(event);
		assertEquals("Beer and Bacon Fest", event.getTitle());

	}

	@Test
	@DisplayName("test Event to venue mapping")
	void test2() {
		assertNotNull(event);
		assertEquals("Doug's Mega Venue", event.getVenue().getName());
		assertEquals(
				"Mega venue that can be used to hold huge events or sectioned off to hold many different small events",
				event.getVenue().getDescription());
		assertEquals(50000, event.getVenue().getCapacity());
	}
}
