package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_SalesDAO;
import com.beetmall.sshj.admin.vo.Admin_CateSalesVO;
import com.beetmall.sshj.admin.vo.Admin_SalesVO;
import com.beetmall.sshj.seller.vo.SellerSalesVO;

@Service
public class Admin_SalesServiceImp implements Admin_SalesService{

	@Autowired
	Admin_SalesDAO dao;
	
	@Override
	public Admin_SalesVO getCompaySellerCustomerData(Admin_SalesVO vo) {
		// TODO Auto-generated method stub
		return dao.getCompaySellerCustomerData(vo);
	}

	@Override
	public List<Admin_CateSalesVO> cateSalesDataList(Admin_CateSalesVO vo) {
		// TODO Auto-generated method stub
		return dao.cateSalesDataList(vo);
	}

	@Override
	public List<Admin_CateSalesVO> sellerSalesAllData2(Admin_CateSalesVO vo) {
		// TODO Auto-generated method stub
		return dao.sellerSalesAllData2(vo);
	}

	@Override
	public int sellerSalesAllDataLength2() {
		// TODO Auto-generated method stub
		return dao.sellerSalesAllDataLength2();
	}

	@Override
	public List<Admin_CateSalesVO> sellerSalesChartData2(int num) {
		// TODO Auto-generated method stub
		return dao.sellerSalesChartData2(num);
	}
	
}
