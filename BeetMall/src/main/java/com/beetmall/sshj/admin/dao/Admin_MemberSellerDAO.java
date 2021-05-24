package com.beetmall.sshj.admin.dao;

import com.beetmall.sshj.admin.vo.Admin_MemberSellerVO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;

public interface Admin_MemberSellerDAO {
	
	// 판매자 정보수정
	public Admin_MemberSellerVO getSellerData(String userid);	
	// 판매자 신고기록
	public Admin_MemberSellerVO getReportData(String userid);
	// 할인
	public Admin_MemberSellerVO discountSelect(String userid);
	// 즐겨찾기
	public int selectFavorite(String userid);
	
}
