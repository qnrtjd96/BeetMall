package com.beetmall.sshj;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.HomeService;

@Controller
public class HomeController {
	@Inject
	HomeService homeservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		// 로그인 관련 세션   ---------------
		if(session.getAttribute("logStop") != null) {
			session.removeAttribute("logStop");
		}
		if(session.getAttribute("Type") != null) {
			session.removeAttribute("Type");
		}
		if(session.getAttribute("stopdate") != null) {
			session.removeAttribute("stopdate");
		}
		if(session.getAttribute("logTry") != null) {
			session.removeAttribute("logTry");
		}
		// 로그인 관련 세션 끝---------------
		// 메인페이지 출력
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("topList", homeservice.homeProduct(1));
		mav.addObject("toptitle",homeservice.homeProductTitle(1));
		mav.addObject("midList", homeservice.homeProduct(2));
		mav.addObject("midtitle",homeservice.homeProductTitle(2));
		mav.addObject("bottomList", homeservice.homeProduct(3));
		mav.addObject("bottomtitle",homeservice.homeProductTitle(3));
		mav.addObject("toprecipe", homeservice.homerecipe(0));
		mav.addObject("bottomrecipe", homeservice.homerecipe(1));
		mav.addObject("popup", homeservice.popupselect());
		
		mav.setViewName("home");
		return mav;
	}
}
