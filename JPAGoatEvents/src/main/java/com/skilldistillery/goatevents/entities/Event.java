package com.skilldistillery.goatevents.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	@Column(name = "start_time")
	private LocalTime startTime;

	@Column(name = "end_time")
	private LocalTime endTime;

	@Column(name = "max_capacity")
	private int maxCapacity;

	@Column(name = "number_of_tickets")
	private int numOfTickets;

	private String title;

	private String image;

	@Column(name = "event_date")
	private LocalDate eventDate;

	@Column(name = "created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@ManyToOne
	@JoinColumn(name = "venue_id")
	private Venue venue;

	@OneToMany(mappedBy = "event")
	private List<Comment> comments;

	@ManyToMany
	@JoinTable(name = "artist_event", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "artist_id"))
	private List<Artist> artists;

	@ManyToMany
	@JoinTable(name = "event_type_has_event", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "event_type_id"))
	private List<EventType> eventTypes;

	@ManyToMany(mappedBy= "events", cascade = CascadeType.PERSIST)
	private List<User> users;
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

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

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
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

	public List<EventType> getEventTypes() {
		return eventTypes;
	}

	public void setEventTypes(List<EventType> eventTypes) {
		this.eventTypes = eventTypes;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDate getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDate eventDate) {
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

	public List<Artist> getArtists() {
		return artists;
	}

	public void setArtists(List<Artist> artists) {
		this.artists = artists;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}
	public void addComment(Comment comment) {
		if(comments == null) { comments = new ArrayList<Comment>();}
		if(!comments.contains(comment)) {
			comments.add(comment);}
		}
	
		
	public void removeComment(Comment comment) {
		if(comments != null && comments.contains(comment)) {
			comments.remove(comment);
			}
		}
	
	public void addArtist(Artist ar) {
		if(artists == null) { artists = new ArrayList<Artist>();}
		if(!artists.contains(ar)) {
			artists.add(ar);
				ar.addEvent(this);
				}
		}
		
	public void removeArtist(Artist ar) {
		if(artists != null && artists.contains(ar)) {
			artists.remove(ar);
			ar.removeEvent(this);}
		}
	public void addUser(User u) {
		if(users == null) { users = new ArrayList<User>();}
		if(!users.contains(u)) {
			users.add(u);
			u.addEvent(this);
		}
	}
	
	public void removeUser(User u) {
		if(users != null && users.contains(u)) {
			users.remove(u);
			u.removeEvent(this);}
	}
	public void addEventType(EventType et) {
		if(eventTypes == null) { eventTypes = new ArrayList<EventType>();}
		if(!eventTypes.contains(et)) {
			eventTypes.add(et);
				et.addEvent(this);
				}
		}
		
	public void removeEventType(EventType et) {
		if(eventTypes != null && eventTypes.contains(et)) {
			eventTypes.remove(et);
			et.removeEvent(this);}
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
