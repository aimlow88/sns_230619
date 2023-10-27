package com.sns.test.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.test.domain.MusicVO;
import com.sns.test.mapper.MusicMapper;

@Service
public class MusicBO {
	
	@Autowired
	private MusicMapper musicMapper;
	
	public List<MusicVO> getMusicList(){
		return musicMapper.selectMusicList();
	}

}
