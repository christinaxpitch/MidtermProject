package com.skilldistillery.goatevents.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private int enabled;

	private String role;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "profile_pic")
	private String image;

	private String email;

	@Column(name = "created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;
	
	@ManyToMany(mappedBy = "users", fetch = FetchType.EAGER,cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Venue> venues;
	
	@OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Venue> managerVenues;
	
	@OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Comment> userComments;
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name = "user_event", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "event_id"))
	private List<Event> events;

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Venue> getManagerVenues() {
		return managerVenues;
	}

	public void setManagerVenues(List<Venue> managerVenues) {
		this.managerVenues = managerVenues;
	}

	public List<Venue> getVenues() {
		return venues;
	}

	public void setVenues(List<Venue> venues) {
		this.venues = venues;
	}

	public List<Comment> getUserComments() {
		return userComments;
	}

	public void setUserComments(List<Comment> userComments) {
		this.userComments = userComments;
	}

	public User() {
		super();
	}
	public void addVenue(Venue venue) {
		if(venues == null) { venues = new ArrayList<Venue>();}
		if(!venues.contains(venue)) {
			venues.add(venue);
				venue.addUser(this);
				}
		}
		
	public void removeVenue(Venue venue) {
		if(venues != null && venues.contains(venue)) {
			venues.remove(venue);
			venue.removeUser(this);}
		}
	public void addEvent(Event event) {
		if(events == null) { events = new ArrayList<Event>();}
		if(!events.contains(event)) {
			events.add(event);
			event.addUser(this);
		}
	}
	
	public void removeEvent(Event event) {
		if(events != null && events.contains(event)) {
			events.remove(event);
			event.removeUser(this);}
	}

	public void addManagerVenue(Venue v) {
		if(managerVenues == null) { managerVenues = new ArrayList<Venue>();}
		if(!managerVenues.contains(v)) {
			managerVenues.add(v);
				
				}
		}
		
	public void removeManagerVenue(Venue v) {
		if(managerVenues != null && managerVenues.contains(v)) {
			managerVenues.remove(v);
			}
		}
	public void addComment(Comment c) {
		if(userComments == null) { userComments = new ArrayList<Comment>();}
		if(!userComments.contains(c)) {
			userComments.add(c);
			}
		}
		
	public void removeComment(Comment c) {
		if(userComments != null && userComments.contains(c)) {
			userComments.remove(c);
			}
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
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", role=");
		builder.append(role);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", image=");
		builder.append(image);
		builder.append(", email=");
		builder.append(email);
		builder.append(", createdAt=");
		builder.append(createdAt);
		builder.append(", lastUpdate=");
		builder.append(lastUpdate);
		builder.append(", address=");
		builder.append(address);
//		builder.append(", venues=");
//		builder.append(venues);
//		builder.append(", managerVenues=");
//		builder.append(managerVenues);
//		builder.append(", userComments=");
//		builder.append(userComments);
		builder.append("]");
		return builder.toString();
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

}
