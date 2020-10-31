package com.skilldistillery.goatevents.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goatevents.entities.Comment;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Comment addComment(Comment comment) {

		em.persist(comment);
		em.flush();
		em.close();
		return comment;
	}

	@Override
	public Comment updateComment(int id, Comment comment) {
		Comment newComment = em.find(Comment.class, id);
		
		newComment.setRating(comment.getRating());
		newComment.setContent(comment.getContent());
		
		return newComment;
	}

	@Override
	public boolean deleteComment(int id) {
		Comment deleteComment = em.find(Comment.class, id);
		em.remove(deleteComment);	
		boolean commentWasDeleted = !em.contains(deleteComment);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return commentWasDeleted;
	}

}
