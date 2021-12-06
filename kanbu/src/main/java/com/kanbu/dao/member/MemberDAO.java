package com.kanbu.dao.member;



import com.kanbu.dto.member.MemberDTO;

public interface MemberDAO {
	
	public int insertMember(MemberDTO member) throws Exception;
	
	public MemberDTO selectLogin(String id) throws Exception;		// 로그인 pw 확인

	public int idChk(MemberDTO member) throws Exception;
	
	public int idChkLogin(String id) throws Exception;	// 로그인 확인용
	
	public int pwChk(MemberDTO member) throws Exception;

	public int nickChk(MemberDTO member) throws Exception;
	
	// 회원별 회원정보 조회하기
	public MemberDTO myInfo(int index_num) throws Exception;
	
	// 회원정보 변경하기
	public void myInfoUpdate(MemberDTO member) throws Exception;
	
	
	
}
