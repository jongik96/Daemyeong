package com.jongik.daemyeong.dto;

public class PlayerDto {

	private String pname;
	private int age;
	private int height;
	private String position;
	private int backnum;
	
	public PlayerDto() {
		
	}

	public PlayerDto(String pname, int age, int height, String position, int backnum) {
		this.pname = pname;
		this.age = age;
		this.height = height;
		this.position = position;
		this.backnum = backnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getBacknum() {
		return backnum;
	}

	public void setBacknum(int backnum) {
		this.backnum = backnum;
	}

	@Override
	public String toString() {
		return "player [pname=" + pname + ", age=" + age + ", height=" + height + ", position=" + position
				+ ", backnum=" + backnum + "]";
	}
	
	
	
}
