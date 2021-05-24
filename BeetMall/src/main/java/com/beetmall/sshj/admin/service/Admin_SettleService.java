package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_SettleVO;

public interface Admin_SettleService {
	// 데이터 수
	public int getSettleLength(Admin_SettleVO vo);
	// 데이터 리스트
	public List<Admin_SettleVO> getSettleList(Admin_SettleVO vo);
	// 정산금액 가져오기
	public Admin_SettleVO getSettleMoney();
	// 정산하기
	public int settleUpdate();
	// 엑셀 데이터
	public List<Admin_SettleVO> adminSettleExcel(Admin_SettleVO vo);
}
