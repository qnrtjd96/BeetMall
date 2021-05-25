package com.beetmall.sshj.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_FaqService;
import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.Admin_FaqVO; 

@Controller
public class admin_csController {

	@Inject
	Boardervice adminService;
	
	@Autowired
	Admin_FaqService service;
	 
	/////////////////////////고객센터//////////////////////
 @RequestMapping("/csQuestionBrowse")
	public ModelAndView csQuestionBrowse() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csQuestionBrowse");
		return mav;
	}
 //자주묻는 질문
 @RequestMapping("/csFAQ")
	public ModelAndView csFAQ(HttpServletRequest req, Admin_FaqVO vo) {
		ModelAndView mav = new ModelAndView();
		int listlength = service.getLength();
		
		vo.setTotalRecord(listlength);
		
		List<Admin_FaqVO> list =service.getList(vo);

		mav.addObject("pageVO", vo);
		mav.addObject("list", list);
		mav.setViewName("/admin/csFAQ");
		return mav;
	}
 
 @RequestMapping("/csFAQWrite")
	public ModelAndView csFAQWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/csFAQWrite");
		return mav;
	}
	//채팅 보기
	@RequestMapping("/csChat")
	public ModelAndView csChat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/csChat");
		return mav;
	} 
	
	
	
	
	
	
	
  
}