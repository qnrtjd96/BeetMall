package com.beetmall.sshj.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_DesignService;
import com.beetmall.sshj.admin.service.adminProductService;
import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
import com.beetmall.sshj.admin.vo.adminProductVO;
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
		// 위는 판매목록
		mav.addObject("listA", designservice.designselect(1));
		mav.addObject("listTitleA", designservice.designname(1));
		mav.addObject("listB", designservice.designselect(2));
		mav.addObject("listTitleA", designservice.designname(2));
		mav.addObject("listC", designservice.designselect(3));
		mav.addObject("listTitleA", designservice.designname(3));
		mav.setViewName("admin/boardDesignMng");
		return mav;
	}
	
	@RequestMapping("/designPageing")
	@ResponseBody
	public Map<String, Object> designPageing(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVOa = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVOa.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVOa.setSearchKey(req.getParameter("searchKey"));
		pageVOa.setSearchWord(req.getParameter("searchWord"));
		pageVOa.setTotalRecord(productService.productOnetotalRecord(pageVOa));
		List<adminProductVO> list =  productService.productList(pageVOa);
		adminkPageSearchVO pageVO = pageVOa;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageVO", pageVO); 
		return map;
	}
}
