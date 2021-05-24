package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.dao.Admin_DesignDAO;
import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;

public interface Admin_DesignService {
	public List<Admin_DesignDAO> designselect(int num);
	public String designname(int num);
	public List<Admin_DesignPageVO> adminproductList(Admin_DesignPageVO pageVO);
	public int adminproductOnetotalRecord(Admin_DesignPageVO pageVO); 
}
