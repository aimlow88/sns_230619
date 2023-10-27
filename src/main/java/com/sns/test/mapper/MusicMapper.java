package com.sns.test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sns.test.domain.MusicVO;

@Repository
public interface MusicMapper {
	
	public List<MusicVO> selectMusicList();

}
