package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_FaqVO;

public interface Admin_FaqDAO {
	// 데이터 리스 가져오기
	public List<Admin_FaqVO> getList(Admin_FaqVO vo);
	// 총 갯수 가져오기
	public int getLength();
}
