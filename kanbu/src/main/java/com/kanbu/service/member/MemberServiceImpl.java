package com.kanbu.service.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.member.MemberDAO;
import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDAO dao;
	
	// memberDTO를 받아 testkanbu 테이블에 회원가입 추가한다.
	@Override
	public void insertMember(MemberDTO member) throws Exception {
		dao.insertMember(member);
	}

	@Override
	public MemberDTO selectLogin(String id) throws Exception {
		return dao.selectLogin(id);
	}

	@Override
	public int idChk(MemberDTO member) throws Exception {
		int result = dao.idChk(member);
		return result;
	}

	@Override
	public int pwChk(MemberDTO member) throws Exception {
		int result = dao.pwChk(member);
		return result;
	}

	@Override
	public int nickChk(MemberDTO member) throws Exception {
		int result = dao.nickChk(member);
		return result;
		
	}

	// 로그인 아이디 확인용
	@Override
	public int idChkLogin(String id) throws Exception {
		return dao.idChkLogin(id);
	}

	@Override
	public String selectId(MemberDTO member) throws Exception {
		return dao.selectId(member);
	}

	@Override
	public void updatePw(MemberDTO member) throws Exception {
		 dao.updatePw(member);
	}

	@Override
	public int findPwChk(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return dao.findPwChk(member);
	}

	@Override
	public int mailChk(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return dao.mailChk(member);
	}

	@Override
	public void deleteMember(MemberDTO member) throws Exception {

		dao.deleteMember(member);
	}

	@Override
	public MemberDTO deleteCheckPw(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteCheckPw(member);
	}

	// 회원별 회원정보 조회하기
	@Override
	public MemberDTO myInfo(int index_num) throws Exception {
		return dao.myInfo(index_num);
	}

	// 회원정보 변경하기
	@Override
	public void myInfoUpdate(MemberDTO member) throws Exception {
		dao.myInfoUpdate(member);
	}

	// 내가 쓴 여행지 댓글 갯수
	@Override
	public int myPlaceReplyCount(int writer) throws Exception {
		return dao.myPlaceReplyCount(writer);
	}

	// 내가 쓴 여행지 댓글 목록
	@Override
	public List<Place_ReplyDTO> myPlaceReply(Place_ReplyDTO place_reply) throws Exception {
		return dao.myPlaceReply(place_reply);
	}

	// 여행지 내가 쓴 댓글 검색 갯수
	@Override
	public int myPlaceReplySearchCount(SearchDTO search) throws Exception {
		return dao.myPlaceReplySearchCount(search);
	}

	// 여행지 내가 쓴 댓글 검색 결과
	@Override
	public List<Place_ReplyDTO> myPlaceReplySearch(SearchDTO search) throws Exception {
		return dao.myPlaceReplySearch(search);
	}

}
