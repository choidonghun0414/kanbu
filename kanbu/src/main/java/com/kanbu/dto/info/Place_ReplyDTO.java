package com.kanbu.dto.info;

import java.sql.Timestamp;

/*
 * 	Place_ReplyDTO : 여행 정보 댓글DTO (Place_Reply Table)
 * 
 * 	index_num : 댓글 고유 번호
 *  place : 장소 번호
 *  name : 장소명
 *  writer : 작성자 번호
 *  nick : 닉네임
 *  content : 내용
 *  reg_date : 작성날짜
 *  startRow : 시작댓글(페이징처리)
 *  endRow : 마지막댓글(페이징처리)
 */

public class Place_ReplyDTO {
	
	private int index_num;
	private int place;
	private String name;
	private int writer;
	private String nick;
	private String content;
	private Timestamp reg_date;
	private int startRow;
	private int endRow;
	
	
	public int getIndex_num() {
		return index_num;
	}
	public void setIndex_num(int index_num) {
		this.index_num = index_num;
	}
	
	public int getPlace() {
		return place;
	}
	public void setPlace(int place) {
		this.place = place;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	

}
