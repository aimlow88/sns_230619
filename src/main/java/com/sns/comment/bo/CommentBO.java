package com.sns.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.domain.Comment;
import com.sns.comment.mapper.CommentMapper;

@Service
public class CommentBO {
	
	@Autowired
	private CommentMapper commentMapper;
	
	public void addComment(Comment comment) {
		commentMapper.insertComment(comment);
	}
	
	public void delCommentById(int id) {
		commentMapper.deleteCommentById(id);
	}
	
	public List<Comment> getCommentList() {
		return commentMapper.selectCommentList();
	}
	
	public List<Comment> getCommentListByPostId(int postId) {
		return commentMapper.selectCommentListByPostId(postId);
	}

}
