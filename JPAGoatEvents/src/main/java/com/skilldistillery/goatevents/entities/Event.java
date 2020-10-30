package com.skilldistillery.goatevents.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int id;
	
	private String description;
	
	@Column(name = "start_time")
	private LocalDateTime startTime;
	
	@Column(name = "end_time")
	private LocalDateTime endTime;
	
	@Column(name ="max_capacity")
	private  int maxCapacity;
	
	@Column(name = "number_of_tickets")
	private int numOfTickets;
	
	private String title;
	
	private String image;
	
	@Column(name = "event_date")
	private LocalDateTime eventDate;
	
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
//	private Venue venue;

	public Event() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalDateTime startTime) {
		this.startTime = startTime;
	}

	public LocalDateTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalDateTime endTime) {
		this.endTime = endTime;
	}

	public int getMaxCapacity() {
		return maxCapacity;
	}

	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
	}

	public int getNumOfTickets() {
		return numOfTickets;
	}

	public void setNumOfTickets(int numOfTickets) {
		this.numOfTickets = numOfTickets;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDateTime getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDateTime eventDate) {
		this.eventDate = eventDate;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

//	public Venue getVenue() {
//		return venue;
//	}
//
//	public void setVenue(Venue venue) {
//		this.venue = venue;
//	}

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
		Event other = (Event) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [id=");
		builder.append(id);
		builder.append(", description=");
		builder.append(description);
		builder.append(", startTime=");
		builder.append(startTime);
		builder.append(", endTime=");
		builder.append(endTime);
		builder.append(", maxCapacity=");
		builder.append(maxCapacity);
		builder.append(", numOfTickets=");
		builder.append(numOfTickets);
		builder.append(", title=");
		builder.append(title);
		builder.append(", image=");
		builder.append(image);
		builder.append(", eventDate=");
		builder.append(eventDate);
		builder.append(", createdAt=");
		builder.append(createdAt);
		builder.append(", lastUpdate=");
		builder.append(lastUpdate);
		builder.append("]");
		return builder.toString();
	}



	
	
	
	
	

}