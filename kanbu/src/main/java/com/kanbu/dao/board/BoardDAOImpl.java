package com.kanbu.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.SearchDTO;
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
	
	// 해당 공지사항 조회수 증가
	@Override
	public void updateViewsNotice(int index_num) throws Exception {
		mybatis.update("board.updateViewsNotice", index_num);
	}
	
	// 해당 리뷰 조회수 증가
	@Override
	public void updateViewsReview(int index_num) throws Exception {
		mybatis.update("board.updateViewsReview", index_num);
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
	
	// 새로 들어온 리뷰번호 가져오기
	@Override
	public int maxReview() throws Exception {
		return mybatis.selectOne("board.maxReview");
	}
	
	// 새로 들어온 리뷰 태그 추가
	@Override
	public void insertTag(List<BoardDTO> tagList) throws Exception {
		mybatis.insert("board.insertTag", tagList);
	}

	//리뷰 수정
	@Override
	public void reviewUpdate(BoardDTO board) throws Exception {
		mybatis.update("board.reviewUpdate", board);
	}
	
	//수정 시 기존 태그 삭제
	@Override
	public void deleteTag(int review) throws Exception {
		mybatis.delete("board.deleteTag", review);
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(int index_num) throws Exception {
		mybatis.delete("board.reviewDelete", index_num);
	}
	
	//리뷰 삭제시 댓글 강제 삭제
	@Override
	public void deleteReply(int review) throws Exception {
		mybatis.delete("board.deleteReply", review);
	}

	//태그 목록
	@Override
	public List selectTag() throws Exception {
		return mybatis.selectList("board.selectTag");
		
	}

	//댓글 갯수
	@Override
	public int selectReviewReplyCount(int index_num) throws Exception {
		return mybatis.selectOne("board.selectReviewReplyCount", index_num);
	}

	//댓글 목록
	@Override
	public List<BoardDTO> selectReviewReply(BoardDTO board) throws Exception {
		return mybatis.selectList("board.selectReviewReply", board);
	}

	// 해당 장소정보 댓글 등록
	@Override
	public void insertReviewReply(BoardDTO board) throws Exception {
		mybatis.insert("board.insertReviewReply", board);
	}
	
	//댓글 삭제
	@Override
	public void deleteReviewReply(int index_num) throws Exception {
		mybatis.delete("board.deleteReviewReply", index_num);
	}

	//수정 태그 목록 갯수
	@Override
	public int countReviewUpdateTag(int review) throws Exception {
		return mybatis.selectOne("board.countReviewUpdateTag", review);
	}
	
	//수정시 태그 목록
	@Override
	public List selectreviewUpdateTag(int review) throws Exception {
		return mybatis.selectList("board.selectreviewUpdateTag", review);
	}

	// 여행후기 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("board.searchReviewCount", search);
	}

	// 여행후기 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception {
		return mybatis.selectList("board.searchReview", search);
	}

	// 여행후기 태그 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewTagCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("board.searchReviewTagCount", search);
	}

	// 여행후기 태그 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception {
		return mybatis.selectList("board.searchReviewTag", search);
	}

	//공지 검색 갯수
	@Override
	public int searchNoticeCount(SearchDTO search) throws Exception {
		return mybatis.selectOne("board.searchNoticeCount", search);
	}

	//공지 검색
	@Override
	public List<BoardDTO> searchNotice(SearchDTO search) throws Exception {
		return mybatis.selectList("board.searchNotice", search);
	}
	

}
