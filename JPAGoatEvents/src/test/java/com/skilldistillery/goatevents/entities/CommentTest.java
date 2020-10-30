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

class CommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Comment comment;

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
		comment = em.find(Comment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}

	@Test
	@DisplayName("This is to test the comment entities content field")
	void test() {
		assertNotNull(comment);
		assertEquals("Dude the beer and bacon were of GOD!!", comment.getContent());
	}

	@Test
	@DisplayName("This is to test the comment to user mapping")
	void test2() {
		assertNotNull(comment);
		assertEquals("dFresh", comment.getUser().getUsername());
		assertEquals("Vendor", comment.getUser().getRole());
		assertEquals("Sigmon", comment.getUser().getLastName());
	}

}
