package com.beetmall.sshj.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_DesignService;
import com.beetmall.sshj.admin.service.adminProductService;
import com.beetmall.sshj.admin.vo.Admin_DesignPageVO;
import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.custom.vo.PopupVO;

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
		mav.addObject("listTitleB", designservice.designname(2));
		mav.addObject("listC", designservice.designselect(3));
		mav.addObject("listTitleC", designservice.designname(3));
		mav.addObject("popup", designservice.popupSelect());
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
	
	@RequestMapping("mcatechange")
	@ResponseBody
	public int mcateChange(HttpServletRequest req) {
		int result = 0;
		int catesort = 0;
		int catenum = 0;
		int productnum = 0;
		if(req.getParameter("catesort")!= null) {
			catesort = Integer.parseInt(req.getParameter("catesort"));
		}
		if(req.getParameter("catenum")!= null) {
			catenum = Integer.parseInt(req.getParameter("catenum"));
		}
		if(req.getParameter("productnum")!= null) {
			productnum = Integer.parseInt(req.getParameter("productnum"));
		}
		result = designservice.maincateEdit(catesort, catenum, productnum);
		
		return result;
	}
	@RequestMapping("cateremove")
	@ResponseBody
	public int mcateRemove(HttpServletRequest req) {
		int result = 0;
		int catesort = 0;
		int catenum = 0;
		int productnum = -1;
		if(req.getParameter("catesort")!= null) {
			catesort = Integer.parseInt(req.getParameter("catesort"));
		}
		if(req.getParameter("catenum")!= null) {
			catenum = Integer.parseInt(req.getParameter("catenum"));
		}
		
		result = designservice.maincateEdit(catesort, catenum, productnum);
		
		return result;
	}
	@RequestMapping("catetitlechange")
	@ResponseBody
	public int catetitleEdit(HttpServletRequest req) {
		int result = 0;
		String orgtitle = req.getParameter("orgtitle");
		String tmptitle = req.getParameter("tmptitle");
		result = designservice.titleChange(orgtitle, tmptitle);
		return result;
	}
	
	@RequestMapping(value="popupsetting", method=RequestMethod.POST)
	public ModelAndView popupset(HttpServletRequest req, HttpSession session, PopupVO vo, @RequestParam MultipartFile file) {
		ModelAndView mav = new ModelAndView();
		System.out.println("getPopupheight >>"+vo.getPopupheight());
		System.out.println("getPopupimg >>"+vo.getPopupimg());
		System.out.println("getPopuplink >>"+vo.getPopuplink());
		System.out.println("getPopupterm >>"+vo.getPopupterm());
		System.out.println("getPopupwidth >>"+vo.getPopupwidth());
		// 찍어본 부분
		String orgName = file.getOriginalFilename();
		String path = req.getSession().getServletContext().getRealPath("resources/popupimgs");
		designservice.popdel();
		
		try {
			if(orgName != null) {
				File f = new File(path, orgName);
				int i = 1;
				while(f.exists()) {
					int point = orgName.lastIndexOf(".");
					String name = orgName.substring(0, point);
					String extName = orgName.substring(point+1);
					
					f = new File(path, name+"_"+ i++ + "." + extName);
				}// while
				orgName = f.getName();
				
				try {
					file.transferTo(new File(path,orgName));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			if(orgName != null) {
				File delf = new File(path, orgName);
				delf.delete();
			}
		}
		vo.setPopupimg(orgName);
		designservice.popInsert(vo);
		mav.setViewName("redirect:boardDesignMng");
		return mav;
	}
}
