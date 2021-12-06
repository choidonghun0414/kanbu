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
	
	// 회원별 회원정보 조회하기
	public MemberDTO myInfo(int index_num) throws Exception;
	
	// 회원정보 변경하기
	public void myInfoUpdate(MemberDTO member) throws Exception;
}
