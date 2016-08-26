package com.ebooklibrary.app.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNo;  /* 회원번호 */
	private String username;  /* 아이디 */
	private String pwd;  /* 비밀번호 */
	private String email1;  /* 이메일 */
	private String email2;  /* 이메일 */
	private String tel1;  /* 전화번호 */
	private String tel2;  /* 전화번호 */
	private String tel3;  /* 전화번호 */
	private String birth;  /* 생년월일 */
	private String gender;  /* 성별 */
	private Timestamp regdate;  /* 가입일 */
	private Timestamp leavedate;  /* 탈퇴일 */
	private String authCode;  /* 권한코드 */
	private int cash; /* 북코인 */
	
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(Timestamp leavedate) {
		this.leavedate = leavedate;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	
	
	
	
}
