package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_FaqVO;

public interface Admin_FaqService {
	// 데이터 리스트 가져오기
	public List<Admin_FaqVO> getList(Admin_FaqVO vo);
	// 총 갯수 가져오기
	public int getLength(Admin_FaqVO vo);
	// 선택한 글내용
	public Admin_FaqVO getBoard(Admin_FaqVO vo);
	// 글삭제
	public int deleteBoard(Admin_FaqVO vo);
	// 글 작성
	public int insertBoard(Admin_FaqVO vo);
	// 글 수정
	public int updateBoard(Admin_FaqVO vo);
}
