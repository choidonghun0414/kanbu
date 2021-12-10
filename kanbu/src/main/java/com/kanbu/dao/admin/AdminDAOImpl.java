package com.kanbu.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.SearchDTO;
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


}
