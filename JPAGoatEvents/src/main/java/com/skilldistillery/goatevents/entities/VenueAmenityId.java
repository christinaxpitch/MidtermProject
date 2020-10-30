package com.skilldistillery.goatevents.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class VenueAmenityId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "venue_id")
	private int venueId;

	@Column(name = "amenity_id")
	private int amenityId;

	public VenueAmenityId() {
		super();
	}

	public VenueAmenityId(int venueId, int amenityId) {
		super();
		this.venueId = venueId;
		this.amenityId = amenityId;
	}

	public int getVenueId() {
		return venueId;
	}

	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}

	public int getAmenityId() {
		return amenityId;
	}

	public void setAmenityId(int amenityId) {
		this.amenityId = amenityId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + amenityId;
		result = prime * result + venueId;
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
		VenueAmenityId other = (VenueAmenityId) obj;
		if (amenityId != other.amenityId)
			return false;
		if (venueId != other.venueId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("VenueAmenityId [venueId=").append(venueId).append(", amenityId=").append(amenityId).append("]");
		return builder.toString();
	}

}