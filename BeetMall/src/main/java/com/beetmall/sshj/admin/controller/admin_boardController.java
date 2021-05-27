package com.beetmall.sshj.admin.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.beetmall.sshj.admin.dao.AdminBoardDAO;
import com.beetmall.sshj.admin.service.Admin_BoardService;
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;

@Controller
public class admin_boardController {
	@Inject
	Admin_BoardService boardService;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	

	////////////////////// 공지 관리/////////////////////////////////////
	// 공지 목록 보기
	@RequestMapping("/noticeBoardList")
	public ModelAndView noticeBoardList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Admin_Board_PageVO pageVO = new Admin_Board_PageVO();

		String pageNumStr = req.getParameter("pageNum");
		if (pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		String type = req.getParameter("type");
		System.out.println("type = " + type);
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(boardService.noticeOnetotalRecord(pageVO));

		mav.addObject("list", boardService.noticeBoardList(pageVO));
		mav.addObject("pageVO", pageVO);

		mav.setViewName("/admin/noticeBoardList");

		return mav;
	}

	// 공지 작성하기
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		return "/admin/noticeBoardWrite";
	}

	// 공지 작성하기
	@Transactional(rollbackFor = { Exception.class, RuntimeException.class })
	@RequestMapping(value = "/noticeWriteOk", method = RequestMethod.POST)
	public ModelAndView noticeBoardWriteOk(AdminBoardVO vo, @RequestParam MultipartFile file, HttpSession session, HttpServletRequest req) {
		 // 첨부파일 받아오기
		vo.setFilename(file.getOriginalFilename()); 
		System.out.println("file -> " + file);

		// 이미지 파일 변수 및 저장 위치 
		String orgName = file.getOriginalFilename();
		System.out.println("orgName ->" + orgName); 
		String path = req.getSession().getServletContext().getRealPath("resources/adminImg");
		System.out.println("path ->" + path);
		ModelAndView mav = new ModelAndView();
		
		// session userid
		vo.setUserid((String) session.getAttribute("logId"));
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			// -----------------------이미지 등록 (파일 업로드)--------------------------------
			String paramName = file.getName();
			System.out.println(paramName + " - 업로드 과정");
			try {
				System.out.println("orgName1111111111111111 = " + orgName);
				if (orgName != null && orgName!="") {
					System.out.println("이미지 업로드 시작");
					File f = new File(path, orgName);
					int i = 1;
					while (f.exists()) {
						int point = orgName.lastIndexOf(".");
						String name = orgName.substring(0, point);
						String extName = orgName.substring(point + 1);

						f = new File(path, name + "_" + i++ + "." + extName);
						System.out.println("f->" + f);
					} // while
					orgName = f.getName();
					System.out.println("orgName->" + orgName);
					try {
						file.transferTo(new File(path, orgName));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 추가하지 않으면 값을 지정해서 넣어준다.
			System.out.println("vo에 set해주는 이미지 이름 orgName -> " + orgName);
			vo.setFilename(orgName);
			// 공지등록
			int result = boardService.noticeWriteOk(vo);
			System.out.println("공지 insert 1=성공 -> " + result);

			if (result > 0) { // 글 등록 성공
				System.out.println("[공지 등록 완료]");
				transactionManager.commit(status);
				mav.setViewName("redirect:noticeBoardList");
			} else {// 글 등록 실패
				System.out.println("[공지 등록 실패]");
				mav.setViewName("/admin/noticeBoardWrite");
			}
		} catch (Exception e) {
			System.out.println("<<공지등록 트랜잭션 에러 발생>>");
			e.printStackTrace();
			if(orgName != null) {
				File delf = new File(path, orgName);
				delf.delete();
			}
		}
		return mav;
	}

	// 공지 보기
	@RequestMapping("noticeBoardView")
	public ModelAndView noticeBoardView(int infonum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", boardService.noticeBoardView(infonum)); 
		mav.setViewName("admin/noticeBoardView");
		return mav;
	}

	

	// 공지 수정하기로 이동
	@RequestMapping("/noticeBoardEdit")
	public ModelAndView noticeBoardEdit(int infonum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", boardService.noticeBoardView(infonum));
		mav.setViewName("/admin/noticeBoardEdit");
		return mav;
	}

	// 공지 수정하기
	@Transactional(rollbackFor = { Exception.class, RuntimeException.class })
	@RequestMapping(value = "/noticeBoardEditOk", method = RequestMethod.POST)
	public ModelAndView noticeBoardEditOk(AdminBoardVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		// 데이터베이스의 파일명을 가져온다
		String selFile = Integer.toString(vo.getInfonum());

		MultipartHttpServletRequest multireq = (MultipartHttpServletRequest) req;

		MultipartFile file = multireq.getFile("file");
		if (file == null) {
			return mav;
		}
		
		vo.setFilename(file.getOriginalFilename());

		System.out.println("multireq ->" + multireq);
		System.out.println("file -> " + file);

		String path = req.getSession().getServletContext().getRealPath("resources/adminImg");
		System.out.println("path ->" + path);

		File upload = new File(path, selFile);
		try {
			file.transferTo(upload);
		} catch (Exception e) {
			e.printStackTrace();		
		}

		// session userid
		vo.setUserid((String) session.getAttribute("logId"));
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);

		// 공지수정
		int result = boardService.noticeBoardEditOk(vo);
		System.out.println("공지 수정 -> " + result);

		if (result > 0) { // 글 등록 성공
			System.out.println("[공지 수정 완료]");
			transactionManager.commit(status);
			mav.addObject("vo", boardService.noticeBoardView(vo.getInfonum()));
			mav.setViewName("/admin/noticeBoardView");
		} else {// 글 등록 실패
			System.out.println("[공지 수정 실패]");
			mav.setViewName("/admin/noticeBoardEdit");
		}
	
		return mav;
	}

	// 공지 삭제하기
	@RequestMapping("/noticeBoardDelete")
	public ModelAndView noticeBoardDelete(int infonum) {
		ModelAndView mav = new ModelAndView();

		if (boardService.noticeBoardDelete(infonum) > 0) {// 삭제 성공시
			mav.setViewName("redirect:noticeBoardList");
		} else {// 삭제 실패
			mav.addObject("infonum", infonum);
			mav.setViewName("redirect:noticeBoardEdit");
		}
		return mav;
	}

}
