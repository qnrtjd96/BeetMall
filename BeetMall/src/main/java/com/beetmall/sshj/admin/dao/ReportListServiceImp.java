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

	@Override
	public ReportListVO csreportSelect(int reportnum) {
		return ReportListDAO.csreportSelect(reportnum);
	}

	@Override
	public List<ReportListVO> modalSelect(String reporteduser) {
		return ReportListDAO.modalSelect(reporteduser);
	}

	@Override
	public List<ReportListVO> modalSelect2(String reporteduser) {
		return ReportListDAO.modalSelect2(reporteduser);
	}

	@Override
	public int memberstop(int stopdate, String userid) {
		return ReportListDAO.memberstop(stopdate, userid);
	}

	@Override
	public int memberTableStop(String userid) {
		return ReportListDAO.memberTableStop(userid);
	}

	@Override
	public int sysdateInsert(int reportnum) {
		return ReportListDAO.sysdateInsert(reportnum);
	}
}
