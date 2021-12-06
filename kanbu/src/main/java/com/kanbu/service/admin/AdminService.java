package com.kanbu.service.admin;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.member.MemberDTO;


public interface AdminService {
	
	// 전체회원수 검색 
	public int selectTotalMemberCount() throws Exception;
	
	// 전체회원 정보 검색
	public List<MemberDTO> selectTotalMember(MemberDTO member) throws Exception;
	
	// 등록된 장소 전체 갯수 검색
	public int selectTotalPlaceCount() throws Exception;
	
	// 등록된 장소 전체 정보 검색
	public List<PlaceDTO> selectTotalPlace(PlaceDTO place) throws Exception;
	
	// 관리자 회원 입력 검색결과 갯수
	public int selectKeywordMemberCount(SearchDTO search) throws Exception;
	
	// 관리자 회원 입력 검색
	public List<MemberDTO> selectKeywordMember(SearchDTO search) throws Exception;
	
	// 관리자 장소 입력 검색결과 갯수
	public int selectKeywordPlaceCount(SearchDTO search) throws Exception;
	
	// 관리자 장소 입력 검색
	public List<PlaceDTO> selectKeywordPlace(SearchDTO search) throws Exception;
}
