package com.beetmall.sshj.seller.vo;

public class SellerSalesVO {
	// 카테고리 대분류
	private int catenum; // 대분류 번호
	private String catename; // 대분류 이름
	private int catesort; // 대분류 정렬기준
	private String cateimg; // 대분류 사진
	
	// 카테고리 중분류
	private int mcatenum; // 중분류 번호
	private String mcatename; // 중분류 이름
	private int mcatesort; // 중분류 정렬기준
	
	// 오늘의 데이터
	private long todayMoney; //오늘의 매출금액
	private int todayNum; // 오늘의 건수
	
	// 차트에 들어갈 데이터?
	private int[] resultData; // 뷰단에 존재하는 가져와야 할 데이터 목록[배열]
	private long ordernum; // 주문번호
	private String productname; // 상품이름(제목)
	private int productnum; // 상품번호 
	private int orderquantity; // 수량
	private String orderconfirm; // 구매확정일자
	private int orderprice; // 구매한 가격
	private String userid; // 유저아이디
	private long realpayment; // 매출금액 합계
	private String monthData; //처음에 불러온 데이터의 날짜
	private long payData; //처음에 불러온 데이터의 합계
	
	
	// 데이터 콤마 찍고 넣는다
	private String orderquantityStr;
	private String orderpriceStr;
	private String realpaymentStr;
	
	// 날짜 데이터 저장할 변수
	private String startCalendarDataValue;
	private String endCalendarDataValue;
	
	
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
	
	
	//////////////////////////////////////////페이징 ///////////////////////////////////
	
	
	public SellerSalesVO() {};

	
	
	public String getOrderquantityStr() {
		return orderquantityStr;
	}
	public void setOrderquantityStr(String orderquantityStr) {
		this.orderquantityStr = orderquantityStr;
	}
	public String getOrderpriceStr() {
		return orderpriceStr;
	}
	public void setOrderpriceStr(String orderpriceStr) {
		this.orderpriceStr = orderpriceStr;
	}
	public String getRealpaymentStr() {
		return realpaymentStr;
	}
	public void setRealpaymentStr(String realpaymentStr) {
		this.realpaymentStr = realpaymentStr;
	}
	public String getMonthData() {
		return monthData;
	}
	public void setMonthData(String monthData) {
		this.monthData = monthData;
	}
	public long getRealpayment() {
		return realpayment;
	}



	public long getPayData() {
		return payData;
	}
	public void setPayData(long payData) {
		this.payData = payData;
	}
	public void setRealpayment(long realpayment) {
		this.realpayment = realpayment;
	}



	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public long getTodayMoney() {
		return todayMoney;
	}
	public void setTodayMoney(long todayMoney) {
		this.todayMoney = todayMoney;
	}
	public long getTodayNum() {
		return todayNum;
	}



	public void setTodayNum(int todayNum) {
		this.todayNum = todayNum;
	}



	public String getStartCalendarDataValue() {
		return startCalendarDataValue;
	}
	public void setStartCalendarDataValue(String startCalendarDataValue) {
		this.startCalendarDataValue = startCalendarDataValue;
	}
	public String getEndCalendarDataValue() {
		return endCalendarDataValue;
	}
	public void setEndCalendarDataValue(String endCalendarDataValue) {
		this.endCalendarDataValue = endCalendarDataValue;
	}
	public int[] getResultData() {
		return resultData;
	}
	public void setResultData(int[] resultData) {
		this.resultData = resultData;
	}

	
	public long getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(long ordernum) {
		this.ordernum = ordernum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public String getOrderconfirm() {
		return orderconfirm;
	}
	public void setOrderconfirm(String orderconfirm) {
		this.orderconfirm = orderconfirm;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	//////////////////차트, 엑셀에 들어갈 데이터..////////////////////////
	public int getCatenum() {
		return catenum;
	}
	public void setCatenum(int catenum) {
		this.catenum = catenum;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public int getCatesort() {
		return catesort;
	}
	public void setCatesort(int catesort) {
		this.catesort = catesort;
	}
	public String getCateimg() {
		return cateimg;
	}
	public void setCateimg(String cateimg) {
		this.cateimg = cateimg;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public int getMcatesort() {
		return mcatesort;
	}
	public void setMcatesort(int mcatesort) {
		this.mcatesort = mcatesort;
	}
	
	
}
