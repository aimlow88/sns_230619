package com.sns.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.test.bo.MusicBO;
import com.sns.test.domain.MusicVO;

@Controller
public class TestController {
	
	@ResponseBody
    @RequestMapping("/test1")
    public String helloWorld() {
        return "Hello world!";
    }
	
	@ResponseBody
	@RequestMapping("/test2")
	public Map<String, Object> test2() {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("name", "홍길동");
		map.put("email", "kdhong@gmail.com");
		map.put("nickName", "제로스");
		
		return map;
	}
	
	@RequestMapping("/test3")
	public String test3() {
		
		return "test/test3";
	}
	
	@Autowired
	private MusicBO musicBO;
	
	@ResponseBody
	@RequestMapping("/test4")
	public List<MusicVO> test4() {
		
		return musicBO.getMusicList();
	}
	
}