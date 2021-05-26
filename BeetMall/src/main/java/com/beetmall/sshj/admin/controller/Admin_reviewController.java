package com.beetmall.sshj.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import com.beetmall.sshj.admin.service.AdminReviewService; 
import com.beetmall.sshj.admin.vo.AdminReviewVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.seller.vo.SellerReviewVO; 
 

@Controller
public class Admin_reviewController { 
	@Inject
	AdminReviewService reviewService; 
	
	///////////////////////리뷰 관리///////////////////////////////////
	//리뷰 목록보기
	@RequestMapping("/reviewListA")
	public ModelAndView reviewListA(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) { 
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		 
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(reviewService.reviewListOnetotalRecord(pageVO));
		
		mav.addObject("list", reviewService.reviewListA(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/reviewListA");
		
		return mav;
	}
	
	//모달창 띄어주기
	@RequestMapping("/reviewselect")
	@ResponseBody
	public AdminReviewVO reviewselect(int reviewnum) {
		AdminReviewVO vo = reviewService.reviewselect(reviewnum);
		
		return vo; 
	}
}
	
	
  
	
	 