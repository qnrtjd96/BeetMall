package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_ProductVO;
import com.beetmall.sshj.seller.vo.ProductVO;

public interface Admin_ProductDAO {
	// 프로덕트에 있는 데이터
	public Admin_ProductVO productListData(int productnum);
	// 옵션에 있는 데이터
	public List<Admin_ProductVO> productOptionData(int productnum);
	//디스카운드테 있는 데이터
	public Admin_ProductVO productSaleData(int productnum);
	//상품 수정하기 뷰 
	public Admin_ProductVO productOneSelect(Admin_ProductVO vo);
	//상품 수정하기
	public int productUpdate(Admin_ProductVO vo);
	//할인 수정
	public int discountUpdate(Admin_ProductVO vo);
	// 옵션 수정
	public int optionUpdate(Admin_ProductVO vo);
}
