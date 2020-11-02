package com.skilldistillery.goatevents.data;

import java.util.List;

import com.skilldistillery.goatevents.entities.User;

public interface GoatDAO {
	
	User getTestUser();

	List<Object> findFromSearch(String keyword);

}
