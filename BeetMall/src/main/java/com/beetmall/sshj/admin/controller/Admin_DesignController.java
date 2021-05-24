package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_DesignService;
import com.beetmall.sshj.admin.service.adminProductService;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Controller
public class Admin_DesignController {
	@Inject
	Admin_DesignService designservice;
	@Inject
	adminProductService productService;
	 
	@RequestMapping("/boardDesignMng")
	public ModelAndView designboard(HttpServletRequest req) {  
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(productService.productOnetotalRecord(pageVO));
		
		mav.addObject("list", productService.productList(pageVO));
		mav.addObject("pageVO",pageVO);
		mav.setViewName("admin/boardDesignMng");
		return mav;
	}
}
