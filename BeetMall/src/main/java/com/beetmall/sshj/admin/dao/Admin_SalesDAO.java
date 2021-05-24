package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_CateSalesVO;
import com.beetmall.sshj.admin.vo.Admin_SalesVO;
import com.beetmall.sshj.seller.vo.SellerSalesVO;

public interface Admin_SalesDAO {
	// 수익 데이터 가져오기
	public Admin_SalesVO getCompaySellerCustomerData(Admin_SalesVO vo);
	// 카테고리 매출내역 데이터 가져오기
	public List<Admin_CateSalesVO> cateSalesDataList(Admin_CateSalesVO vo);
	// 모든 데이터에서 record 갯수만큼만 불러오기
	public List<Admin_CateSalesVO> sellerSalesAllData2(Admin_CateSalesVO vo);
	// 데이터 총갯수
	public int sellerSalesAllDataLength2();
	// 모든 데이터 불러오기
	public List<Admin_CateSalesVO> sellerSalesChartData2(int num);
}
