package com.kanbu.dao.member;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	

	
}
