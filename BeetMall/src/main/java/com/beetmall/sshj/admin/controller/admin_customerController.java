package com.beetmall.sshj.admin.controller;

import java.util.ArrayList;
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

import com.beetmall.sshj.admin.service.Admin_BoardService;
import com.beetmall.sshj.admin.service.Admin_MemberService;
import com.beetmall.sshj.admin.service.Admin_MemberServiceImp; 
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.Admin_reportVO;

@Controller
public class admin_customerController {
	@Inject
	Admin_BoardService adminService;
	//////////////////////일반회원 관리////////////////////////////////
	@Inject
	Admin_MemberServiceImp memberservice;
	//목록보기
	@RequestMapping("/customerListA")
	public ModelAndView customerListA(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		int logType = 0;
		int selType = 0; // 일반회원
		pageVO.setUserType(0); // 일반회원만 조회할거라서 1;
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		//검색어, 검색키
		String searchKey = req.getParameter("searchKey");
		pageVO.setSearchKey(searchKey);
		pageVO.setSearchWord(req.getParameter("searchWord"));
		System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
		System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
		//pageVO.setTotalRecord();
		if(session.getAttribute("logType")!=null) {
			logType = (int)session.getAttribute("logType");
		}else {
			logType = 0;
		}
		int re = memberservice.memberCountall(pageVO);
		System.out.println("레코드 수>>"+re);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.memberselectall(pageVO));
		mav.addObject("pageVO", pageVO);
		
