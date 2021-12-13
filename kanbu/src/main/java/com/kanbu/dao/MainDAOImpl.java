package com.kanbu.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;

@Repository
public class MainDAOImpl implements MainDAO{

	@Inject
	private SqlSessionTemplate mybatis;
	
	// 인기 여행지 추출
	@Override
	public List<PlaceDTO> popularPlace(int rownum) throws Exception {
		return mybatis.selectList("info.popularPlace", rownum);
	}
	
	// 인기 리뷰 추출
	@Override
	public List<BoardDTO> popularReview(int rownum) throws Exception {
		return mybatis.selectList("board.popularReview", rownum);
	}
	
	// 인기 리뷰 태그 리스트수 추출
	@Override
	public int popularTagReviewCount(List<Integer> indexList) throws Exception {
		return mybatis.selectOne("board.popularTagReviewCount", indexList);
	}
	
	// 인기 여행 리뷰 태그 리스트
	@Override
	public List<BoardDTO> popularTagReview(List<Integer> indexList) throws Exception {
		return mybatis.selectList("board.popularTagReview", indexList);
	}

	// 키워드 입력하여 장소 검색결과 갯수
	@Override
	public int selectKeywordCount(String keyword) throws Exception {
		return mybatis.selectOne("info.selectKeywordCount", keyword);
	}

	// 키워드 입력하여 장소 검색결과
	@Override
	public List<PlaceDTO> selectKeywordPlaceNum(SearchDTO search) throws Exception {
		return mybatis.selectList("info.selectKeywordPlaceNum", search);
	}

	// 최근 등록된 장소 갯수
	@Override
	public int recentPlaceCount() throws Exception {
		return mybatis.selectOne("info.selectPlaceCount");
	}

	// 최근 등록된 장소 리스트 조회
	@Override
	public List<PlaceDTO> recentPlace(PlaceDTO place) throws Exception {
		return mybatis.selectList("info.selectPlace", place);
	}

}
