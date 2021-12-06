package com.kanbu.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.admin.AdminDAO;
import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.member.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	AdminDAO adminDAO;
	
	// 전체회원수 검색
	@Override
	public int selectTotalMemberCount() throws Exception {
		return adminDAO.selectTotalMemberCount();
	}

	// 전체회원 정보 검색
	@Override
	public List<MemberDTO> selectTotalMember(MemberDTO member) throws Exception {
		return adminDAO.selectTotalMember(member);
	}

	// 등록된 장소 전체 갯수 검색
	@Override
	public int selectTotalPlaceCount() throws Exception {
		return adminDAO.selectTotalPlaceCount();
	}

	// 등록된 장소 전체 정보 검색
	@Override
	public List<PlaceDTO> selectTotalPlace(PlaceDTO place) throws Exception {
		return adminDAO.selectTotalPlace(place);
	}
	
	// 관리자 회원 입력 검색결과 갯수
	@Override
	public int selectKeywordMemberCount(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordMemberCount(search);
	}

	// 관리자 회원 입력 검색
	@Override
	public List<MemberDTO> selectKeywordMember(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordMember(search);
	}

	// 관리자 장소 입력 검색결과 갯수
	@Override
	public int selectKeywordPlaceCount(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordPlaceCount(search);
	}

	// 관리자 장소 입력 검색
	@Override
	public List<PlaceDTO> selectKeywordPlace(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordPlace(search);
	}




}