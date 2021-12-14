package com.kanbu.dao.member;


import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	 SqlSessionTemplate mybatis;
	
	@Override
	public int insertMember(MemberDTO member) throws Exception {
		return mybatis.insert("member.insertMember", member);
	}

	// 로그인 pw 확인
	@Override
	public MemberDTO selectLogin(String id) throws Exception {
		return mybatis.selectOne("member.selectLogin", id);
		
	}

	@Override
	public int idChk(MemberDTO member) throws Exception {
		return mybatis.selectOne("member.idChk", member);
	}

	@Override
	public int pwChk(MemberDTO member) throws Exception {
		return mybatis.selectOne("member.pwChk", member);
	}

	@Override
	public int nickChk(MemberDTO member) throws Exception {
		return mybatis.selectOne("member.nickChk", member);
	}

	// 로그인 아이디 확인용
	@Override
	public int idChkLogin(String id) throws Exception {
		return mybatis.selectOne("member.idChkLogin", id);
	}

	@Override
	public String selectId(MemberDTO member) throws Exception {
		return mybatis.selectOne("member.selectId", member);
		
	}

	@Override
	public void updatePw(MemberDTO member) throws Exception {
//		String password = member.getPw2();
//		member.setPw2(password); 
		mybatis.update("member.updatePw", member);
	}

	@Override
	public int findPwChk(MemberDTO member) throws Exception {
		return mybatis.selectOne("member.findPwChk", member);
	}

	@Override
	public int mailChk(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("member.mailChk", member);
	}

	@Override
	public void deleteMember(MemberDTO member) throws Exception {
		mybatis.delete("member.deleteMember", member);
	}

	@Override
	public MemberDTO deleteCheckPw(MemberDTO member) throws Exception {

		return mybatis.selectOne("member.deleteCheckPw",member);
		
	}

	// 회원별 회원정보 조회하기
	@Override
	public MemberDTO myInfo(int index_num) throws Exception {
		return mybatis.selectOne("member.myInfo", index_num);
	}
	
	// 회원정보 변경하기
	@Override
	public void myInfoUpdate(MemberDTO member) throws Exception {
		mybatis.update("member.myInfoUpdate", member);
	}
	
	// 내가 쓴 리뷰 갯수
	@Override
	public int myReviewCount(int writer) throws Exception {
		return mybatis.selectOne("board.selectMyReviewCount", writer);
	}
	
	// 내가 쓴 리뷰 리스트
	@Override
	public List<BoardDTO> myReview(BoardDTO board) throws Exception {
		return mybatis.selectList("board.selectMyReview", board);
	}
	
	// 내가 쓴 리뷰 태그 갯수
	@Override
	public int myReviewTagCount(int writer) throws Exception {
		return mybatis.selectOne("board.selectMyReviewTagCount", writer);
	}

	// 내가 쓴 리뷰 태그 리스트
	@Override
	public List<BoardDTO> myReviewTag(int writer) throws Exception {
		return mybatis.selectList("board.selectMyReviewTag", writer);
	}
	
	// 내가 쓴 리뷰제목 검색 갯수
	@Override
	public int searchTitleMyReviewCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("board.searchTitleMyReviewCount", search);
	}
	
	// 내가 쓴 리뷰제목 검색 결과 리스트
	@Override
	public List<BoardDTO> searchTitleMyReview(SearchDTO search) throws Exception {
		return mybatis.selectList("board.searchTitleMyReview", search);
	}

	// 내가 쓴 리뷰제목 검색 태그 갯수
	@Override
	public int searchTitleMyReviewTagCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("board.searchTitleMyReviewTagCount", search);
	}

	// 내가 쓴 리뷰제목 검색 태그 결과 리스트
	@Override
	public List<BoardDTO> searchTitleMyReviewTag(SearchDTO search) throws Exception {
		return mybatis.selectList("board.searchTitleMyReviewTag", search);
	}
	
	// 내가 쓴 리뷰 태그검색 리스트 갯수
//	@Override
//	public int searchTagMyReviewCount(SearchDTO search) throws Exception {
//		return mybatis.selectOne("board.searchTagMyReviewCount", search);
//	}
	
	// 내가 쓴 리뷰번호 태그검색 리스트
//	@Override
//	public List<SearchDTO> searchTagMyReviewNum(SearchDTO search) throws Exception {
//		return mybatis.selectList("board.searchTagMyReviewNum", search);
//	}
	
	// 내가 쓴 리뷰 태그검색 리스트
//	@Override
//	public List<BoardDTO> searchTagMyReview(List<SearchDTO> myReviewNumList) throws Exception {
//		return mybatis.selectList("board.searchTagMyReview", myReviewNumList);
//	}
	
	// 내가 쓴 여행지 댓글 갯수
	@Override
	public int myPlaceReplyCount(int writer) throws Exception {
		return mybatis.selectOne("info.myPlaceReplyCount", writer);
	}

	// 내가 쓴 여행지 댓글 목록
	@Override
	public List<Place_ReplyDTO> myPlaceReply(Place_ReplyDTO place_reply) throws Exception {
		return mybatis.selectList("info.myPlaceReply", place_reply);
	}

	// 여행지 내가 쓴 댓글 검색 갯수
	@Override
	public int myPlaceReplySearchCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("info.myPlaceReplySearchCount", search);
	}

	// 여행지 내가 쓴 댓글 검색 결과
	@Override
	public List<Place_ReplyDTO> myPlaceReplySearch(SearchDTO search) throws Exception {
		return mybatis.selectList("info.myPlaceReplySearch", search);
	}





}
