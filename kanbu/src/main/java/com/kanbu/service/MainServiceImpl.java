package com.kanbu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.MainDAO;
import com.kanbu.dto.info.PlaceDTO;

@Service
public class MainServiceImpl implements MainService{
	
	@Inject
	MainDAO mainDAO;

	// 키워드 입력하여 장소 검색결과 갯수
	@Override
	public int selectKeywordCount(String keyword) throws Exception {
		return mainDAO.selectKeywordCount(keyword);
	}

	// 키워드 입력하여 장소 검색결과
	@Override
	public List<PlaceDTO> selectKeywordPlaceNum(String keyword) throws Exception {
		return mainDAO.selectKeywordPlaceNum(keyword);
	}
	



}
