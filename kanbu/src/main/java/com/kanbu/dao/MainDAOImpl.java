package com.kanbu.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.info.PlaceDTO;

@Repository
public class MainDAOImpl implements MainDAO{

	@Inject
	private SqlSessionTemplate mybatis;
	
	// 키워드 입력하여 장소 검색결과 갯수
	@Override
	public int selectKeywordCount(String keyword) throws Exception {
		return mybatis.selectOne("info.selectKeywordCount", keyword);
	}

	// 키워드 입력하여 장소 검색결과
	@Override
	public List<PlaceDTO> selectKeywordPlaceNum(String keyword) throws Exception {
		return mybatis.selectList("info.selectKeywordPlaceNum", keyword);
	}

}
