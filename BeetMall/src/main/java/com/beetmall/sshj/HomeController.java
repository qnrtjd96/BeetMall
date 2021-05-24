package com.beetmall.sshj;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beetmall.sshj.admin.service.ReportListService;

@Controller
public class HomeController {
	@Inject
	ReportListService reportListService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
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
		reportListService.UpdateMember();
		
		return "home";
	}
}
