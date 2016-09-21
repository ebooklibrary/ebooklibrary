package com.ebooklibrary.app.cash.model;

import java.sql.Timestamp;

public class CashVO {
	
	private int cashChargNo; // 캐시충전테이블 번호
	private String impUid; //고유id
	private String merchantUid;//상점거래id
	private String userid;//구매자 id
	private String paidAmount;//결제금액
	private String applyNum;//카드승인번호
	private Timestamp sysDate;//구매날짜
	
	public int getCashChargNo() {
		return cashChargNo;
	}
	public void setCashChargNo(int cashChargNo) {
		this.cashChargNo = cashChargNo;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}
	public Timestamp getSysDate() {
		return sysDate;
	}
	public void setSysDate(Timestamp sysDate) {
		this.sysDate = sysDate;
	}
	@Override
	public String toString() {
		return "CashVO [cashChargNo=" + cashChargNo + ", impUid=" + impUid + ", merchantUid=" + merchantUid
				+ ", userid=" + userid + ", paidAmount=" + paidAmount + ", applyNum=" + applyNum + ", sysDate="
				+ sysDate + "]";
	}
	
	
}
