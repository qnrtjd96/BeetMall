package com.beetmall.sshj.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_SaleListService;
import com.beetmall.sshj.admin.vo.Admin_SaleListVO;
import com.beetmall.sshj.admin.vo.Admin_SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Controller
public class Admin_SaleListController {
	@Autowired
	Admin_SaleListService saleListService;
	
	//판매내역 보기
	@RequestMapping("/salesListA")
	public ModelAndView saleList(Admin_SearchAndPageVO sapvo, Admin_SaleListVO asvo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView(); 
		//페이지번호
		String reqPageNum = req.getParameter("pageNum");
		if(reqPageNum!=null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum));
			System.out.println(reqPageNum + "<--reqPageNum");
		}
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
		//총 레코드수
		sapvo.setTotalRecord(saleListService.saleListTotalRecord(sapvo));
		
		//판매내역 목록
		List<Admin_SaleListVO> list = saleListService.saleList(sapvo);
		for(int i = 0; i<list.size(); i++) {
			asvo = list.get(i);
			//System.out.println("구매자 아이디 : "+ asvo.getUserid() + "/ 구매자 이름 : "+asvo.getUsername());
		}
		//레코드 한개 보기 
		mav.addObject("oneList", saleListService.saleListOneSelect(asvo));
		//리스트담기
		mav.addObject("list", list);
		//검색어와 페이징 담기
		mav.addObject("searchWord",sapvo.getSearchWord());
		mav.addObject("sapvo",sapvo);
		
		
		mav.setViewName("/admin/salesListA");
		return mav;
	}  	
}