package com.kanbu.service.member;

import com.kanbu.dto.member.MemberDTO;
import com.kanbu.exception.LoginFailedException;

public interface MemberService {

	// memberDTO를 받아. testkanbu 테이블에 회원가입 추가한다.
	public void insertMember(MemberDTO member) throws Exception;
	
	public MemberDTO selectLogin(String id) throws Exception;
	
	public int idChk(MemberDTO member) throws Exception;
	
	public int pwChk(MemberDTO member) throws Exception;
	
	public int nickChk(MemberDTO member) throws Exception;
	
	public int idChkLogin(String id) throws Exception;	// 로그인 확인용
}
