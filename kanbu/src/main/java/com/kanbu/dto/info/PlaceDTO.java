package com.kanbu.dto.info;

/*
 * 	index_num : 장소 고유 번호
 * 	name : 장소 이름
 * 	addr : 주소
 * 	latitude : 위도
 * 	longitude : 경도
 * 	info : 장소 설명
 * 	tel : 전화번호
 * 	holiday : 휴일
 * 	parking : 주차 가능 여부(1-가능, 0-불가능)
 * 	fee1 : 어른 요금
 * 	fee2 : 아이 요금
 * 	opening : 오픈 시간
 * 	closing : 마감 시간
 * 	picture1 : 장소 사진1
 * 	picture2 : 장소 사진2
 * 	picture3 : 장소 사진3
 * 	picture4 : 장소 사진4
 * 	picture5 : 장소 사진5
 * 	views : 조회수
 *  good : 좋아요수
 *  startRow : 시작장소(페이징처리)
 *  endRow : 마지막장소(페이징처리)
 * 
 */

public class PlaceDTO {
	
	private int index_num;
	private String name;
	private String addr;
	private double latitude;
	private double longitude;
	private String info;
	private String tel;
	private String holiday;
	private int parking;
	private int fee1;
	private int fee2;
	private int opening;
	private int closing;
	private String picture1;
	private String picture2;
	private String picture3;
	private String picture4;
	private String picture5;
	private int views;
	private int good;
	private int startRow;
	private int endRow;
	
	
	public int getIndex_num() {
		return index_num;
	}
	public void setIndex_num(int index_num) {
		this.index_num = index_num;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	
	public int getFee1() {
		return fee1;
	}
	public void setFee1(int fee1) {
		this.fee1 = fee1;
	}
	
	public int getFee2() {
		return fee2;
	}
	public void setFee2(int fee2) {
		this.fee2 = fee2;
	}
	
	public int getOpening() {
		return opening;
	}
	public void setOpening(int opening) {
		this.opening = opening;
	}
	
	public int getClosing() {
		return closing;
	}
	public void setClosing(int closing) {
		this.closing = closing;
	}
	
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	
	public String getPicture4() {
		return picture4;
	}
	public void setPicture4(String picture4) {
		this.picture4 = picture4;
	}
	
	public String getPicture5() {
		return picture5;
	}
	public void setPicture5(String picture5) {
		this.picture5 = picture5;
	}
	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
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
