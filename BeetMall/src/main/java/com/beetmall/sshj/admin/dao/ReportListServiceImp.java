package com.beetmall.sshj.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.service.ReportListService;
import com.beetmall.sshj.admin.vo.ReportListVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Service
public class ReportListServiceImp implements ReportListService{
	
	@Inject
	ReportListDAO ReportListDAO;

	@Override
	public int csreportOnetotalRecord(adminkPageSearchVO pageVO) {
		return ReportListDAO.csreportOnetotalRecord(pageVO);
	}

	@Override
	public List<ReportListVO> csreportList(adminkPageSearchVO pageVO) {
		return ReportListDAO.csreportList(pageVO);
	}
	
}
