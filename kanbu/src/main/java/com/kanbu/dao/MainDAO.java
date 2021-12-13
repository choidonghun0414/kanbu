package com.kanbu.dao;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;

public interface MainDAO {

	// 인기 여행지 추출
	public List<PlaceDTO> popularPlace(int rownum) throws Exception;
	
	// 인기 리뷰 추출
	public List<BoardDTO> popularReview(int rownum) throws Exception;
	
	// 인기 리뷰 태그 리스트수 추출
	public int popularTagReviewCount(List<Integer> indexList) throws Exception;
	
	// 인기 여행 리뷰 태그 리스트
	public List<BoardDTO> popularTagReview(List<Integer> indexList) throws Exception;
	
	// 키워드 입력하여 장소 검색결과 갯수
	public int selectKeywordCount(String keyword) throws Exception;
	
	// 키워드 입력하여 장소 검색결과
	public List<PlaceDTO> selectKeywordPlaceNum(SearchDTO search) throws Exception;
	
	// 최근 등록된 장소 갯수
	public int recentPlaceCount() throws Exception;
	
	// 최근 등록된 장소 리스트 조회
	public List<PlaceDTO> recentPlace(PlaceDTO place) throws Exception;
	
}
