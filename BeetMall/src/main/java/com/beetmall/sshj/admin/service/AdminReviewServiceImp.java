package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.AdminReviewDAO;
import com.beetmall.sshj.admin.vo.AdminReviewVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO; 
 
@Service
public class AdminReviewServiceImp implements AdminReviewService {
	
	@Inject
	AdminReviewDAO dao;

	@Override
	public List<AdminReviewVO> reviewListA(adminkPageSearchVO pageVO) { 
		return dao.reviewListABC(pageVO);
	}

	@Override
	public int reviewListOnetotalRecord(adminkPageSearchVO pageVO) {
		return dao.reviewListOnetotalRecord(pageVO);
	}

	@Override
	public AdminReviewVO reviewselect(int reviewnum) {
		return dao.reviewselect(reviewnum);
	}  
}
