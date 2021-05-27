package com.beetmall.sshj.admin.vo;

public class Admin_SettleVO {
	private long ordernum; // 주문번호
	private String mcatename; // 중분류 카테고리 이름
	private String orderstatus; // 주문현재 상황
	private String orderconfirm; // 주문현재 상황 날짜
	private String orderdate; // 구매일
	private String productname; // 상품명
	private String userid; // 구매자명
	private String settledate; // 정산날짜
	private String storename; // 법인명
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	private long realpayment; // 매출액 합계
	private String checkBtn; // 선택한 버튼
	private String selectOption; // 선택한 옵션
	private String searchTxt; // 검색어
	private long sellerMoney; // 정산 판매자 금액
	private long adminMoney; // 정산 관리자 금액
	private long productnum;
	
	///////////////////////////////////////////////////////////////////////////
	//페이징
	private int pageNum=1; // 현재 누른 페이지
	private int onePageNum=10; // 한페이지당 페이지 번호수
	private int onePageRecord=10; // 한페이지당 레코드 수
	
	private int totalPage; //총 페이지, lastPage 마지막 페이지
	private int totalRecord; //총 레코드수
	private int startPageNum=1; //시작페이지
	
	private int lastPageRecord=10; //마지막 페이지의 남은 레코드수
	
	
	
	public long getProductnum() {
		return productnum;
	}
	public void setProductnum(long productnum) {
		this.productnum = productnum;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
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
	
	
	//////////////////////////////////////////페이징 ///////////////////////////////////
	
	
	public long getOrdernum() {
		return ordernum;
	}
	public long getSellerMoney() {
		return sellerMoney;
	}
	public void setSellerMoney(long sellerMoney) {
		this.sellerMoney = sellerMoney;
	}
	public long getAdminMoney() {
		return adminMoney;
	}
	public void setAdminMoney(long adminMoney) {
		this.adminMoney = adminMoney;
	}
	public String getCheckBtn() {
		return checkBtn;
	}
	public void setCheckBtn(String checkBtn) {
		this.checkBtn = checkBtn;
	}
	public String getSelectOption() {
		return selectOption;
	}
	public void setSelectOption(String selectOption) {
		this.selectOption = selectOption;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public void setOrdernum(long ordernum) {
		this.ordernum = ordernum;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getOrderconfirm() {
		return orderconfirm;
	}
	public void setOrderconfirm(String orderconfirm) {
		this.orderconfirm = orderconfirm;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSettledate() {
		return settledate;
	}
	public void setSettledate(String settledate) {
		this.settledate = settledate;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public long getRealpayment() {
		return realpayment;
	}
	public void setRealpayment(long realpayment) {
		this.realpayment = realpayment;
	}
	
	
	
}
