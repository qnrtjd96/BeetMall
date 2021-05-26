package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_SettleDAO;
import com.beetmall.sshj.admin.vo.Admin_SettleVO;
@Service
public class Admin_SettleServiceImp implements Admin_SettleService{

	@Autowired
	Admin_SettleDAO dao;
	
	@Override
	public int getSettleLength(Admin_SettleVO vo) {
		// TODO Auto-generated method stub
		return dao.getSettleLength(vo);
	}

	@Override
	public List<Admin_SettleVO> getSettleList(Admin_SettleVO vo) {
		// TODO Auto-generated method stub
		return dao.getSettleList(vo);
	}

	@Override
	public Admin_SettleVO getSettleMoney() {
		// TODO Auto-generated method stub
		return dao.getSettleMoney();
	}

	@Override
	public int settleUpdate() {
		// TODO Auto-generated method stub
		return dao.settleUpdate();
	}

	@Override
	public List<Admin_SettleVO> adminSettleExcel(Admin_SettleVO vo) {
		// TODO Auto-generated method stub
		return dao.adminSettleExcel(vo);
	}
	
}
