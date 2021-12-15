package com.kanbu.dao.member;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;

public interface MemberDAO {
	
	public int insertMember(MemberDTO member) throws Exception;
	
	public MemberDTO selectLogin(String id) throws Exception;		// 로그인 pw 확인

	public int idChk(MemberDTO member) throws Exception;
	
	public int idChkLogin(String id) throws Exception;	// 로그인 확인용
	
	public int pwChk(MemberDTO member) throws Exception;

	public int nickChk(MemberDTO member) throws Exception;
	
	public int mailChk(MemberDTO member) throws Exception; 
	
	public String selectId(MemberDTO member) throws Exception;
	
	public void updatePw(MemberDTO member) throws Exception;
	
	public int findPwChk(MemberDTO member) throws Exception;

	public void deleteMember(MemberDTO member) throws Exception;
	
	public MemberDTO deleteCheckPw(MemberDTO member) throws Exception;
	
	// 회원별 회원정보 조회하기
	public MemberDTO myInfo(int index_num) throws Exception;
	
	// 회원정보 변경하기
	public void myInfoUpdate(MemberDTO member) throws Exception;
	
	// 내가 쓴 리뷰 갯수
	public int myReviewCount(int writer) throws Exception;
	
	// 내가 쓴 리뷰 리스트
	public List<BoardDTO> myReview(BoardDTO board) throws Exception;
	
	// 내가 쓴 리뷰 태그 갯수
	public int myReviewTagCount(int writer) throws Exception;
	
	// 내가 쓴 리뷰 태그 리스트
	public List<BoardDTO> myReviewTag(int writer) throws Exception;
	
	// 내가 쓴 리뷰제목 검색 갯수
	public int searchTitleMyReviewCount(SearchDTO search) throws Exception;
	
	// 내가 쓴 리뷰제목 검색 결과 리스트
	public List<BoardDTO> searchTitleMyReview(SearchDTO search) throws Exception;
	
	// 내가 쓴 리뷰제목 검색 태그 갯수
	public int searchTitleMyReviewTagCount(SearchDTO search) throws Exception;
	
	// 내가 쓴 리뷰제목 검색 태그 결과 리스트
	public List<BoardDTO> searchTitleMyReviewTag(SearchDTO search) throws Exception;
	
	// 여행지 내가 쓴 댓글 갯수
	public int myPlaceReplyCount(int writer) throws Exception;
	
	// 여행지 내가 쓴 댓글 목록
	public List<Place_ReplyDTO> myPlaceReply(Place_ReplyDTO place_reply) throws Exception;
	
	// 여행지 내가 쓴 댓글 검색 갯수
	public int myPlaceReplySearchCount(SearchDTO search) throws Exception;
	
	// 여행지 내가 쓴 댓글 검색 결과
	public List<Place_ReplyDTO> myPlaceReplySearch(SearchDTO search) throws Exception;
	
	// 내가 쓴 리뷰 댓글수 검색
	public int myReviewReplyCount(int writer) throws Exception;
	
	// 내가 쓴 리뷰 댓글 목록
	public List<BoardDTO> myReviewReply(BoardDTO board) throws Exception;
	
	// 내가 쓴 리뷰댓글 입력 검색결과 수
	public int myReviewReplySearchCount(SearchDTO search) throws Exception;
	
	// 내가 쓴 리뷰댓글 입력 검색결과
	public List<BoardDTO> myReviewReplySearch(SearchDTO search) throws Exception;

}
