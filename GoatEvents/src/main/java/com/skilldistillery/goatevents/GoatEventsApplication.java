package com.skilldistillery.goatevents;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("com.skilldistillery.jpagoatevents")
public class GoatEventsApplication {

	public static void main(String[] args) {
		SpringApplication.run(GoatEventsApplication.class, args);
	}

}
