package com.ebooklibrary.app.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNo;  /* 회원번호 */
	private String userId;	/* 아이디 */
	private String userName;  /* 이름 */
	private String pwd;  /* 비밀번호 */
	private String hp1;  /* 전화번호 */
	private String hp2;  /* 전화번호 */
	private String hp3;  /* 전화번호 */
	private String birth;  /* 생년월일 */
	private String gender;  /* 성별 */
	private Timestamp regDate;  /* 가입일 */
	private Timestamp outDate;  /* 탈퇴일 */
	private String authCode;  /* 권한코드 */
	private int cash; /* 북코인 */
	private String bgImage; /* 회원전용 배경 */
	private String confrimEmail; /* 이메일인증 */
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
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
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getOutDate() {
		return outDate;
	}
	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
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
	public String getBgImage() {
		return bgImage;
	}
	public void setBgImage(String bgImage) {
		this.bgImage = bgImage;
	}
	public String getConfrimEmail() {
		return confrimEmail;
	}
	public void setConfrimEmail(String confrimEmail) {
		this.confrimEmail = confrimEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", userId=" + userId + ", userName=" + userName + ", pwd=" + pwd
				+ ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", birth=" + birth + ", gender=" + gender
				+ ", regDate=" + regDate + ", outDate=" + outDate + ", authCode=" + authCode + ", cash=" + cash
				+ ", bgImage=" + bgImage + ", confrimEmail=" + confrimEmail + "]";
	}
	
	
	
	
}
