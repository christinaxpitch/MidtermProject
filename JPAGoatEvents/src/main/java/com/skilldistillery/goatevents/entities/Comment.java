package com.skilldistillery.goatevents.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "event_id")
	private int eventId;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "comment_date")
	private LocalDateTime commentDate;
	
	private String content;
	
	private int rating;

	public Comment() {
		super();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [id=").append(id).append(", eventId=").append(eventId).append(", userId=")
				.append(userId).append(", commentDate=").append(commentDate).append(", text=").append(content)
				.append(", rating=").append(rating).append("]");
		return builder.toString();
	}

	
}
