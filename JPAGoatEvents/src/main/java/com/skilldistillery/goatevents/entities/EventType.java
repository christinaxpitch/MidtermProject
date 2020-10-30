package com.skilldistillery.goatevents.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "event_type")
public class EventType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String category;
	
	@ManyToMany (mappedBy = "eventTypes")
	private List <Event> events;

	public EventType() {
		super();
	}
	
	public EventType(int id, String category) {
		super();
		this.id = id;
		this.category = category;
	}
	
	public int getId() {
		return id;
	}

	public String getCategory() {
		return category;
	}

	
	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventType [id=").append(id).append(", category=").append(category).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventType other = (EventType) obj;
		if (id != other.id)
			return false;
		return true;
	}

	
	
	
}
