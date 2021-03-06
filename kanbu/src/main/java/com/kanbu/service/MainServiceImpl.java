package com.kanbu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.MainDAO;
import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;

@Service
public class MainServiceImpl implements MainService{
	
	@Inject
	MainDAO mainDAO;
	
	// 인기 여행지 추출
	@Override
	public List<PlaceDTO> popularPlace(int rownum) throws Exception {
		return mainDAO.popularPlace(rownum);
	}
	
	// 인기 리뷰 추출
	@Override
	public List<BoardDTO> popularReview(int rownum) throws Exception {
		return mainDAO.popularReview(rownum);
	}
	
	// 인기 리뷰 태그 리스트수 추출
	@Override
	public int popularTagReviewCount(List<Integer> indexList) throws Exception {
		return mainDAO.popularTagReviewCount(indexList);
	}
	
	// 인기 여행 리뷰 태그 리스트
	@Override
	public List<BoardDTO> popularTagReview(List<Integer> indexList) throws Exception {
		return mainDAO.popularTagReview(indexList);
	}
	
	// 키워드 입력하여 장소 검색결과 갯수
	@Override
	public int selectKeywordCount(String keyword) throws Exception {
		return mainDAO.selectKeywordCount(keyword);
	}

	// 키워드 입력하여 장소 검색결과
	@Override
	public List<PlaceDTO> selectKeywordPlaceNum(SearchDTO search) throws Exception {
		return mainDAO.selectKeywordPlaceNum(search);
	}

	// 최근 등록된 장소 갯수
	@Override
	public int recentPlaceCount() throws Exception {
		return mainDAO.recentPlaceCount();
	}

	// 최근 등록된 장소 리스트 조회
	@Override
	public List<PlaceDTO> recentPlace(PlaceDTO place) throws Exception {
		return mainDAO.recentPlace(place);
	}


}
