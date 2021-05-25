package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.HomeDAO;
import com.beetmall.sshj.custom.vo.HomeVO;
import com.beetmall.sshj.custom.vo.PopupVO;
import com.beetmall.sshj.custom.vo.RecipeVO;

@Service
public class HomeServiceImp implements HomeService {
	@Inject
	HomeDAO homedao;

	@Override
	public List<HomeVO> homeProduct(int catenum) {
		return homedao.homeProduct(catenum);
	}

	@Override
	public String homeProductTitle(int catenum) {
		return homedao.homeProductTitle(catenum);
	}

	@Override
	public List<RecipeVO> homerecipe(int recipeposition) {
		return homedao.homerecipe(recipeposition);
	}

	@Override
	public PopupVO popupselect() {
		return homedao.popupselect();
	}

}
