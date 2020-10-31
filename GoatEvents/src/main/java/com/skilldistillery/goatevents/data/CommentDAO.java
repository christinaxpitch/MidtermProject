package com.skilldistillery.goatevents.data;

import com.skilldistillery.goatevents.entities.Comment;

public interface CommentDAO {
	
	public Comment addComment(Comment comment);
	public Comment updateComment(int id, Comment comment);
	public boolean deleteComment(int id);

}
