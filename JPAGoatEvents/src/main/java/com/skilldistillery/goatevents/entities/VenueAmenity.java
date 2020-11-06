package com.skilldistillery.goatevents.entities;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "venue_amenity")

public class VenueAmenity {

	// FIELDS ============================================
	@EmbeddedId
	private VenueAmenityId id;
	@ManyToOne
	@JoinColumn(name = "amenity_id")
	@MapsId(value = "amenityId")
	private Amenity amenity;
	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name = "venue_id")
	@MapsId(value = "venueId")
	private Venue venue;
	private String description;

	// CONSTRUCTORS ======================================
	public VenueAmenity() {
		super();
	}

	// GETTERS AND SETTERS =============================
	public Amenity getAmenity() {
		return amenity;
	}

	public void setAmenity(Amenity amenity) {
		this.amenity = amenity;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public VenueAmenityId getId() {
		return id;
	}

	public void setId(VenueAmenityId id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("VenueAmenity [id=").append(id).append(", description=").append(description).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		VenueAmenity other = (VenueAmenity) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
