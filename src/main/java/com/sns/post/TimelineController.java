package com.sns.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.card.bo.CardBO;
import com.sns.comment.bo.CommentBO;
import com.sns.post.bo.PostBO;
import com.sns.timeline.CardView;
import com.sns.timeline.bo.TimelineBO;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private CardBO cardBO;
	
	@Autowired
	private TimelineBO timelineBO;
	
	@GetMapping("/timeline-list-view")
	public String timelineListView (Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
//		if (userId == null) {
//			return "redirect:/user/sign-in-view";
//		}
		
		// 원본
		//List<PostEntity> postList = postBO.getPostList();
		//List<Comment> commentList = commentBO.getCommentList();
		//model.addAttribute("postList", postList);
		//model.addAttribute("commentList", commentList);
		//model.addAttribu/e("viewName", "timeline/time/ine");
		//model.addAttribute("viewName", "timeline/timeline2");
		
//		List<Map<String, Object>> cardList = cardBO.getCardList();
//		model.addAttribute("cardList", cardList);
		
		List<CardView> cardViewList = timelineBO.generateCardViewList();
		model.addAttribute("cardViewList", cardViewList);
		model.addAttribute("viewName", "timeline/timeline4");
		
		
		return "template/layout";
	}

}
