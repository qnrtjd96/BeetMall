package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SettleDAO;
import com.beetmall.sshj.seller.vo.SettleVO;

@Service
public class SettleServiceImp implements SettleService{
	@Autowired
	SettleDAO dao;
	
	@Override
	public List<SettleVO> getOrderDateData(SettleVO vo) {
		return dao.getOrderDateData(vo);
	}

	@Override
	public List<SettleVO> totalSettle(SettleVO vo) {
		return dao.totalSettle(vo);
	}
	
	@Override
	public List<SettleVO> totalOrder(SettleVO vo) {
		return dao.totalOrder(vo);
	}
	
	@Override
	public List<SettleVO> getOrderSettleData(SettleVO vo) {
		return dao.getOrderSettleData(vo);
	}

	@Override
	public List<SettleVO> getDateData(SettleVO vo) {
		return dao.getDateData(vo);
	}

	@Override
	public List<SettleVO> getSettleData(SettleVO vo) {
		return dao.getSettleData(vo);
	}

	@Override
	public List<SettleVO> getDateDataTotalRecord(SettleVO vo) {
		return dao.getDateDataTotalRecord(vo);
	}

	@Override
	public List<SettleVO> getSettleDataTotalRecord(SettleVO vo) {
		return dao.getSettleDataTotalRecord(vo);
	}

	@Override
	public List<SettleVO> excelOrderDateData(SettleVO vo) {
		return dao.excelOrderDateData(vo);
	}

	@Override
	public List<SettleVO> excelOrderSettleData(SettleVO vo) {
		return dao.excelOrderSettleData(vo);
	}


	
	
	
}