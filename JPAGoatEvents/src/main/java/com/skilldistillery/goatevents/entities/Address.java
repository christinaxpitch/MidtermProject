package com.skilldistillery.goatevents.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

private String street;

private String city;

private String state;

private String zip;

private String phone;

public Address() {
	super();
}

public Address(int id, String street, String city, String state, String zip, String phone) {
	super();
	this.id = id;
	this.street = street;
	this.city = city;
	this.state = state;
	this.zip = zip;
	this.phone = phone;
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
	Address other = (Address) obj;
	if (id != other.id)
		return false;
	return true;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("Address [street=").append(street).append(", city=").append(city).append(", state=").append(state)
			.append(", zip=").append(zip).append(", phone=").append(phone).append("]");
	return builder.toString();
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getStreet() {
	return street;
}

public void setStreet(String street) {
	this.street = street;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getState() {
	return state;
}

public void setState(String state) {
	this.state = state;
}

public String getZip() {
	return zip;
}

public void setZip(String zip) {
	this.zip = zip;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

}
