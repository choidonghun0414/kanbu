package com.kanbu.service.member;

import com.kanbu.dto.member.MemberDTO;

public interface MemberService {

	// memberDTO를 받아 testkanbu 테이블에 회원가입 추가한다.
	public void insertMember(MemberDTO member) throws Exception;
}
