package com.jongik.daemyeong.dto;

public class article {
	private int article_no;
	private String article_name;
	private String regtime;
	private String article_detail;
	
	public article() {
		
	}

	public article(int article_no, String article_name, String regtime, String article_detail) {
	
		this.article_no = article_no;
		this.article_name = article_name;
		this.regtime = regtime;
		this.article_detail = article_detail;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getArticle_name() {
		return article_name;
	}

	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public String getArticle_detail() {
		return article_detail;
	}

	public void setArticle_detail(String article_detail) {
		this.article_detail = article_detail;
	}

	@Override
	public String toString() {
		return "article [article_no=" + article_no + ", article_name=" + article_name + ", regtime=" + regtime
				+ ", article_detail=" + article_detail + "]";
	}
	
}
