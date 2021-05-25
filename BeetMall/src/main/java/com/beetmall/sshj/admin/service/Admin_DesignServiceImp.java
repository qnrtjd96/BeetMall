package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_DesignDAO;
import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
import com.beetmall.sshj.admin.vo.Admin_DesignVO;
import com.beetmall.sshj.custom.vo.PopupVO;
@Service
public class Admin_DesignServiceImp implements Admin_DesignService {
	@Inject
	Admin_DesignDAO designdao;

	@Override
	public List<Admin_DesignVO> designselect(int num) {
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

	@Override
	public int maincateEdit(int catesort, int catenum, int productnum) {
		return designdao.maincateEdit(catesort, catenum, productnum);
	}

	@Override
	public int titleChange(String orgtitle, String tmptitle) {
		return designdao.titleChange(orgtitle, tmptitle);
	}

	@Override
	public int popdel() {
		return designdao.popdel();
	}

	@Override
	public int popInsert(PopupVO vo) {
		return designdao.popInsert(vo);
	}

	@Override
	public PopupVO popupSelect() {
		return designdao.popupSelect();
	}
}
