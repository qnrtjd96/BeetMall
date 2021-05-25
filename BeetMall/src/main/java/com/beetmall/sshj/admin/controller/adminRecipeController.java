package com.beetmall.sshj.admin.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.adminRecipeServiceImp;
import com.beetmall.sshj.admin.vo.adminPageRecipeVO;
import com.beetmall.sshj.admin.vo.adminRecipeVO;



	@Controller
	public class adminRecipeController {

	@Inject
	adminRecipeServiceImp adminrecipeService;
//////////////////////////////////////////////////////////레시피 뷰///////////////////////////////////////////////////////////
	@RequestMapping("/adminrecipeView")
	public ModelAndView adminRecipeSelect(int recipenum,String id) {
		//////////2해당 게시글 보이게 하기----------
		ModelAndView mav=new ModelAndView();
        
		///여기까지 아이디랑 넘 넘어옴
		
		///조회수//
		adminrecipeService.adminrecipeHit(recipenum);
		
		
		
		//뷰어전체
	
		mav.addObject("vo", adminrecipeService.adminRecipeSelect(recipenum));		
		mav.setViewName("admin/adminrecipeView");

		return mav;
	}
	

//////////////////////////////////////////////////////////레시피 작성///////////////////////////////////////////////////////////	
	@RequestMapping("/adminrecipeWrite")
	public String adminRecipeWrite() {
		return "admin/adminrecipeWrite";
	}
	
	@RequestMapping(value="/adminrecipeWriteOk", method=RequestMethod.POST)
	public ModelAndView adminrecipeWriteOk(HttpSession session,adminRecipeVO vo, @RequestParam MultipartFile file, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		
    	//String userid = (String)req.getSession().getAttribute("logId");
		//파일업로드
		//저장 위치
		String userid = (String)session.getAttribute("logId");
		
		String path = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println("path --> " + path);
		
 //   	String paramName = recipemainimg.getName(); //매개변수 이름확인할라고 SYSOUT찎을라고만든거
		String orgName = file.getOriginalFilename();//원파일명
		
   
		//실제 업로드 발생 : tansferTo()
		try {
			if(orgName != null && !orgName.equals("")) {
				file.transferTo(new File(path, orgName));//파일업로드
				vo.setRecipemainimg(orgName);
				vo.setUserid(userid);
			}
		}catch (Exception e) {
			System.out.println("파일업로드 에러발생 --> " + e.getMessage());
		}
		
		int result = adminrecipeService.adminrecipeWriteOk(vo);
		////////////////////////////////////////
		//레코드 추가 실패시 파일을 삭제
		if(result<=0) {
			//첫번쨰 파일삭제
			if(orgName != null) {
				File f = new File(path, orgName);
				f.delete();
			}
			mav.setViewName("redirect:adminrecipeWrite"); //세팅이안됫을때
		}else {
			
			mav.setViewName("redirect:adminrecipeList"); //됬을때
		}
		
		
		
		mav.setViewName("redirect:adminrecipeList");
		
		return mav;
	}
	

//////////////////////////////////////////////////////////레시피 수정///////////////////////////////////////////////////////////
	//수정하기 뷰페이지로이동
		@RequestMapping("adminrecipeEdite")
		public ModelAndView adminrecipeEdite(int recipenum) {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("vo", adminrecipeService.adminRecipeSelect(recipenum));
			mav.setViewName("admin/adminrecipeEdite");
			
			return mav;
		}
		
		//수정하기
		@RequestMapping("/adminrecipeEditeOk")
		public ModelAndView adminrecipeEditeOk(adminRecipeVO vo) {
			ModelAndView mav = new ModelAndView();
			int result = adminrecipeService.adminrecipeEditeOk(vo);
			mav.addObject("recipenum", vo.getRecipenum());
			
			if(result>0) {
				mav.setViewName("redirect:adminrecipeView");
			}else {
				mav.setViewName("redirect:adminrecipeEdite");
			}
			return mav;
		}
	
//////////////////////////////////////////////////////////레시피 지우기///////////////////////////////////////////////////////////
	
	@RequestMapping("/adminrecipeDelete")
	@ResponseBody
	public int adminrecipeDelete(int recipenum) {
		int result=0;
		
		if(adminrecipeService.adminrecipeDelete(recipenum)>0){//삭제
			result=1;
		}else {//삭제실패
			result=0;
		}
		return result;
		
	}
	
	

//////////////////////////////////////////////////////////레시피 리스트///////////////////////////////////////////////////////////	
		
	@RequestMapping("/adminrecipeList")
	public ModelAndView adminRecipeAllList(HttpServletRequest req, HttpServletResponse res,adminPageRecipeVO pageVO) {
	
	ModelAndView mav=new ModelAndView();
	
	adminPageRecipeVO pageVO1 = new adminPageRecipeVO();
	
	 //////////1게시글 목록 뽑아내기
    String reqPageNum = req.getParameter("pageNum");
    
    if(reqPageNum == null) {
		pageVO1.setPageNum(1);
	}else if(reqPageNum != null) {
		pageVO1.setPageNum(Integer.parseInt(reqPageNum));
	}
	
  //검색어, 검색키
  	pageVO.setSearchKey(req.getParameter("searchKey"));
  	System.out.println("setSearchKey" + pageVO.getSearchKey());
  	System.out.println("setsearchWord" + pageVO.getSearchWord());
  	pageVO.setSearchWord(req.getParameter("searchWord"));
  	
  	pageVO1.setSearchKey(pageVO.getSearchKey());
  	pageVO1.setSearchWord(pageVO.getSearchWord());
  	
	System.out.println("setSearchKey1" + pageVO1.getSearchKey());
  	System.out.println("setsearchWord1" + pageVO1.getSearchWord());

	//총 레코드 수 구하기 
	pageVO1.setTotalRecord(adminrecipeService.admintotalRecord4(pageVO1));
	//System.out.println("totalrecord 레시피 ->" +  recipeService.totalRecord4(pageVO1)); //여기까지 나옴
	System.out.println("totalrecord8 레시피 ->" +  adminrecipeService.admintotalRecord8(pageVO1));
	mav.addObject("pageVO1", pageVO1);
    
	mav.addObject("list" , adminrecipeService.adminRecipeAllList(pageVO1));			
	mav.setViewName("admin/adminrecipeList");
	
	return mav;
	}
	

	
	
	


	
}
