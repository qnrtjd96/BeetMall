package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
import com.beetmall.sshj.admin.vo.Admin_DesignVO;
import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.custom.vo.PopupVO;

public interface Admin_DesignDAO {
	public List<Admin_DesignVO> designselect(int num);
	public String designname(int num);
	public List<Admin_DesignPageVO> adminproductList(Admin_DesignPageVO pageVO);
	public int adminproductOnetotalRecord(Admin_DesignPageVO pageVO);
	public int maincateEdit(int catesort, int catenum, int productnum);
	public int titleChange(String orgtitle, String tmptitle);
	public int popdel();
	public int popInsert(PopupVO vo);
	public PopupVO popupSelect();
}
 