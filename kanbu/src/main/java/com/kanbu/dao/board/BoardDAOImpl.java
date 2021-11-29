package com.kanbu.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.board.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSessionTemplate mybatis;
	
	// 공지등록
	@Override
	public void insertBoard(BoardDTO board) throws Exception {
		mybatis.insert("board.insertBoard", board);
	}

	@Override
	public List selectNotice(int writer) throws Exception {
		return mybatis.selectList("board.selectNotice", writer);
	}

	// 관리자 고유번호 검색
	@Override
	public int selectAdmin() throws Exception {
		return mybatis.selectOne("board.selectAdmin");
	}

	// 공지 세부내용
	@Override
	public BoardDTO selectNoticeDetail(int index_num) throws Exception {
		return mybatis.selectOne("board.selectNoticeDetail", index_num);
	}

	//공지 수정
	@Override
	public void noticeUpdate(BoardDTO board) throws Exception {
		mybatis.update("board.noticeUpdate", board);
		
	}

	//공지 삭제
	@Override
	public void noticeDelete(int index_num) throws Exception {
		mybatis.delete("board.noticeDelete", index_num);
		
	}
	

}
