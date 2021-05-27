package com.beetmall.sshj.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_ProductService;
import com.beetmall.sshj.admin.service.adminProductService;
import com.beetmall.sshj.admin.vo.Admin_ProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.seller.service.SellerSalesService;
 

@Controller
public class admin_productController { 
	
	@Inject
	adminProductService productService;
	//////////////////////상품 관리///////////////////////////////////// 
	
	@Autowired
	SellerSalesService cateService;
	
	@Autowired
	Admin_ProductService service;
	
	//상품 목록 보기
	@RequestMapping("/productListA")
	public ModelAndView productListA(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();

		
		//타입넘어왔는지 보고 세팅해주기
		String category=req.getParameter("category");
		System.out.println("category = " + category);
		pageVO.setCategory(category);
		
		System.out.println("getCategory = "+ pageVO.getCategory());
		
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
		
		mav.setViewName("/admin/productListA");
		
		return mav;
	}
	
	//검색해서 리스트 정렬해주기
	
	
	//상품수정페이지 들어가기
	@RequestMapping("/productEditA")
	public ModelAndView productEditA(HttpServletRequest req, Admin_ProductVO vo) {
		ModelAndView mav = new ModelAndView();
		// 카테고리 대분류, 중분류 불러오기
		mav.addObject("cateList",cateService.allCategoryList());
		
		//  이거 써야함
		//int productnum = req.getParameter("productnum");
		
		int productnum = 1;
		
		// 프로덕트에 있는 데이터 불러오기
		Admin_ProductVO vo2 = service.productListData(productnum);

		vo2.setSellstart(vo2.getSellstart().substring(0,10));
		vo2.setSellfinish(vo2.getSellfinish().substring(0,10));
		mav.addObject("list",vo2);
		
		if( vo2.getOptionselect() != 0) {
			// 옵션 셀렉트가 0이 아니면 옵션이 있다!
			List<Admin_ProductVO> vo3 = service.productOptionData(productnum);
			mav.addObject("op",vo3);
		}
		
		if( vo2.getSaleselet() != 0) {
			// 세일 셀렉트가 0이 아니면 할인액이 있다!
			Admin_ProductVO vo4 = service.productSaleData(productnum);
			mav.addObject("dis",vo4);
		}
		
		
		
		
		mav.setViewName("admin/productEditA");
		return mav;
	}
}
