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


class ArtistTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Artist artist;
	
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
		artist = em.find(Artist.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		artist = null;
	}

	@Test
	@DisplayName("test address entity mapping")
	void test() {
		assertNotNull(artist);
		assertEquals("high pitch singer", artist.getArtistType());
		assertEquals("Cristina Mile High Pitch", artist.getArtistName());
		
	}
	
	@Test
	@DisplayName("test artist mapping to events")
	void test2() {
		assertNotNull(artist);
		assertNotNull(artist.getEvents());
		assertTrue(artist.getEvents().size() > 0);
		assertEquals("Beer and Bacon Fest", artist.getEvents().get(0).getTitle());

	}
}
