package com.beetmall.sshj.admin.controller;

import java.text.DecimalFormat;
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
		DecimalFormat formatter = new DecimalFormat("###,###");
		sd.add(Calendar.MONTH, -3);
		
		if(vo.getStartDate() != null) {
			
		} else {
			String startDate =format.format(sd.getTime());
			String endDate = format.format(ed.getTime());
			
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
		}
		
		int result = service.getSettleLength(vo);
		
		vo.setTotalRecord(result);

		Admin_SettleVO moneyData = service.getSettleMoney();
		
		
		mav.addObject("adminMoney",formatter.format(moneyData.getAdminMoney()));
		mav.addObject("sellerMoney",formatter.format(moneyData.getSellerMoney()));
		mav.addObject("pageVO",vo);
		mav.addObject("result",service.getSettleList(vo));
		mav.setViewName("admin/settleMng");
		return mav;
	}
	
	@RequestMapping("/adminSettleUpdate")
	public ModelAndView adminSettleUpdate() {
		ModelAndView mav = new ModelAndView();
		
		service.settleUpdate();
		
		mav.setViewName("admin/settleMng");
		
		return mav;
	}
	
}