package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.domain.Comment;
import com.sns.comment.domain.CommentView;
import com.sns.post.bo.PostBO;
import com.sns.post.entity.PostEntity;
import com.sns.timeline.CardView;
import com.sns.user.bo.UserBO;

@Service
public class TimelineBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public List<CardView> generateCardViewList(){
		
		List<CardView> cardViewList = new ArrayList<>();
		
		List<PostEntity> postList = postBO.getPostList();

		for (PostEntity post : postList) {
			
			CardView cardView = new CardView();
			userBO.getUserEntityByUserId(post.getUserId());
			
			List<CommentView> commentViewList = new ArrayList<>();

			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			
			for (Comment comment : commentList) {
				CommentView commentView = new CommentView();
				commentView.setComment(comment);
				commentView.setUser(userBO.getUserEntityByUserId(comment.getUserId()));
				commentViewList.add(commentView);
			}
			
			cardView.setPost(post);
			cardView.setUser(userBO.getUserEntityByUserId(post.getUserId()));
			cardView.setCommentViewList(commentViewList);
			
			cardViewList.add(cardView);
		}
		
		return cardViewList;
		
	}

}
