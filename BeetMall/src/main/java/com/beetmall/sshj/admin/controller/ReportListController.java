package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.ReportListService;
import com.beetmall.sshj.admin.vo.ReportListVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Controller
public class ReportListController {
	@Inject
	ReportListService reportListService;
	
//	//신고 목록 보기
//	@RequestMapping("/csreportListA")
//	public String qwer() {
//		return "/admin/csreportListA";
//	} 
	
	//신고 목록 보기
	@RequestMapping("/csreportListA")
	public ModelAndView csreportListA(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(reportListService.csreportOnetotalRecord(pageVO));
		
		mav.addObject("list", reportListService.csreportList(pageVO));
		ReportListVO vo  = new ReportListVO();
		System.out.println(vo.getReportboard());
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/csreportListA");
		return mav;
	}
	
	//신고 목록보기에서 제목클릭하면 들어가는 페이지( 각 신고당한 페이지로 이동해야함)
	@RequestMapping("/csReportSelect")
	public ModelAndView csReportSelect(int reportnum) {
		ModelAndView mav = new ModelAndView();
		ReportListVO vo  = new ReportListVO();
		
		vo = reportListService.csreportSelect(reportnum);
		
		String boardname = vo.getReportboard();
		System.out.println("boardname = " + boardname);
		
		int report = vo.getReportboardnum();
		mav.addObject("report", report);
		
		if(boardname.equals("문의")) {
			mav.setViewName("/custom/customproduct");
		}else if(boardname.equals("리뷰")){
			mav.setViewName("/custom/customproduct");
		}else{//레시피
			mav.setViewName("/custom/recipeView"); //이부분바꿔야함
		}
		
		return mav;
	}
}
