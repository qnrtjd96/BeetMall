package com.beetmall.sshj.admin.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_MemberSellerService;
import com.beetmall.sshj.admin.service.Admin_MemberServiceImp;
import com.beetmall.sshj.admin.vo.Admin_MemberSellerVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.seller.service.SellerEditFarmService;
import com.beetmall.sshj.seller.vo.SellerEditFarmVO; 

@Controller
public class admin_sellerController {
	 
	//////////////////////판매자 관리////////////////////////////////
	@Inject
	Admin_MemberServiceImp memberservice;
	
	@Autowired
	Admin_MemberSellerService service;
	
	@Autowired
	SellerEditFarmService sellerService;
	
	//목록보기
		@RequestMapping("/sellerListA")
		public ModelAndView sellerListA(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int logType = 0;
			int selType = 2; // 판매자회원
			pageVO.setUserType(2); // 판매자회원만 조회할거라서 2;
			String pageNumStr = req.getParameter("pageNum");
			//검색어, 검색키
			String searchKey = req.getParameter("searchKey");
			if(searchKey != null) {
				if(searchKey.equals("userid")) {
					searchKey = "userid";
				}else if(searchKey.equals("useremail")) {
					searchKey = "storeemail";
				}else if(searchKey.equals("username")) {
					searchKey = "sellername";
				}
			}
			pageVO.setSearchKey(searchKey);
			pageVO.setSearchWord(req.getParameter("searchWord"));
			System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
			System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
			if(pageNumStr == null) {
				pageVO.setPageNum(1);
			}else if(pageNumStr != null) {
				pageVO.setPageNum(Integer.parseInt(pageNumStr));
			}
			//pageVO.setTotalRecord();
			if(session.getAttribute("logType")!=null) {
				logType = (int)session.getAttribute("logType");
			}else {
				logType = 0;
			}
			logType=3;
			int re = memberservice.memberCountSeller(pageVO);
			pageVO.setTotalRecord(re);
			System.out.println("re="+re);
			
			mav.addObject("list", memberservice.memberselectSellerAll(pageVO));
			mav.addObject("pageVO", pageVO);
			mav.setViewName("/admin/sellerListA");
			return mav;
		}
		
	//탈퇴 판매자 목록보기
		@RequestMapping("/sellerLeaveList")
		public ModelAndView sellerLeaveList(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int logType = 0;
			int selType = 5; // 탈퇴한 판매자회원
			pageVO.setUserType(5); // 탈퇴한 판매자회원만 조회할거라서 5;
			String pageNumStr = req.getParameter("pageNum");
			//검색어, 검색키
			String searchKey = req.getParameter("searchKey");
			if(searchKey != null) {
				if(searchKey.equals("userid")) {
					searchKey = "userid";
				}else if(searchKey.equals("useremail")) {
					searchKey = "storeemail";
				}else if(searchKey.equals("username")) {
					searchKey = "sellername";
				}
			}
			pageVO.setSearchKey(searchKey);
			pageVO.setSearchWord(req.getParameter("searchWord"));
			System.out.println("getSearchKey>>>>>"+pageVO.getSearchKey());
			System.out.println("getSearchWord>>>>>"+pageVO.getSearchWord());
			if(pageNumStr == null) {
				pageVO.setPageNum(1);
			}else if(pageNumStr != null) {
				pageVO.setPageNum(Integer.parseInt(pageNumStr));
			}
			//pageVO.setTotalRecord();
			if(session.getAttribute("logType")!=null) {
				logType = (int)session.getAttribute("logType");
			}else {
				logType = 0;
			}
			int re = memberservice.memberCountSeller(pageVO);
			pageVO.setTotalRecord(re);
			
			mav.addObject("list", memberservice.memberselectSeller(pageVO));
			mav.addObject("pageVO", pageVO);
			mav.setViewName("/admin/sellerLeaveList");
			return mav;
		}
	//판매자 블랙리스트 보기
		@RequestMapping("/sellerBlackList")
		public ModelAndView sellerBlackList(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int selType = 2; // 정지된 판매자회원
			pageVO.setUserType(2); // 정지된 판매자회원만 조회할거라서 2;
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
			mav.setViewName("/admin/sellerBlackList");
			return mav;
		} 
		
