package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_ProductVO;

public interface Admin_ProductService {
	// 프로덕트에 있는 데이터
	public Admin_ProductVO productListData(int productnum);
	// 옵션에 있는 데이터
	public List<Admin_ProductVO> productOptionData(int productnum);
	//디스카운드테 있는 데이터
	public Admin_ProductVO productSaleData(int productnum);
}
