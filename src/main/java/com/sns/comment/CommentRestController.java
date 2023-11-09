package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.domain.Comment;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	/**
	 * 댓글 입력 API
	 * @param postId
	 * @param content
	 * @param session
	 * @param comment
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> addComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session,
			@ModelAttribute Comment comment
			) {
		
		comment.setUserId((int) session.getAttribute("userId"));
		commentBO.addComment(comment);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
	}
	
	/**
	 * 댓글 삭제 API
	 * @param commentId
	 * @param commentUserId
	 * @param session
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> delComment(
			@RequestParam("commentId") int commentId,
			@RequestParam("commentUserId") int commentUserId,
			HttpSession session
			){
		
		Map<String, Object> result = new HashMap<>();
		
		
		result.put("code", 500);
		result.put("result", "실패");
		
		if (session.getAttribute("userId") == null) {
			result.put("errorMessage", "로그인을 해야만 삭제가능합니다.");
			return result;
		}

		int sessionUserId = (int) session.getAttribute("userId");

		if (sessionUserId != commentUserId) {
			result.put("errorMessage", "본인의 댓글만 삭제가능합니다.");
			return result;
		}
		
		commentBO.delCommentById(commentId);
		
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
		
	}

}
