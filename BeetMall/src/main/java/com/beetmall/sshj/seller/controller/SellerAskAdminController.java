package com.beetmall.sshj.seller.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerAskAdminService;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerAskAdminVO;
import com.google.gson.JsonObject;

@Controller
public class SellerAskAdminController {
	@Inject
	SellerAskAdminService sellerAskAdminService;
	
	// 내가 쓴 문의하기 글 목록
	@RequestMapping("/ask_admin_list")
	public ModelAndView askAllRecord(SearchAndPageVO sapvo, SellerAskAdminVO saavo,HttpSession session,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		// 페이징처리
		String reqPageNum = req.getParameter("pageNum"); // pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if (reqPageNum != null) { // 리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
			sapvo.setPageNum(Integer.parseInt(reqPageNum));
		}
		// 로그인한 회원의 문의목록만 보여주기
		sapvo.setUserid((String) session.getAttribute("logId"));
		// 검색어
		sapvo.setSearchWord(req.getParameter("searchWord"));
		System.out.println("askadmin searchword->" + sapvo.getSearchWord());
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(sellerAskAdminService.totalRecord(sapvo));
		
		System.out.println("userid : " + sapvo.getUserid());
		System.out.println("qmnum : "+ saavo.getQmnum());
		System.out.println("qmdate:"+saavo.getQmdate());
		
		mav.addObject("list", sellerAskAdminService.askAllRecord(sapvo));	
		mav.addObject("sapvo", sapvo);
		
		mav.setViewName("seller/ask_admin_list");
		return mav;
	}

	// 문의한 글보기
	@RequestMapping("/ask_admin_view")
	public ModelAndView askSelect(int qmnum, HttpSession session, SellerAskAdminVO saavo) {
		ModelAndView mav = new ModelAndView();
		saavo.setUserid((String) session.getAttribute("logId"));
		mav.addObject("saavo", sellerAskAdminService.askSelect(qmnum));
		mav.setViewName("seller/ask_admin_view");
		return mav;
	}

	// 문의하기 폼으로 이동
	@RequestMapping("/ask_admin_write")
	public ModelAndView askWriteForm(SellerAskAdminVO saavo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		saavo.setUserid((String) session.getAttribute("logId"));
		mav.setViewName("seller/ask_admin_write");

		return mav;
	}

	// 문의하기
	@RequestMapping(value = "/ask_admin_write_ok", method = RequestMethod.POST)
	public ModelAndView askWrite(SellerAskAdminVO saavo, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		saavo.setUserid((String) session.getAttribute("logId"));	
		mav.addObject("logId", saavo.getUserid());
		int result = sellerAskAdminService.askWrite(saavo);
		if (result > 0) {
			mav.setViewName("redirect:ask_admin_list");
		} else {
			mav.setViewName("redirect:ask_admin_write");
		}
		return mav;
	}

	// 수정하기 폼으로 이동
	@RequestMapping("/ask_admin_edit")
	public ModelAndView askEdit(int qmnum) {
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("saavo", sellerAskAdminService.askSelect(qmnum));
		mav.setViewName("seller/ask_admin_edit");
		return mav;
	}

	// 수정하기
	@RequestMapping(value = "/ask_admin_edit_ok", method = RequestMethod.POST)
	public ModelAndView askEditOk(SellerAskAdminVO saavo) {

		ModelAndView mav = new ModelAndView();
		
		// 수정여부에 따라 뷰 이동
		int result = sellerAskAdminService.askEditOk(saavo);
		mav.addObject("qmnum", saavo.getQmnum());
		if (result > 0) {
			System.out.println("수정완료");
			mav.setViewName("redirect:ask_admin_list");
		} else {
			System.out.println("수정실패");
			mav.setViewName("redirect:ask_admin_edit");
		}
		return mav;
	}

	// 삭제하기
	@RequestMapping("/ask_admin_delete")
	public ModelAndView askDelete(@RequestParam(value="qmnum") int qmnum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qmnum", qmnum);
		int result = sellerAskAdminService.askDelete(qmnum);
		if (result > 0) {
			mav.setViewName("redirect:ask_admin_list");
		} else {
			mav.setViewName("redirect:ask_admin_view");
		}
		return mav;
	}

	
	//-----------------서머노트 이미지업로드부분-------------------------------
	/*
	 * @RequestMapping(value="/uploadSummernoteImageFile", produces =
	 * "application/json; charset=utf8")
	 * 
	 * @ResponseBody public String uploadSummernoteImageFile(@RequestParam("file")
	 * MultipartFile multipartFile, HttpServletRequest request){ JsonObject
	 * jsonObject = new JsonObject();
	 * 
	 * // 내부경로로 저장 String contextRoot = new
	 * HttpServletRequestWrapper(request).getRealPath("/"); String fileRoot =
	 * contextRoot+"resources/fileupload/";
	 * 
	 * String originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명
	 * String extension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
	 * String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
	 * 
	 * File targetFile = new File(fileRoot + savedFileName); try { InputStream
	 * fileStream = multipartFile.getInputStream();
	 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
	 * jsonObject.addProperty("url", "resources/fileupload/"+savedFileName); //
	 * contextroot + resources + 저장할 내부 폴더명 jsonObject.addProperty("responseCode",
	 * "success"); } catch (IOException e) { FileUtils.deleteQuietly(targetFile);
	 * //저장된 파일 삭제 jsonObject.addProperty("responseCode", "error");
	 * e.printStackTrace(); } String a = jsonObject.toString(); return a; }
	 */
}