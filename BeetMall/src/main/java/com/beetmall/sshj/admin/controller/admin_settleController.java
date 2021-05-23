package com.beetmall.sshj.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_SettleService;
import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.Admin_SettleVO;

@Controller
public class admin_settleController {
	@Inject
	Boardervice adminService;
	
	@Autowired
	Admin_SettleService service;
	 
	
	@RequestMapping("/settleMng")
	public ModelAndView settleMng(HttpServletRequest req, Admin_SettleVO vo) {
		ModelAndView mav = new ModelAndView();
		
		Calendar sd = Calendar.getInstance();
		Calendar ed = Calendar.getInstance();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		sd.add(Calendar.MONTH, -3);
		
		if(req.getAttribute("startDate") != null) {
			
		} else {
			String startDate =format.format(sd.getTime());
			String endDate = format.format(ed.getTime());
			
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
		}
		System.out.println(vo.getSelectOption());
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		System.out.println(vo.getCheckBtn());
		
		int result = service.getSettleLength(vo);
		
		vo.setTotalRecord(result);
		
		mav.addObject("pageVO",vo);
		mav.addObject("result",service.getSettleList(vo));
		mav.setViewName("/admin/settleMng");
		return mav;
	}
	
}