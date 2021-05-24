package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_DesignDAO;
import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
@Service
public class Admin_DesignServiceImp implements Admin_DesignService {
	@Inject
	Admin_DesignDAO designdao;

	@Override
	public List<Admin_DesignDAO> designselect(int num) {
		return designdao.designselect(num);
	}

	@Override
	public String designname(int num) {
		return designdao.designname(num);
	}

	@Override
	public List<Admin_DesignPageVO> adminproductList(Admin_DesignPageVO pageVO) {
		return designdao.adminproductList(pageVO);
	}

	@Override
	public int adminproductOnetotalRecord(Admin_DesignPageVO pageVO) {
		return designdao.adminproductOnetotalRecord(pageVO);//
	}
}
