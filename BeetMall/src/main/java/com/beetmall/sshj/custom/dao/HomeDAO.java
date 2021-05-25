package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.HomeVO;
import com.beetmall.sshj.custom.vo.PopupVO;
import com.beetmall.sshj.custom.vo.RecipeVO;

public interface HomeDAO {
	public List<HomeVO> homeProduct(int catenum);
	public String homeProductTitle(int catenum);
	public List<RecipeVO> homerecipe(int recipeposition);
	public PopupVO popupselect();
}
