package com.beetmall.sshj.custom.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.ReportDAO;
import com.beetmall.sshj.custom.vo.ReportVO;
@Service
public class ReportServiceImp implements ReportService {
	@Inject
	ReportDAO reportDAO;

	@Override
	public int insertReport(ReportVO vo) {
		return reportDAO.insertReport(vo);
	}
}
