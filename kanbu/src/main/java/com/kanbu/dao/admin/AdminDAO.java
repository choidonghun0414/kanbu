package com.kanbu.dao.admin;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;

public interface AdminDAO {
	
	// 전체회원수 검색 
	public int selectTotalMemberCount() throws Exception;

	// 전체회원 정보 검색
	public List<MemberDTO> selectTotalMember(MemberDTO member) throws Exception;
	
	// 여행지 등록하기
	public void insertPlace(PlaceDTO place) throws Exception;
	
	// 여행지 수정하기
	public void updatePlace(PlaceDTO place) throws Exception;
	
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
	
	// 등록된 여행지 전체 댓글수 검색 
	public int selectTotalPlaceReplyCount() throws Exception;
	
	// 등록된 여행지 전체 댓글 검색
	public List<Place_ReplyDTO> selectTotalPlaceReply(Place_ReplyDTO place_reply) throws Exception;
	
	// 등록된 여행지 댓글 삭제(관리자)
	public void placeReplyDeleteAdmin(int index_num) throws Exception;
	
	// 등록된 여행지 댓글 입력 검색결과 갯수
	public int selectKeywordPlaceReplyCount(SearchDTO search) throws Exception;
	
	// 등록된 여행지 댓글 입력 검색
	public List<Place_ReplyDTO> selectKeywordPlaceReply(SearchDTO search) throws Exception;
	
	// 등록된 여행후기 전체 갯수 검색
	public int selectReviewCount() throws Exception;
	
	// 등록된 여행후기 전체 검색
	public List<BoardDTO> selectReview(BoardDTO board) throws Exception;
	
	// 등록된 여행후기 태그 리스트 갯수
	public int selectReviewTagCount() throws Exception;
	
	// 등록된 여행후기 태그 리스트
	public List<BoardDTO> selectReviewTag() throws Exception;
	
	// 여행후기 검색 갯수(제목, 닉네임)
	public int searchReviewCount(SearchDTO search) throws Exception;

	// 여행후기 검색 리스트(제목, 닉네임)
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception;
	
	// 여행후기 태그 검색 갯수(제목, 닉네임)
	public int searchReviewTagCount(SearchDTO search) throws Exception;
	
	// 여행후기 태그 검색 리스트(제목, 닉네임)
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception;
	
}
