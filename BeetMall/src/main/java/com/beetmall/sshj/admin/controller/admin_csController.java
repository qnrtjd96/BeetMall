package com.beetmall.sshj.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_FaqService;
import com.beetmall.sshj.admin.service.BoardService;
import com.beetmall.sshj.admin.vo.Admin_FaqVO;  

@Controller
public class admin_csController {

	@Inject
	BoardService adminService;

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
		int listlength = service.getLength(vo);
		vo.setTotalRecord(listlength);
		
		List<Admin_FaqVO> list =service.getList(vo);
		mav.addObject("pageVO", vo);
		mav.addObject("list", list);
		mav.setViewName("/admin/csFAQ");
		return mav;
	}

	 @RequestMapping("/csFAQBoard")
	 public ModelAndView csFAQBoard(HttpServletRequest req, Admin_FaqVO vo) {
		 ModelAndView mav = new ModelAndView();
		 
		 Admin_FaqVO vo2 = service.getBoard(vo);
		 mav.addObject("vo",vo2);
		 mav.setViewName("admin/csFAQBoard");
		 return mav;
	 }
	 
	 @RequestMapping("/csFAQBoardEdit")
	 public ModelAndView csFAQBoardEdit(HttpServletRequest req, Admin_FaqVO vo) {
		 ModelAndView mav = new ModelAndView();
		 
		 Admin_FaqVO vo2 = service.getBoard(vo);
		 mav.addObject("vo",vo2);
		 mav.setViewName("admin/csFAQBoardEdit");
		 return mav;
	 }
	 
	 @RequestMapping("/csFAQBoardEditOk")
	 public ModelAndView csFAQBoardEditOk(HttpServletRequest req, Admin_FaqVO vo) {
		 ModelAndView mav = new ModelAndView();
		 
		 int result = service.updateBoard(vo);
		 if(result == 1 ) {
			 mav.setViewName("redirect:csFAQ");
		 } else {
			 mav.setViewName("redirect:csFAQBoardEdit?faqnum="+vo.getFaqnum());			 
		 }
		 return mav;
	 }
	 
	 @RequestMapping(value = "/csFAQDel",method = RequestMethod.POST)
	 @ResponseBody
	 public int csFAQDel(HttpServletRequest req, Admin_FaqVO vo) {
		 int result = service.deleteBoard(vo);
		 return result;
	 }

	 @RequestMapping("/csFAQWrite")
	public ModelAndView csFAQWrite(HttpServletRequest req, Admin_FaqVO vo) {
		ModelAndView mav = new ModelAndView();
		
		 Admin_FaqVO vo2 = service.getBoard(vo);
		 mav.addObject("vo",vo2);
		mav.setViewName("/admin/csFAQWrite");
		return mav;
	}
	 
	 @RequestMapping("/csFAQUpdate")
		public ModelAndView csFAQUpdate(HttpServletRequest req, Admin_FaqVO vo) {
			ModelAndView mav = new ModelAndView();
			
			int result= service.updateBoard(vo);
			if(result == 1) {
				mav.setViewName("redirect:csFAQ");				
			} else {
				mav.setViewName("redirect:csFAQUpdate");
			}
			return mav;
		}
	 
	 @RequestMapping("/csFAQInsert")
		public ModelAndView csFAQInsert(HttpServletRequest req, Admin_FaqVO vo) {
			ModelAndView mav = new ModelAndView();
			
			int result = service.insertBoard(vo);
			
			if(result == 1) {
				mav.setViewName("redirect:csFAQ");
			} else {
				mav.setViewName("redirect:csFAQWrite");
			}
			
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