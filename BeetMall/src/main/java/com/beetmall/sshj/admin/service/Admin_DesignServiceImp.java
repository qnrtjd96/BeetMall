package com.beetmall.sshj.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_DesignDAO;
@Service
public class Admin_DesignServiceImp implements Admin_DesignService {
	@Inject
	Admin_DesignDAO designdao;
}
