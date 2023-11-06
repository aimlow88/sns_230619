package com.sns.card.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.domain.Comment;
import com.sns.post.bo.PostBO;
import com.sns.post.entity.PostEntity;

@Service
public class CardBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public List<Map<String, Object>> getCardList(){
		
		
		List<PostEntity> postList = postBO.getPostList();
		
		Iterator<PostEntity> iter = postList.iterator();
		
		List<Map<String, Object>> cardList = new ArrayList<>();
		
		while(iter.hasNext()) {
			
			PostEntity postEntity = iter.next();
			int getId = postEntity.getId();
			
			List<Comment> commentList = commentBO.getCommentListByPostId(getId);
			
			Map<String, Object> cardMap = new HashMap<>();
			cardMap.put("post", postEntity);
			cardMap.put("commentList", commentList);
			
			cardList.add(cardMap);
		}
		
		return cardList;
		
	}

}
