package com.kanbu.dao.member;



import com.kanbu.dto.member.MemberDTO;

public interface MemberDAO {
	
	public int insertMember(MemberDTO member) throws Exception;
	
	public MemberDTO selectLogin(String id) throws Exception;		// 로그인 pw 확인

	public int idChk(MemberDTO member) throws Exception;
	
	public int idChkLogin(String id) throws Exception;	// 로그인 확인용
	
	public int pwChk(MemberDTO member) throws Exception;

	public int nickChk(MemberDTO member) throws Exception;
	
}
