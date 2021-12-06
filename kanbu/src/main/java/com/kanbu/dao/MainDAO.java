package com.kanbu.dao;

import java.util.List;

import com.kanbu.dto.info.PlaceDTO;

public interface MainDAO {

	// 키워드 입력하여 장소 검색결과 갯수
	public int selectKeywordCount(String keyword) throws Exception;
	
	// 키워드 입력하여 장소 검색결과
	public List<PlaceDTO> selectKeywordPlaceNum(String keyword) throws Exception;
	

	
}
