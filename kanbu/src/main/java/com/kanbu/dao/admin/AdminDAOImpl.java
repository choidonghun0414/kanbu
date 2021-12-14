package com.kanbu.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSessionTemplate mybatis;
	
	// 전체회원수 검색
	@Override
	public int selectTotalMemberCount() throws Exception {
		return mybatis.selectOne("admin.selectTotalMemberCount");
	}

	// 전체회원 정보 검색
	@Override
	public List<MemberDTO> selectTotalMember(MemberDTO member) throws Exception {
		return mybatis.selectList("admin.selectTotalMember", member);
	}
	
	// 여행지 등록하기
	@Override
	public void insertPlace(PlaceDTO place) throws Exception {
		mybatis.insert("admin.insertPlace", place);
	}
	
	// 등록된 장소 전체 갯수 검색
	@Override
	public int selectTotalPlaceCount() throws Exception {
		return mybatis.selectOne("admin.selectTotalPlaceCount");
	}

	// 등록된 장소 전체 정보 검색
	@Override
	public List<PlaceDTO> selectTotalPlace(PlaceDTO place) throws Exception {
		return mybatis.selectList("admin.selectTotalPlace", place);
	}
	
	// 관리자 회원 입력 검색결과 갯수
	@Override
	public int selectKeywordMemberCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("admin.selectKeywordMemberCount", search);
	}

	// 관리자 회원 입력 검색
	@Override
	public List<MemberDTO> selectKeywordMember(SearchDTO search) throws Exception {
		return mybatis.selectList("admin.selectKeywordMember", search);
	}

	// 관리자 장소 입력 검색결과 갯수
	@Override
	public int selectKeywordPlaceCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("admin.selectKeywordPlaceCount", search);
	}

	// 관리자 장소 입력 검색
	@Override
	public List<PlaceDTO> selectKeywordPlace(SearchDTO search) throws Exception {
		return mybatis.selectList("admin.selectKeywordPlace", search);
	}

	// 등록된 여행지 전체 댓글수 검색 
	@Override
	public int selectTotalPlaceReplyCount() throws Exception {
		return mybatis.selectOne("admin.selectTotalPlaceReplyCount");
	}

	// 등록된 여행지 전체 댓글 검색
	@Override
	public List<Place_ReplyDTO> selectTotalPlaceReply(Place_ReplyDTO place_reply) throws Exception {
		return mybatis.selectList("admin.selectTotalPlaceReply", place_reply);
	}

	// 등록된 여행지 댓글 입력 검색결과 갯수
	@Override
	public int selectKeywordPlaceReplyCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("admin.selectKeywordPlaceReplyCount", search);
	}

	// 등록된 여행지 댓글 입력 검색
	@Override
	public List<Place_ReplyDTO> selectKeywordPlaceReply(SearchDTO search) throws Exception {
		return mybatis.selectList("admin.selectKeywordPlaceReply", search);
	}

	// 등록된 여행후기 전체 갯수 검색
	@Override
	public int selectReviewCount() throws Exception {
		return mybatis.selectOne("admin.selectReviewCount");
	}

	// 등록된 여행후기 전체 검색
	@Override
	public List<BoardDTO> selectReview(BoardDTO board) throws Exception {
		return mybatis.selectList("admin.selectReview", board);
	}

	// 등록된 여행후기 태그 리스트 갯수
	@Override
	public int selectReviewTagCount() throws Exception {
		return mybatis.selectOne("admin.selectReviewTagCount");
	}

	// 등록된 여행후기 태그 리스트
	@Override
	public List<BoardDTO> selectReviewTag() throws Exception {
		return mybatis.selectList("admin.selectReviewTag");
	}

	// 여행후기 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("admin.searchReviewCount", search);
	}

	// 여행후기 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception {
		return mybatis.selectList("admin.searchReview", search);
	}

	// 여행후기 태그 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewTagCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("admin.searchReviewTagCount", search);
	}

	// 여행후기 태그 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception {
		return mybatis.selectList("admin.searchReviewTag", search);
	}


}
