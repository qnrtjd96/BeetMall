package com.beetmall.sshj.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;
 

public interface Admin_BoardService {

	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO);   
	public int noticeWriteOk(AdminBoardVO vo); 
	public AdminBoardVO noticeBoardView(int infonum);
	public int noticeBoardDelete(int infonum);   
	public int noticeBoardEditOk(AdminBoardVO vo);  
	//파일 선택
	public AdminBoardVO dataSelect(int infonum);
	//파일명 선택
	public AdminBoardVO getSelectFilename(int infonum);
	//레코드 수정
	public int dataUpdate(AdminBoardVO infonum);
	//레코드 삭제
	public int dataDelete(int infonum);
	 
	
}
