package com.medical.domain;

public class SidoVO {
	// 멤버변수
	private int code;
	private String palce;
	
	
	public SidoVO() {}
	
	public SidoVO(int code, String palce) {
		super();
		this.code = code;
		this.palce = palce;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getPalce() {
		return palce;
	}
	public void setPalce(String palce) {
		this.palce = palce;
	}
	
	@Override
	public String toString() {
		return "SidoVO [code=" + code + ", palce=" + palce + "]";
	}
	
	

}
