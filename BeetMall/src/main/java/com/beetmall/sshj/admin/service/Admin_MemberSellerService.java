package com.beetmall.sshj.admin.service;

import com.beetmall.sshj.admin.dao.Admin_MemberSellerDAO;
import com.beetmall.sshj.admin.vo.Admin_MemberSellerVO;

public interface Admin_MemberSellerService {
	// 판매자 정보수정
	public Admin_MemberSellerVO getSellerData(String userid);	
	// 판매자 신고기록
	public Admin_MemberSellerVO getReportData(String userid);
	// 할인
	public Admin_MemberSellerVO discountSelect(String userid);
	// 즐겨찾기
	public Long selectFavorite(String userid);
	
	// 사업자 등록 인증확인
	public Integer regiapprovalOkUpdate(String userid);
	// 사업자 등록 인증 반려
	public Integer regiapprovalNoUpdate(String userid);
}
