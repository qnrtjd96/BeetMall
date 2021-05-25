package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.vo.adminPageRecipeVO;
import com.beetmall.sshj.admin.vo.adminRecipeVO;
import com.beetmall.sshj.admin.dao.adminRecipeDAO;



@Service
public class adminRecipeServiceImp implements adminRecipeService {

	@Inject
	adminRecipeDAO adminRecipeDAO;
	
	@Override
	public List<adminRecipeVO> adminRecipeAllList(adminPageRecipeVO pageVO1) {
		
		return adminRecipeDAO.adminRecipeAllList(pageVO1);
	}

	public int adminrecipeWriteOk(adminRecipeVO vo) {
		return adminRecipeDAO.adminrecipeWriteOk(vo);
	}

	@Override
	public adminRecipeVO adminRecipeSelect(int recipenum) {
		
		return adminRecipeDAO.adminRecipeSelect(recipenum);
	}


	@Override
	public int adminRecipeLastSelect(adminRecipeVO vo) {
		
		return  adminRecipeDAO.adminRecipeLastSelect(vo);
	}

	
	@Override
	public int adminrecipeEditeOk(adminRecipeVO vo) {
		
		return adminRecipeDAO.adminrecipeEditeOk(vo);
	}

	@Override
	public int adminrecipeDelete(int recipenum) {
		
		return adminRecipeDAO.adminrecipeDelete(recipenum);
	}


	@Override
	public int adminrecipeHit(int data) {
		
		return adminRecipeDAO.adminrecipeHit(data);
	}


	@Override
	public int admintotalRecord4(adminPageRecipeVO pageVO1) {
		// TODO Auto-generated method stub
		return adminRecipeDAO.admintotalRecord4(pageVO1);
	}

	@Override
	public int admintotalRecord5(adminPageRecipeVO pageVO2) {
		
		return adminRecipeDAO.admintotalRecord4(pageVO2);
	}

	@Override
	public int admintotalRecord6(String userid) {
		// TODO Auto-generated method stub
		return adminRecipeDAO.admintotalRecord6(userid);
	}

	@Override
	public int admintotalRecord7(String userid) {
		// TODO Auto-generated method stub
		return adminRecipeDAO.admintotalRecord7(userid);
	}

	public int admintotalRecord8(adminPageRecipeVO pageVO1) {
		// TODO Auto-generated method stub
		return adminRecipeDAO.admintotalRecord8(pageVO1);
	}




	
}
