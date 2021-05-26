package com.beetmall.sshj.admin.vo;

public class Admin_FaqVO {
	private int faqnum;
	private String faqcate;
	private String faqtitle;
	private String faqcontent;
	private int faqoption;
	private int[] check;
	private String searchKey;
	private String searchWord;
	
	

	///////////////////////////////////////////////////////////////////////////
	
	//페이징
	private int pageNum=1; // 현재 누른 페이지
	private int onePageNum=10; // 한페이지당 페이지 번호수
	private int onePageRecord=10; // 한페이지당 레코드 수
	
	private int totalPage; //총 페이지, lastPage 마지막 페이지
	private int totalRecord; //총 레코드수
	private int startPageNum=1; //시작페이지
	
	private int lastPageRecord=10; //마지막 페이지의 남은 레코드수
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// 시작페이지 번호 계산
		startPageNum = ((pageNum-1)/onePageNum*onePageNum)+1;
	}
	public int getOnePageNum() {
		return onePageNum;
	}
	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 레코드수를 이용하여 총페이지수를 구한다.
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		
		//마지막 페이지 레코드 수
		if(totalRecord%onePageRecord == 0) { // totalRecord % 10 == 0 이면 한페이지당 갯수가 딱 맞다는 것이다.
			lastPageRecord = onePageRecord; // 그렇기 때문에 onePageRecord 10을 lastPageRecord로 넣어주면 되고
		} else {
			lastPageRecord = totalRecord%onePageRecord; // 나머지가 있다면, 그 숫자가 마지막 페이지의 record 수가 된다.
		}
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	
	///////////////////////////////// 페이징 ////////////////////////////////////

	
	public int getFaqnum() {
		return faqnum;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int[] getCheck() {
		return check;
	}
	public void setCheck(int[] check) {
		this.check = check;
	}
	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}
	public String getFaqcate() {
		return faqcate;
	}
	public void setFaqcate(String faqcate) {
		this.faqcate = faqcate;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public String getFaqcontent() {
		return faqcontent;
	}
	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}
	public int getFaqoption() {
		return faqoption;
	}
	public void setFaqoption(int faqoption) {
		this.faqoption = faqoption;
	}
	
	
}
