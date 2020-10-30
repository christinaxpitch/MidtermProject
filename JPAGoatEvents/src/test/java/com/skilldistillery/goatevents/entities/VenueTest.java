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

class VenueTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Venue venue;

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
		venue = em.find(Venue.class, 1);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venue = null;

	}

	@Test
	@DisplayName("testing venue entity")
	void test1() {
		assertNotNull(venue);
		assertEquals("Doug's Mega Venue", venue.getName());
		assertEquals(
				"Mega venue that can be used to hold huge events or sectioned off to hold many different small events",
				venue.getDescription());
		assertEquals(50000, venue.getCapacity());
	}

	@Test
	@DisplayName("test venue mapping to address")
	void test2() {
		assertNotNull(venue);
		assertEquals("123 Sesame St.", venue.getAddress().getStreet());
		assertEquals("Denver", venue.getAddress().getCity());
		assertEquals("80014", venue.getAddress().getZip());
	}

	@Test
	@DisplayName("testing venue to user mappings ManyToMany")
	void test3() {
		assertNotNull(venue);
		assertNotNull(venue.getUsers());
		assertTrue(venue.getUsers().size() > 0);
		assertEquals("Sigmon", venue.getUsers().get(0).getLastName());
	}

	@Test
	@DisplayName("test venue mapping to user manyToOne")
	void test4() {
		assertNotNull(venue);
		assertEquals("dFresh", venue.getUser().getUsername());
		assertEquals("Vendor", venue.getUser().getRole());
		assertEquals("Sigmon", venue.getUser().getLastName());
	}

	@Test
	@DisplayName("test venue mapping to event")
	void test5() {
		assertNotNull(venue);
		assertNotNull(venue.getEvents());
		assertTrue(venue.getEvents().size() > 0);
		assertEquals("various beer and bacon vendors", venue.getEvents().get(0).getDescription());
	}

	@Test
	@DisplayName("test venue mapping to venueAmenity")
	void test6() {
		assertNotNull(venue);
		assertNotNull(venue.getVenueAmenities());
		assertTrue(venue.getVenueAmenities().size() > 0);
		assertEquals("8 bathrooms", venue.getVenueAmenities().get(0).getDescription());
	}
}
