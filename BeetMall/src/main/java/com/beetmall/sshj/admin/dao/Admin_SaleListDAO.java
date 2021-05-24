package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_SaleListVO;
import com.beetmall.sshj.admin.vo.Admin_SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

public interface Admin_SaleListDAO {
	//판매목록
	public List<Admin_SaleListVO> saleList(Admin_SearchAndPageVO sapvo);
	//전체 레코드
	public int saleListTotalRecord(Admin_SearchAndPageVO sapvo);
	//판매목록 1개만꺼내기 
	public Admin_SaleListVO saleListOneSelect(Admin_SaleListVO asvo);
	
}