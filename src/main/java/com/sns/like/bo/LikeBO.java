package com.sns.like.bo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.mapper.LikeMapper;

@Service
public class LikeBO {
	
	@Autowired
	private LikeMapper likeMapper;
	
	public int getCountByPostId(int postId) {
		return likeMapper.selectCountByPostIdOrUserId(postId, null);
	}
	
	public int getCountByUserIdAndPostId(int userId, int postId) {
		return likeMapper.selectCountByPostIdOrUserId(postId, userId);
	}
	
	public void addLikeByPostIdAndUserId(int postId, int userId) {
		likeMapper.insertLikeByPostIdAndUserId(postId, userId);
	}
	
	public void delLikeByPostIdAndUserId(int postId, int userId) {
		likeMapper.deleteLikeByPostIdAndUserId(postId, userId);
	}
	
	public boolean isLike(Integer userId, int postId) {
		
		if (userId == null) {
			return false;
		}
		
		if (getCountByUserIdAndPostId(userId, postId) < 1) {
			return false;
		}
		
		return true; 
	}
	
	public int likeCount(int postId) {
		
		return getCountByPostId(postId);
	}

}
