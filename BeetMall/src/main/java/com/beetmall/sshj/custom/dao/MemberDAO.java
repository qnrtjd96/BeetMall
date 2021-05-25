package com.beetmall.sshj.custom.dao;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;

public interface MemberDAO {
	public int regiFinishiOk(MemberVO vo);	// 회원가입 완료
	public int idOverlap(String userid);	// 아이디 중복검사
	public MemberVO loginOk(String userid, String userpwd);	// 로그인
	public String infoSelect(String infoname);	// 약관조회
	public int sellerRegiFinishiOk(SellerMemberVO svo);
	public int farmInsert(CategoryFarmVO cvo);
	public int selectDelOk(String userid);
	public int deleteId(String userid);
	public int selectId(String userid, String userpwd);
	public String stopdate(String userid);
	public int member2Insert(String userid);
	public MemberVO idFind(String email);// 아디찾기
	public int pwdfind(String userid, String useremail);	// 비번찾기
	public int pwdupdate(String userid, String temppwd);	// 임시비번 설정
	public int usertypetest(String userid);	// 유저 유형 검색
	public int checkuseridNpwd(String userid, String pwd);	// 아이디가 있나 없나부터 확인
	public int editinfoOk(MemberVO vo2);	// 회원수정 완료
	public MemberVO editinfoOkView(MemberVO vo3);//회원수정 열람
	
}
