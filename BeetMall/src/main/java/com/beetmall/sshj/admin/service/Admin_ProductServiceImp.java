package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_ProductDAO;
import com.beetmall.sshj.admin.vo.Admin_ProductVO;

@Service
public class Admin_ProductServiceImp implements Admin_ProductService{

	@Autowired
	Admin_ProductDAO dao;
	
	@Override
	public Admin_ProductVO productListData(int productnum) {
		// TODO Auto-generated method stub
		return dao.productListData(productnum);
	}

	@Override
	public List<Admin_ProductVO> productOptionData(int productnum) {
		// TODO Auto-generated method stub
		return dao.productOptionData(productnum);
	}

	@Override
	public Admin_ProductVO productSaleData(int productnum) {
		// TODO Auto-generated method stub
		return dao.productSaleData(productnum);
	}

	@Override
	public Admin_ProductVO productOneSelect(Admin_ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.productOneSelect(vo);
	}

	@Override
	public int productUpdate(Admin_ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.productUpdate(vo);
	}

	@Override
	public int discountUpdate(Admin_ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.discountUpdate(vo);
	}

	@Override
	public int optionUpdate(Admin_ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.optionUpdate(vo);
	}
	

}
