package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_ChatVO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.Admin_PointVO;
import com.beetmall.sshj.admin.vo.Admin_WishVO;
import com.beetmall.sshj.admin.vo.Admin_farmVO;
import com.beetmall.sshj.admin.vo.Admin_reportVO;

public interface Admin_MemberDAO {
	public int memberCountall(Admin_Member_PageVO vo);	// 모든 회원 정보(탈퇴 제외)
	public List<Admin_MemberVO> memberselectall(Admin_Member_PageVO pageVO);
	public int memberCount(Admin_Member_PageVO vo); // 특정조건 회원 정보(탈퇴, 구매, 판매 등으로 나누는 것)
	public List<Admin_MemberVO> memberselect(Admin_Member_PageVO pageVO);
	public int memberCountBlack(Admin_Member_PageVO vo);	// 블랙회원 정보
	public List<Admin_MemberVO> memberselectblack(Admin_Member_PageVO pageVO);
	public int memberCountSeller(Admin_Member_PageVO vo);	// 판매자 정보
	public List<Admin_MemberVO> memberselectSeller(Admin_Member_PageVO pageVO);
	public List<Admin_MemberVO> memberselectSellerAll(Admin_Member_PageVO pageVO);
	// 회원정보 부분
	public Admin_MemberVO memberinfoSelect(String userid);
	public List<Admin_MemberVO> orderinfoSelect(String userid);
	public Admin_MemberVO reportinfoSelect(String userid);
	public int orderstatusSelect(String userid, String status);
	public int memberEdit(Admin_MemberVO vo);// 회원정보 수정
	// 포인트 부분
	public List<Admin_PointVO> selectPoint(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointType(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointMonth(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointTypeMonth(Admin_Member_PageVO vo);
	public int countPoint(String userid);
	public int countPointType(String userid, String type);
	public int countPointMonth(String userid, int month);
	public int countPointTypeMonth(String userid, String type, int month);
	public int myPointView(String userid);
	// 농장 부분
	public int farmCount(String userid);
	public List<Admin_farmVO> farmFavoriteList(Admin_Member_PageVO pageVO);
	// 장바구니 부분
	public int wishCount(String userid);
	public List<Admin_WishVO> wishListSelect(Admin_Member_PageVO pageVO);
	public List<Admin_reportVO> reportselect(Admin_Member_PageVO vo);// 블랙회원()
	public int reportPageNum(Admin_Member_PageVO vo);	// 블랙회원 레코드 수
	
	// 채팅목록 부분
	public int chatTotal(Admin_Member_PageVO pageVO);
	public List<Admin_ChatVO> chatList(Admin_Member_PageVO pageVO);
	public int countreport(String userid);// 신고횟수 가져오기
	public int sumreport(String userid); // 정지일수 가져오기
	public int insertreport(String userid, int reportdate);	// reporttbl에 작성하고
	public int updateuserstop(String userid);	// member테이블 수정하기
	
}
