package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.AdminReviewVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
 

public interface AdminReviewService {

	public List<AdminReviewVO> reviewListA(adminkPageSearchVO pageVO);

	public int reviewListOnetotalRecord(adminkPageSearchVO pageVO);

	public AdminReviewVO reviewselect(int reviewnum); 
	
	 
}
