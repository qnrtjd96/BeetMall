package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.AdminReviewVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO; 
  
public interface AdminReviewDAO {
	public int reviewListOnetotalRecord(adminkPageSearchVO pageVO);

	public List<AdminReviewVO> reviewListABC(adminkPageSearchVO pageVO);

	public AdminReviewVO reviewselect(int reviewnum);
}
