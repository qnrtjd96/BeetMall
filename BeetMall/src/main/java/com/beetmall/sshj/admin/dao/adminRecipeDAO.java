package com.beetmall.sshj.admin.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.beetmall.sshj.admin.vo.adminPageRecipeVO;
import com.beetmall.sshj.admin.vo.adminRecipeVO;




public interface adminRecipeDAO {

	public List<adminRecipeVO>adminRecipeAllList(adminPageRecipeVO pageVO1);

	public int adminrecipeWriteOk(adminRecipeVO vo);
	
	public int adminRecipeLastSelect(adminRecipeVO vo);
	
	public adminRecipeVO adminRecipeSelect(int recipenum);
	
	public int adminrecipeDelete(int recipenum);

	public int adminrecipeEditeOk(adminRecipeVO vo);
	
	public int adminrecipeHit(int data);
	
	public int admintotalRecord4(adminPageRecipeVO pageVO1);	
	public int admintotalRecord5(adminPageRecipeVO pageVO2);
	
	public int admintotalRecord6(String userid);
	public int admintotalRecord7(String userid);

	public int admintotalRecord8(adminPageRecipeVO pageVO1);
	
	
	
}
