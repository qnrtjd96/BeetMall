package com.beetmall.sshj.admin.vo;

public class AdminReviewVO {
/*목록뽑아낼때 쓰는것	d.reviewnum, d.reviewcontent, d.reviewanswer, 
  d.userid as reviewwriter, d.reviewwritedate, c.productname, 
  c.mcatename, c.userid seller 
  팝업창 띄울때 쓰는것 a.reviewnum, a.productnum, a.userid as reviewwrite, 
  a.reviewwritedate, a.reviewscore, a.reviewreport, a.reviewcontent, 
  a.reviewanswer, b.reviewcount, c.reportreason, d.seller
*/
	private int reviewnum; //번호
	private String reviewcontent; //컨텐츠부분인데 이건 잘라줘야함
	private String reviewanswer; //답변상태이걸로확인하자
	private String reviewwriter; //리뷰쓴사람
	private String reviewwritedate; //리뷰작성일
	private String productname; //상품명
	private String mcatename; //카테고리 이름
	private String seller;
	private int productnum;  //상품번호
	private String reviewscore;  //리뷰 평점
	private String reviewcount;  //추천수
	private String reportreason;  //신고종류
	
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
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getReviewscore() {
		return reviewscore;
	}
	public void setReviewscore(String reviewscore) {
		this.reviewscore = reviewscore;
	}
	public String getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(String reviewcount) {
		this.reviewcount = reviewcount;
	}
	public String getReportreason() {
		return reportreason;
	}
	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}
}
