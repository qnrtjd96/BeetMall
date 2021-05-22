package com.beetmall.sshj.admin.vo;

public class AdminReviewVO {
//	d.reviewnum, d.reviewcontent, d.reviewanswer, d.userid as reviewwriter, d.reviewwritedate, c.productname, c.mcatename, c.userid seller 
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 이부분은 content부분을 잘라주어야 하기 때문에 페이지 목록 조회부분에서만 써야한다.
	 */
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	private int reviewnum; //번호
	private String reviewcontent; //컨텐츠부분인데 이건 잘라줘야함
	private String reviewanswer; //답변상태이걸로확인하자
	private String reviewwriter; //리뷰쓴사람
	private String reviewwritedate; //리뷰작성일
	private String productname; //상품명
	private String mcatename; //카테고리 이름
	private String seller;  //판매자 아이디
	
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public String getReviewanswer() {
		return reviewanswer;
	}
	public void setReviewanswer(String reviewanswer) {
		this.reviewanswer = reviewanswer;
	}
	public String getReviewwriter() {
		return reviewwriter;
	}
	public void setReviewwriter(String reviewwriter) {
		this.reviewwriter = reviewwriter;
	}
	public String getReviewwritedate() {
		return reviewwritedate;
	}
	public void setReviewwritedate(String reviewwritedate) {
		this.reviewwritedate = reviewwritedate;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
}
