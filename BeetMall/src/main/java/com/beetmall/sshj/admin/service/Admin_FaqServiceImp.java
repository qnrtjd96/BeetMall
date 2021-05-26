package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_FaqDAO;
import com.beetmall.sshj.admin.vo.Admin_FaqVO;

@Service
public class Admin_FaqServiceImp implements Admin_FaqService {
	
	@Autowired
	Admin_FaqDAO dao;




	@Override
	public List<Admin_FaqVO> getList(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.getList(vo);
	}



	@Override
	public Admin_FaqVO getBoard(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoard(vo);
	}



	@Override
	public int deleteBoard(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(vo);
	}



	@Override
	public int getLength(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.getLength(vo);
	}



	@Override
	public int insertBoard(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}



	@Override
	public int updateBoard(Admin_FaqVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}
	
	
	
	
}
