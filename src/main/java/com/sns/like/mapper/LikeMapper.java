package com.sns.like.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.domain.Like;

@Repository
public interface LikeMapper {
	
//	public int selectCountByPostId(int postId);

//	public int selectCountByUserIdAndPostId(
//			@Param("userId") int userId,
//			@Param("postId") int postId);
	
	public int selectCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId
			);
	
	public void insertLikeByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);

	public void deleteLikeByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);

}
