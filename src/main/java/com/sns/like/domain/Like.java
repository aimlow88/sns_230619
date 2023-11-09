package com.sns.like.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Like {
	
	private int userId;
	private int postId;
	private Date createdAt;

}
