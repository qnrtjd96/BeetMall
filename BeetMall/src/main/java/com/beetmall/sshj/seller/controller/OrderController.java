package com.beetmall.sshj.seller.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.OrderService;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order_management")// @RequestParam(value="ordernum") String ordernum ,@RequestParam(value="ordernum") 
	public ModelAndView orderList( HttpSession session, SearchAndPageVO sapvo, OrderSaleVO osvo, HttpServletRequest req) {
		
		//로그인한 아이디
		sapvo.setUserid((String)session.getAttribute("logId"));
		
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		//모델앤뷰
		ModelAndView mav = new ModelAndView();	
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
		sapvo.setSearchnum(sapvo.getSearchnum());
		sapvo.setSearchid(sapvo.getSearchid());
		
		System.out.println("search num : "+sapvo.getSearchnum() +", searchid : "+sapvo.getSearchid());
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(orderService.totalRecord(sapvo));
		//판매내역 목록
		List<OrderSaleVO> list = orderService.orderList(sapvo);
		 for(int i = 0; i<list.size(); i++){
		   OrderSaleVO vo = list.get(i);
		 }
		 
		// list에서 꺼낸 vo 담기
		mav.addObject("list",list);
		//레코드 한개 선택 담기
		mav.addObject("oneList", orderService.oneOrderSelect(osvo));	
		//검색어와 페이징를 담기
		mav.addObject("searchWord",sapvo.getSearchWord());
		mav.addObject("sapvo",sapvo);
	
		//뷰
		mav.setViewName("seller/order_management"); 
		return mav; 
	}
	//레코드 하나 선택
	/*
	 * @RequestMapping("/oneOrderSelect") public ModelAndView
	 * oneRecordSelect(OrderSaleVO osvo, @RequestParam(value="ordernum") String
	 * ordernum, HttpSession session, SearchAndPageVO sapvo, HttpServletRequest req)
	 * { ModelAndView mav = new ModelAndView();
	 * 
	 * osvo.setUserid((String)session.getAttribute("logId"));
	 * 
	 * //리퀘스트했을 때, 페이지 번호 확인 , 페이지 번호 있으면 가져온 값으로 세팅, 없으면 기본 값 = 1 String reqPageNum
	 * = req.getParameter("pageNum"); if(reqPageNum != null) {
	 * sapvo.setPageNum(Integer.parseInt(reqPageNum)); } //검색어
	 * sapvo.setSearchWord(sapvo.getSearchWord());
	 * mav.addObject(osvo.getOrdernum()); mav.addObject("oneList",
	 * orderService.oneRecordSelect(ordernum)); //총 레코드 수 구하기
	 * sapvo.setTotalRecord(orderService.totalRecord(sapvo));
	 * mav.setViewName("seller/order_management"); return mav; }
	 */
	// 판매 상태 변경
	@RequestMapping("/orderStatusUpdate")
	public String orderStatusUpdate(@RequestParam(value="orderNumArr") List<String> orderNumList, @RequestParam(value="orderStatus") String orderstatus,OrderSaleVO osvo) {
		//ModelAndView mav = new ModelAndView();
		//ajax의 valArr에서 받은 orderNumList 를 하나씩 꺼내서 ArrayList에 담음
		ArrayList<String> orderNumArr = new ArrayList<String>(); 
		System.out.println("claimStatus->"+ orderstatus);
		System.out.println("orderNumList->"+ orderNumList);
		for(int i = 0 ; i < orderNumList.size(); i++) {
			orderNumArr.add(orderNumList.get(i));
			System.out.println("orderNumArr->"+ orderNumArr);
		}
		for(int i = 0; i < orderNumArr.size(); i++) {
			String ordernum = orderNumArr.get(i);
			System.out.println("update ordernum ->" + ordernum);
			orderService.orderStatusUpdate(ordernum, orderstatus);
		}
		return "redirect:order_management";
	}	
	
	
}