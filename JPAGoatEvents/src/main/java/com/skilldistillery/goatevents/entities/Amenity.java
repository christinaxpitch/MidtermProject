package com.skilldistillery.goatevents.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Amenity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@OneToMany(mappedBy = "amenity")
	private List<VenueAmenity> venueAmenities;

	@ManyToMany(mappedBy = "amenities")
	private List<Venue> venues;

	public List<Venue> getVenues() {
		return venues;
	}

	public void setVenues(List<Venue> venues) {
		this.venues = venues;
	}

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

	

	public List<VenueAmenity> getVenueAmenities() {
		return venueAmenities;
	}

	public void setVenueAmenities(List<VenueAmenity> venueAmenities) {
		this.venueAmenities = venueAmenities;
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
		Amenity other = (Amenity) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public void addVenueAmenity(VenueAmenity ve) {
		if(venueAmenities == null) { venueAmenities = new ArrayList<VenueAmenity>();}
		if(!venueAmenities.contains(ve)) {
			venueAmenities.add(ve);
				}
		}
		
	public void removeVenueAmenity(VenueAmenity ve) {
		if(venueAmenities != null && venueAmenities.contains(ve)) {
			venueAmenities.remove(ve);
			}
		}
	public void addVenue(Venue a) {
		if (venues == null) {
			venues = new ArrayList<Venue>();
		}
		if (!venues.contains(a)) {
			venues.add(a);
			a.addAmenity(this);
		}
	}
	
	public void removeVenue(Venue a) {
		if (venues != null && venues.contains(a)) {
			venues.remove(a);
			a.removeAmenity(this);
		}
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Amenity [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", text=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}