		//판매자 정보 수정
		@RequestMapping("/sellerInfoEditA")
		public ModelAndView sellerInfoEditA(HttpServletRequest req) {
			ModelAndView mav = new ModelAndView();
			String userid= req.getParameter("userid");
			System.out.println(userid);
			mav.addObject("reportData", service.getReportData(userid));
			mav.addObject("discountSelect",service.discountSelect(userid));
			mav.addObject("sellerData",service.getSellerData(userid));
			mav.addObject("selectFavorite",service.selectFavorite(userid));
			
			
			mav.setViewName("/admin/sellerInfoEditA");
			return mav;
		} 
		 
		// 사업자 등록 업데이트
		@RequestMapping("/AdminSellerRegiaUpdate")
		@ResponseBody
		public int regiapprovalUpdate(HttpServletRequest req) {
			int num = Integer.parseInt((String)req.getParameter("num"));
			String userid = (String)req.getParameter("userid");
			System.out.println(userid);
			
			int result = 0;
			if( num == 1) {
				result = service.regiapprovalOkUpdate(userid);
			} else {
				result = service.regiapprovalNoUpdate(userid);
			}
			
			return result;
		}
		
		@RequestMapping(value="/adminEditFarmUpdate",method= RequestMethod.POST)
		public ModelAndView adminEditFarmUpdate(HttpSession session, HttpServletRequest req, Admin_MemberSellerVO vo) {
			ModelAndView mav = new ModelAndView();
			
			// 저장위치를 구한다
			String path = session.getServletContext().getRealPath("/resources/sellerprofileimg");
			
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			
			MultipartFile mf = mr.getFile("filename");
			String delFilename = vo.getFarmprofile();
			String orgName = mf.getOriginalFilename(); // 원래 파일명
			if(mf.getSize() != 0 ) {
				// farmprofile 새로운 이미지를 등록한다
				
				// db에 등록되어 있는 파일명을 가져온다
				String checkImg = sellerService.getImgName((int)vo.getStorenum());
				
				
				if(orgName != null && !orgName.equals("")) {
					
					File ff = new File(path,orgName);
					int i = 0;
					while(ff.exists()) {
						int pnt = orgName.lastIndexOf(".");
						System.out.println(orgName);
						
						String firstName = orgName.substring(0,pnt);
						String extName = orgName.substring(pnt+1);
						
						ff = new File(path, firstName + "("+ ++i + ")." + extName);
								
					}
					
					try {
						mf.transferTo(ff);
						
					}catch(Exception e) {
						System.out.println("업로드 에러....");
						e.printStackTrace();
					}
					
					vo.setFarmprofile(ff.getName());
				}
				
				// 업데이트문
				int result1 = service.farmUpdate(vo);
				int result2 = service.sellerUpdate(vo);
				
				if( result1>0 && result2>0) {
					//수정 성공
					
					//기존에 있던 파일은 삭제한다.
					try {
						File delFile = new File(path,delFilename);
						delFile.delete();
					} catch(Exception e) {
						e.printStackTrace();
					}
					
					mav.setViewName("redirect:sellerInfoEditA?userid="+vo.getUserid());
				} else {
					// 수정 실패
					
					try {
						File delFile = new File(path,vo.getFarmprofile());
						delFile.delete();
					}catch(Exception e) {
						e.printStackTrace();
					}
					mav.setViewName("redirect:sellerInfoEditA?userid="+vo.getUserid());
				}
				
			} else {
				// 새로운 이미지를 등록하지 않는다
				// 업데이트문
				int result1 = service.farmUpdate(vo);
				
				int result2 = service.sellerUpdate(vo);
				
				if( result1>0 && result2>0) {
					//수정 성공
					
					mav.setViewName("redirect:sellerInfoEditA?userid="+vo.getUserid());
				} else {
					// 수정 실패
					
					mav.setViewName("redirect:sellerInfoEditA?userid="+vo.getUserid());
				}		
			}
			
			
			
			
			return mav;
		}
	 
}