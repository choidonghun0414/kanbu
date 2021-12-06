package com.kanbu.dto;

/*
 * 	SearchDTO(검색DTO)
 * 
 * 	thema : 검색 테마
 *  keyword : 검색어
 *  startRow : 처음검색결과(페이징처리)
 *  endRow : 마지막검색결과(페이징처리)
 */

public class SearchDTO {
	
	private String thema;
	private String keyword;
	private int startRow;
	private int endRow;
	
	public String getThema() {
		return thema;
	}
	public void setThema(String thema) {
		this.thema = thema;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
