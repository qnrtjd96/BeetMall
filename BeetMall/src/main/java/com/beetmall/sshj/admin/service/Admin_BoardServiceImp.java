package com.beetmall.sshj.admin.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.dao.AdminBoardDAO; 
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO; 
 
@Service
public class Admin_BoardServiceImp implements Admin_BoardService {
	
	@Inject
	AdminBoardDAO boardDAO;

	@Override
	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO) { 
		return boardDAO.noticeBoardList(pageVO);
	}
 
	@Override
	public int noticeWriteOk(AdminBoardVO vo) { 
		return boardDAO.noticeWriteOk(vo);
	}

	@Override
	public AdminBoardVO noticeBoardView(int infonum) { 
		return boardDAO.noticeBoardView(infonum);
	}

	@Override
	public int noticeBoardDelete(int infonum) { 
		return boardDAO.noticeBoardDelete(infonum);
	}
 
 
	@Override
	public int noticeBoardEditOk(AdminBoardVO vo) { 
		return boardDAO.noticeBoardEditOk(vo);
	}

	@Override
	public int noticeOnetotalRecord(Admin_Board_PageVO pageVO) { 
		return boardDAO.noticeOnetotalRecord(pageVO);
	}
}
