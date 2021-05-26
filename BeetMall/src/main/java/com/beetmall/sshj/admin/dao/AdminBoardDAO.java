package com.beetmall.sshj.admin.dao;

import java.util.List;


import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
  
public interface AdminBoardDAO {
	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO); //공지 글 목록 보기
	public int noticeAllRecord(Admin_Board_PageVO pageVO); 
	public AdminBoardVO noticeBoardView(int infonum); 
	public int noticeWriteOk(AdminBoardVO vo); //새 공지 쓰기  
	public int noticeBoardEditOk(AdminBoardVO vo);//공지 수정
	public int noticeBoardDelete(int infonum); //공지 삭제 
	public int noticeOnetotalRecord(Admin_Board_PageVO pageVO);

}
