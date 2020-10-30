package com.skilldistillery.goatevents.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Artist {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

@Column(name="artist_type")
private String artistType;

@Column(name="artist_name")
private String artistName;

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
	Artist other = (Artist) obj;
	if (id != other.id)
		return false;
	return true;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getArtistType() {
	return artistType;
}

public void setArtistType(String artistType) {
	this.artistType = artistType;
}

public String getArtistName() {
	return artistName;
}

public void setArtistName(String artistName) {
	this.artistName = artistName;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("Artist [artistType=").append(artistType).append(", artistName=").append(artistName).append("]");
	return builder.toString();
}

public Artist() {
	super();
}

public Artist(int id, String artistType, String artistName) {
	super();
	this.id = id;
	this.artistType = artistType;
	this.artistName = artistName;
}

}
