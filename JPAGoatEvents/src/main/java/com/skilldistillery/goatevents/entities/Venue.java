package com.skilldistillery.goatevents.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Venue {
	// FIELDS ============================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
//	private Address address;
	private int capacity;
	private String logo;
//	private User user;
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	// CONSTRUCTORS ======================================
	public Venue() {
		super();
	}

	// GETTERS AND SETTERS =============================
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

//	public Address getAddress() {
//		return address;
//	}
//
//	public void setAddress(Address address) {
//		this.address = address;
//	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int compacity) {
		this.capacity = compacity;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}

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

	// Hashcode AND Equals =============================
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
		Venue other = (Venue) obj;
		if (id != other.id)
			return false;
		return true;
	}

	// ToString =============================
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Venue [id=").append(id).append(", name=").append(name).append(", description=")
				.append(description).append(", capacity=").append(capacity).append(", logo=").append(logo)
				.append(", user=").append(", createdAt=").append(createdAt).append(", lastUpdate=").append(lastUpdate)
				.append("]");
		return builder.toString();
	}
}
