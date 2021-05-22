package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beetmall.sshj.custom.service.ReportService;
import com.beetmall.sshj.custom.vo.ReportVO;

@Controller
public class ReportController {
	@Inject
	ReportService reportservice;
	
	@RequestMapping("customreport")
	@ResponseBody
	public int reportsuccess(ReportVO vo, HttpSession session) {
		int result = 0;
		String userid = (String)session.getAttribute("logId");
		vo.setUserid(userid);
		if(vo.getReportcontent().equals("") || vo.getReportcontent() == null) {
			vo.setReportcontent("입력된 내용이 없습니다...");
		}
		System.out.println("getReportboard==="+vo.getReportboard());
		System.out.println("getReportboardnum==="+vo.getReportboardnum());
		System.out.println("getReportcontent==="+vo.getReportcontent());
		System.out.println("getReportdate==="+vo.getReportdate());
		System.out.println("getReporteduser==="+vo.getReporteduser());
		System.out.println("getReportnum==="+vo.getReportnum());
		System.out.println("getReportreason==="+vo.getReportreason());
		System.out.println("getReportselect==="+vo.getReportselect());
		System.out.println("getUserid==="+vo.getUserid());
		result = reportservice.insertReport(vo);
		
		return result;
	}

}
