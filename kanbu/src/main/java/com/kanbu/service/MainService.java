package com.kanbu.service;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.info.PlaceDTO;


public interface MainService {
	
	// 키워드 입력하여 장소 검색결과 갯수
	public int selectKeywordCount(String keyword) throws Exception;
	
	// 키워드 입력하여 장소 검색결과
	public List<PlaceDTO> selectKeywordPlaceNum(SearchDTO search) throws Exception;
	
	// 최근 등록된 장소 갯수
	public int recentPlaceCount() throws Exception;
	
	// 최근 등록된 장소 리스트 조회
	public List<PlaceDTO> recentPlace(PlaceDTO place) throws Exception;
}
