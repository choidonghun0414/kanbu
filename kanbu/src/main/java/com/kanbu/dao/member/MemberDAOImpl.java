package com.kanbu.dao.member;

import java.util.HashMap;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.member.MemberDTO;
import com.sun.javafx.collections.MappingChange.Map;

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




	
	
	
	
	
	
}
