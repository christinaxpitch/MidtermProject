package com.skilldistillery.goatevents.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class EventTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventType et;
	
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
		et = em.find(EventType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		et = null;
	}

	@Test
	@DisplayName("This is to test the event type entities category field")
	void test() {
		assertNotNull(et);
		assertEquals("comedy", et.getCategory());
		
	}
	
	@Test
	@DisplayName("This is to test the event type to event mapping")
	void test6() {
		assertNotNull(et);
		assertNotNull(et.getEvents());
		assertTrue(et.getEvents().size() > 0);
		assertEquals("Beer and Bacon Fest", et.getEvents().get(0).getTitle());

	}

}
