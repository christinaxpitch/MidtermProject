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
	
	@Test
	@DisplayName("This is to test the event to comment mapping")
	void test3() {
		assertNotNull(event);
		assertNotNull(event.getComments());
		assertTrue(event.getComments().size() > 0);
		assertEquals(1, event.getComments().size());
		assertEquals("Dude the beer and bacon were of GOD!!", event.getComments().get(0).getContent());
		
	}
	
	@Test
	@DisplayName("This is to test the artist to event mapping")
	void test4() {
		assertNotNull(event);
		assertNotNull(event.getArtists());
		assertTrue(event.getArtists().size() > 0);
		assertEquals(1, event.getArtists().size());
		assertEquals("Cristina Mile High Pitch", event.getArtists().get(0).getArtistName());
		
	}
	
	@Test
	@DisplayName("This is to test the event to event type mapping")
	void test5() {
		assertNotNull(event);
		assertNotNull(event.getEventTypes());
		assertTrue(event.getEventTypes().size() > 0);
		assertEquals("comedy", event.getEventTypes().get(0).getCategory());

		
	}
	
	
}