		mav.setViewName("/admin/customerListA");
		return mav;
	}
	//회원정보 수정
	@RequestMapping("/boardCustomerInfoEdit")
	public ModelAndView boardCustomerInfoEdit(HttpServletRequest req, HttpSession session, String prevPageNum) {
		ModelAndView mav = new ModelAndView(); 
		Admin_Member_PageVO pageVOA = new Admin_Member_PageVO();
		Admin_Member_PageVO pageVOB = new Admin_Member_PageVO();
		Admin_Member_PageVO pageVOC = new Admin_Member_PageVO();
		String userid = req.getParameter("userid");
		int prevPageNumInt = 0;
		if(prevPageNum != null) {
			prevPageNumInt = Integer.parseInt(prevPageNum);
		}
		mav.addObject("prevPageNum", prevPageNumInt);
		System.out.println("조회하는 페이지의 유저아이디="+userid);
		String pageNumStrA = req.getParameter("pageNumA");
		String pageNumStrB = req.getParameter("pageNumB");
		String pageNumStrC = req.getParameter("pageNumC");
		
		// 여기는 상단의 기본정보들
		mav.addObject("ilist",memberservice.memberinfoSelect(userid));
		mav.addObject("olist1", memberservice.orderstatusSelect(userid, "결제완료"));
		mav.addObject("olist2", memberservice.orderstatusSelect(userid, "구매확정"));
		mav.addObject("olist3", memberservice.orderstatusSelect(userid, "배송중"));
		mav.addObject("olist4", memberservice.orderstatusSelect(userid, "환불"));
		mav.addObject("olist5", memberservice.orderstatusSelect(userid, "환불 진행중"));
		mav.addObject("rlist",memberservice.reportinfoSelect(userid));
		mav.setViewName("/admin/boardCustomerInfoEdit");
		// 포인트-----------------------------------
		pageVOA.setUserid(userid);
		if(pageNumStrA == null) {
			pageVOA.setPageNum(1);
		}else if(pageNumStrA != null) {
			pageVOA.setPageNum(Integer.parseInt(pageNumStrA));
		} 
		String temp = "", type="";
		int month=0;
		// 타입 구분
		if((String)req.getParameter("type")!=null) {
			temp = (String)req.getParameter("type");
			if(temp.equals("save")) {
				type = ">=";
			}else if(temp.equals("spend")) {
				type = "<";
			}
		}
		// 월 선택 구분
		if((req.getParameter("month") != null)){
			month = Integer.parseInt(req.getParameter("month"));
		}
		if(type != null && !type.equals("") && month>0) {
			pageVOA.setTotalRecord(memberservice.countPointTypeMonth(userid, type, month));
			pageVOA.setType(type);
			pageVOA.setMonth(month);
			mav.addObject("listA", memberservice.selectPointTypeMonth(pageVOA));
		}else if(type !=null && !type.equals("")) {
			pageVOA.setTotalRecord(memberservice.countPointType(userid, type));
			pageVOA.setType(type);
			mav.addObject("listA", memberservice.selectPointTypeMonth(pageVOA));
		}else if(month>0){ 
			pageVOA.setTotalRecord(memberservice.countPointMonth(userid, month));
			pageVOA.setMonth(month);
			mav.addObject("listA", memberservice.selectPointTypeMonth(pageVOA));
		}else {
			pageVOA.setTotalRecord(memberservice.countPoint(userid));
			mav.addObject("listA", memberservice.selectPointTypeMonth(pageVOA));
		}
		mav.addObject("pageVOA", pageVOA);
		mav.addObject("mypoint", memberservice.myPointView(userid));
		mav.addObject("type",temp); 
		mav.addObject("month",month);
		// 포인트 끝 -----------------------------------
		// 농장 시작 -----------------------------------
		pageVOB.setUserid(userid);
		if(pageNumStrB == null) {
			pageVOB.setPageNum(1);
		}else if(pageNumStrB != null) {
			pageVOB.setPageNum(Integer.parseInt(pageNumStrB));
		}
		pageVOB.setTotalRecord(memberservice.farmCount("pageVOB"));
		mav.addObject("pageVOB", pageVOB);
		mav.addObject("listB", memberservice.farmFavoriteList(pageVOB));
		// 농장 끝 -----------------------------------
		// 장바구니 시작-------------------------------
		pageVOC.setOnePageRecord(5);	// 장바구니는 5개 출력이라
		pageVOC.setUserid(userid);
		if(pageNumStrC == null) {
			pageVOC.setPageNum(1);
		}else if(pageNumStrC != null) {
			pageVOC.setPageNum(Integer.parseInt(pageNumStrC));
		}
		pageVOC.setTotalRecord(memberservice.wishCount(userid));
		mav.addObject("pageVOC", pageVOC);
		mav.addObject("listC", memberservice.wishListSelect(pageVOC));
		// 장바구니끝 ---------------------------------
		if(req.getParameter("editOk") != null) {
			mav.addObject("editOk", req.getParameter("editOk"));
		}
		return mav;
	}
	
	@RequestMapping("userinfoupdate")
	public ModelAndView customerEdit(Admin_MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println(">>>>>>>>>>>>>><<<<<<<<<<<<<<<");
		System.out.println(vo.getUseraddr());
		System.out.println(vo.getUsername());
		System.out.println(vo.getUserid());
		System.out.println(vo.getUseremail());
		System.out.println(vo.getUserzipcode());
		System.out.println(vo.getUserdetailaddr());
		if(memberservice.memberEdit(vo)>0) {
			mav.addObject("editOk","Y");
		}else {
			mav.addObject("editOk","N");
		}
		mav.setViewName("redirect:boardCustomerInfoEdit");
		mav.addObject("userid", vo.getUserid());
		return mav;
	}
	
	//탈퇴회원보기
	@RequestMapping("/customerLeaveList")
	public ModelAndView customerLeaveList(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		
		int selType = 4; // 탈퇴한 일반회원
		pageVO.setUserType(4); // 탈퇴한 일반회원만 조회할거라서 4;
		String pageNumStr = req.getParameter("pageNum");
		//검색어, 검색키
		String searchKey = req.getParameter("searchKey");
		pageVO.setSearchKey(searchKey);
		pageVO.setSearchWord(req.getParameter("searchWord"));
		System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
		System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		
		int re = memberservice.memberCount(pageVO);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.memberselect(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("/admin/customerLeaveList");
		return mav;
	}
	
	//블랙리스트 보기
	@RequestMapping("/customerBlackList")
	public ModelAndView customerBlackList(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		int selType = 1; // 정지된 구매자회원
		pageVO.setUserType(1); // 정지된 구매자회원만 조회할거라서 1;
		String pageNumStr = req.getParameter("pageNum");
		//검색어, 검색키
		String searchKey = req.getParameter("searchKey");
		
		pageVO.setSearchKey(searchKey);
		pageVO.setSearchWord(req.getParameter("searchWord"));
		System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
		System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		int re = memberservice.reportPageNum(pageVO);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.reportselect(pageVO));
		mav.addObject("pageVO", pageVO); 
		mav.setViewName("/admin/customerBlackList");
		return mav;
	} 
	//신고 채팅 보기
	@RequestMapping("/csReportChat")
	public ModelAndView csReportChat(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		String pageNumStr = req.getParameter("pageNum");
		//검색어, 검색키
		String searchKey = req.getParameter("searchKey");
		
		pageVO.setSearchKey(searchKey);
		pageVO.setSearchWord(req.getParameter("searchWord"));
		System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
		System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		pageVO.setTotalRecord(memberservice.chatTotal(pageVO));
		mav.addObject("list", memberservice.chatList(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("/admin/csReportChat");
		return mav;
	} 
	
	// 정지일수 보기
	@RequestMapping("/csReportSum")
	@ResponseBody
	public int reportsum(HttpServletRequest req) {
		int result= 0;
		String userid = req.getParameter("userid");
		result = memberservice.sumreport(userid);
		return result;
	}
	// 정지횟수 보기
	@RequestMapping("/csReportCount")
	@ResponseBody
	public int reportcount(HttpServletRequest req) {
		int result= 0;
		String userid = req.getParameter("userid");
		result = memberservice.countreport(userid);
		return result;
	}  
	
	@RequestMapping("userstopsubmit")
	public ModelAndView userstopsubmit(Admin_reportVO vo){
		ModelAndView mav = new ModelAndView();
		String userid = vo.getUserid();
		int reportdate = vo.getReportdate();
		memberservice.insertreport(userid, reportdate);
		memberservice.updateuserstop(userid);
		mav.setViewName("redirect:csReportChat");
		return mav;
	}
}