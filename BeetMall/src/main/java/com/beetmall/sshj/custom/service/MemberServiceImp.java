package com.beetmall.sshj.custom.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.MemberDAO;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;
@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO memberDAO;

	@Override
	public int regiFinishiOk(MemberVO vo) {	//회원가입 완료
		return memberDAO.regiFinishiOk(vo);
	}

	@Override
	public int idOverlap(String userid) {
		return memberDAO.idOverlap(userid);
	}

	@Override
	public MemberVO loginOk(String userid, String userpwd) {
		return memberDAO.loginOk(userid, userpwd);
	}

	@Override
	public String infoSelect(String infoname) {
		return memberDAO.infoSelect(infoname);
	}

	@Override
	public int sellerRegiFinishiOk(SellerMemberVO svo) {
		return memberDAO.sellerRegiFinishiOk(svo);
	}

	@Override
	public int farmInsert(CategoryFarmVO cvo) {
		return memberDAO.farmInsert(cvo);
	}

	@Override
	public int selectDelOk(String userid) {
		return memberDAO.selectDelOk(userid);
	}

	@Override
	public int deleteId(String userid) {
		return memberDAO.deleteId(userid);
	}

	@Override
	public int selectId(String userid, String userpwd) {
		return memberDAO.selectId(userid, userpwd);
	}

	@Override
	public String stopdate(String userid) {
		return memberDAO.stopdate(userid);
	}

	@Override
	public int member2Insert(String userid) {
		return memberDAO.member2Insert(userid);
	}

	@Override
	public MemberVO idFind(String email) {
		return memberDAO.idFind(email);
	}

	@Override
	public int pwdfind(String userid, String useremail) {
		return memberDAO.pwdfind(userid, useremail);
	}

	@Override
	public int pwdupdate(String userid, String temppwd) {
		return memberDAO.pwdupdate(userid, temppwd);
	}

	@Override
	public int usertypetest(String userid) {
		return memberDAO.usertypetest(userid);
	}

	@Override
	public int checkuseridNpwd(String userid, String pwd) {
		return memberDAO.checkuseridNpwd(userid, pwd);
	}

}
