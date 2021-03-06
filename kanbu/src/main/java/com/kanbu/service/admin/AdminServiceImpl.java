package com.kanbu.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.admin.AdminDAO;
import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;
import com.kanbu.dto.plan.MyPlanDTO;

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
	
	// 여행지 등록하기
	@Override
	public void insertPlace(PlaceDTO place) throws Exception {
		adminDAO.insertPlace(place);
	}
	
	// 여행지 수정하기
	@Override
	public void updatePlace(PlaceDTO place) throws Exception {
		adminDAO.updatePlace(place);
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

	// 등록된 여행지 전체 댓글수 검색 
	@Override
	public int selectTotalPlaceReplyCount() throws Exception {
		return adminDAO.selectTotalPlaceReplyCount();
	}

	// 등록된 여행지 전체 댓글 검색
	@Override
	public List<Place_ReplyDTO> selectTotalPlaceReply(Place_ReplyDTO place_reply) throws Exception {
		return adminDAO.selectTotalPlaceReply(place_reply);
	}
	
	// 등록된 여행지 댓글 삭제(관리자)
	@Override
	public void placeReplyDeleteAdmin(int index_num) throws Exception {
		adminDAO.placeReplyDeleteAdmin(index_num);
	}

	// 등록된 여행지 댓글 입력 검색결과 갯수
	@Override
	public int selectKeywordPlaceReplyCount(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordPlaceReplyCount(search);
	}

	// 등록된 여행지 댓글 입력 검색
	@Override
	public List<Place_ReplyDTO> selectKeywordPlaceReply(SearchDTO search) throws Exception {
		return adminDAO.selectKeywordPlaceReply(search);
	}
	
	// 등록된 일정계획 전체 갯수 검색
	@Override
	public int selectPlanCount() throws Exception {
		return adminDAO.selectPlanCount();
	}

	// 등록된 일정계획 전체 검색
	@Override
	public List<MyPlanDTO> selectPlan(MyPlanDTO plan) throws Exception {
		return adminDAO.selectPlan(plan);
	}
	
	// 일정계획 검색 갯수(제목, 닉네임)
	@Override
	public int searchPlanCount(SearchDTO search) throws Exception {
		return adminDAO.searchPlanCount(search);
	}

	// 일정계획 검색 리스트(제목, 닉네임)
	@Override
	public List<MyPlanDTO> searchPlan(SearchDTO search) throws Exception {
		return adminDAO.searchPlan(search);
	}

	// 등록된 여행후기 전체 갯수 검색
	@Override
	public int selectReviewCount() throws Exception {
		return adminDAO.selectReviewCount();
	}

	// 등록된 여행후기 전체 검색
	@Override
	public List<BoardDTO> selectReview(BoardDTO board) throws Exception {
		return adminDAO.selectReview(board);
	}

	// 등록된 여행후기 태그 리스트 갯수
	@Override
	public int selectReviewTagCount() throws Exception {
		return adminDAO.selectReviewTagCount();
	}

	// 등록된 여행후기 태그 리스트
	@Override
	public List<BoardDTO> selectReviewTag() throws Exception {
		return adminDAO.selectReviewTag();
	}

	// 여행후기 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewCount(SearchDTO search) throws Exception {
		return adminDAO.searchReviewCount(search);
	}

	// 여행후기 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception {
		return adminDAO.searchReview(search);
	}

	// 여행후기 태그 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewTagCount(SearchDTO search) throws Exception {
		return adminDAO.searchReviewTagCount(search);
	}

	// 여행후기 태그 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception {
		return adminDAO.searchReviewTag(search);
	}

	// 등록된 리뷰 전체 댓글수 검색
	@Override
	public int selectTotalReviewReplyCount() throws Exception {
		return adminDAO.selectTotalReviewReplyCount();
	}

	// 등록된 리뷰 전체 댓글 검색
	@Override
	public List<BoardDTO> selectTotalReviewReply(BoardDTO board) throws Exception {
		return adminDAO.selectTotalReviewReply(board);
	}

	// 등록된 리뷰 댓글 삭제(관리자)
	@Override
	public void reviewReplyDeleteAdmin(int index_num) throws Exception {
		adminDAO.reviewReplyDeleteAdmin(index_num);
	}



}
