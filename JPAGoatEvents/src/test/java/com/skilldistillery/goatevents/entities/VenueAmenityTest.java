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

class VenueAmenityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private VenueAmenity venueAmenity;

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
		VenueAmenityId pid = new VenueAmenityId(1, 1);
		venueAmenity = em.find(VenueAmenity.class, pid);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venueAmenity = null;

	}

	@Test
	@DisplayName("Test venue amenity to DB")
	void test1() {
		assertNotNull(venueAmenity);
		assertEquals("8 bathrooms", venueAmenity.getDescription());
	}

	@Test
	@DisplayName("Test venue amenity to amenity")
	void test2() {
		assertNotNull(venueAmenity);
		assertEquals("baby changing stations", venueAmenity.getAmenity().getName());
	}

	@Test
	@DisplayName("Test venue amenity to venue")
	void test3() {
		assertNotNull(venueAmenity);
		assertEquals("Doug's Mega Venue", venueAmenity.getVenue().getName());
	}

}
