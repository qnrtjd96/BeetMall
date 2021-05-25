package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_SaleListVO;
import com.beetmall.sshj.admin.vo.Admin_SearchAndPageVO;


public interface Admin_SaleListService {
	
	//판매목록
	public List<Admin_SaleListVO> saleList(Admin_SearchAndPageVO sapvo);
	//전체 레코드
	public int saleListTotalRecord(Admin_SearchAndPageVO sapvo);
	//판매목록 1개만꺼내기 
	public Admin_SaleListVO saleListOneSelect(Admin_SaleListVO asvo);
}