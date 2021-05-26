package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_SaleListDAO;
import com.beetmall.sshj.admin.vo.Admin_SaleListVO;
import com.beetmall.sshj.admin.vo.Admin_SearchAndPageVO;


@Service
public class Admin_SaleListServiceImp implements Admin_SaleListService {

	@Autowired
	Admin_SaleListDAO saleListDAO;
	
	public List<Admin_SaleListVO> saleList(Admin_SearchAndPageVO sapvo){
		return saleListDAO.saleList(sapvo);
	}
	
	@Override
	public int saleListTotalRecord(Admin_SearchAndPageVO sapvo) {
		return saleListDAO.saleListTotalRecord(sapvo);
	}

	@Override
	public Admin_SaleListVO saleListOneSelect(Admin_SaleListVO asvo) {
		return saleListDAO.saleListOneSelect(asvo);
	}
}