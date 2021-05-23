package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SellerSalesVO;

public interface SellerSalesService {
	// 카테고리 리스트 불러오기
	public List<SellerSalesVO> allCategoryList();
	// 오늘의 매출내역 불러오기
	public SellerSalesVO todayList(SellerSalesVO vo);
	// 매출분석 데이터 리스트
	public List<SellerSalesVO> salesDataList(SellerSalesVO vo);
	// 모든 데이터에서 record 갯수만큼만 불러오기
	public List<SellerSalesVO> sellerSalesAllData(SellerSalesVO vo);
	// 데이터 총갯수
	public int sellerSalesAllDataLength(String userid);
	// 모든 데이터 불러오기
	public List<SellerSalesVO> sellerSalesChartData(int num, String userid);
}
