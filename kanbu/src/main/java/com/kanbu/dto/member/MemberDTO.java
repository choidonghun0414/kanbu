package com.kanbu.dto.member;

import java.sql.Date;

public class MemberDTO {
	
	private int index_num;
	private String id;
	private String pw2;
	private String nick;
	private String phone;
	private String mail;
	private String domain;
	private int agree;
	private int privacy;
	private int status;
	private Date reg_date;
	private int startRow;
	private int endRow;
	
	
	public MemberDTO() {
	}

	
	public int getIndex_num() {
		return index_num;
	}

	
	public void setIndex_num(int index_num) {
		this.index_num = index_num;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getPw2() {
		return pw2;
	}




	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}




	public String getNick() {
		return nick;
	}




	public void setNick(String nick) {
		this.nick = nick;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getMail() {
		return mail;
	}




	public void setMail(String mail) {
		this.mail = mail;
	}




	public String getDomain() {
		return domain;
	}




	public void setDomain(String domain) {
		this.domain = domain;
	}




	public int getAgree() {
		return agree;
	}




	public void setAgree(int agree) {
		this.agree = agree;
	}




	public int getPrivacy() {
		return privacy;
	}




	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}




	public int getStatus() {
		return status;
	}




	public void setStatus(int status) {
		this.status = status;
	}




	public Date getReg_date() {
		return reg_date;
	}




	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	

	// 시작 회원(페이징 처리)
	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	// 마지막 회원(페이징 처리)
	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public MemberDTO(int index_num, String id, String pw2, String nick, String phone, String mail, String domain,
			int agree, int privacy, int status, Date reg_date) {
		super();
		this.index_num = index_num;
		this.id = id;
		this.pw2 = pw2;
		this.nick = nick;
		this.phone = phone;
		this.mail = mail;
		this.domain = domain;
		this.agree = agree;
		this.privacy = privacy;
		this.status = status;
		this.reg_date = reg_date;
	}




	@Override
	public String toString() {
		return "MemberDTO [index_num=" + index_num + ", id=" + id + ", pw2=" + pw2 + ", nick=" + nick + ", phone="
				+ phone + ", mail=" + mail + ", domain=" + domain + ", agree=" + agree + ", privacy=" + privacy
				+ ", status=" + status + ", reg_date=" + reg_date + "]";
	}

	
}
	