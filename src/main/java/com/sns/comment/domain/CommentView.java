package com.sns.comment.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sns.user.entity.UserEntity;

import lombok.Data;

@Data
public class CommentView {
	
	private Comment comment;
	
	private UserEntity user;


}
