package com.sns.comment.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sns.comment.domain.Comment;

@Repository
public interface CommentMapper {
	
	public void insertComment(Comment comment);
	
	public void deleteCommentById(int id);
	
	public List<Comment> selectCommentList();
	
	public List<Comment> selectCommentListByPostId(int postId);

}
