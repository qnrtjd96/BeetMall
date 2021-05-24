package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface Admin_DesignDAO {
	public List<Admin_DesignDAO> designselect(int num);
	public String designname(int num);
	public List<Admin_DesignPageVO> adminproductList(Admin_DesignPageVO pageVO);
	public int adminproductOnetotalRecord(Admin_DesignPageVO pageVO);

}
 