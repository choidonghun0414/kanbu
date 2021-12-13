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
	
	// 공지 목록 갯수
	@Override
	public int selectNoticeCount() throws Exception {
		return mybatis.selectOne("board.selectNoticeCount");
	}

	//공지 목록
	@Override
	public List<BoardDTO> selectNotice(BoardDTO board) throws Exception {
		return mybatis.selectList("board.selectNotice", board);
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
	
	//리뷰 목록 갯수 
	@Override
	public int selectReviewCount() throws Exception {
		return mybatis.selectOne("board.selectReviewCount");
	}

	//리뷰 목록
	@Override
	public List selectReview(BoardDTO board) throws Exception {
		return mybatis.selectList("board.selectReview", board);
	}
	
	//여행 리뷰 태그 리스트 갯수
	@Override
	public int selectReviewTagCount() throws Exception {
		return mybatis.selectOne("board.selectReviewTagCount");
	}

	//여행 리뷰 태그 리스트
	@Override
	public List selectReviewTag() throws Exception {
		return mybatis.selectList("board.selectReviewTag");
	}

	//리뷰 상세 내용
	@Override
	public BoardDTO selectReviewDetail(int index_num) throws Exception {
		return mybatis.selectOne("board.selectReviewDetail", index_num);
	}
	
	//리뷰 상세 태그
	@Override
	public List selectReviewDetailTag(int index_num) throws Exception {
		return mybatis.selectList("board.selectReviewDetailTag", index_num);
	}

	@Override
	public List selectMember() throws Exception {
		return mybatis.selectList("board.selectMember");
	}

	//리뷰 작성
	@Override
	public void insertReview(BoardDTO board) throws Exception {
		mybatis.insert("board.insertReview", board);
		
	}


	//리뷰 수정
	@Override
	public void reviewUpdate(BoardDTO board) throws Exception {
		mybatis.update("board.reviewUpdate", board);
	}








	
	

}
