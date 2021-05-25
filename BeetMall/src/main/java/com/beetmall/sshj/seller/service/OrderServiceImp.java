package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.OrderDAO;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Service
public class OrderServiceImp implements OrderService {
	@Inject
	OrderDAO orderDAO;

	@Override
	public List<OrderSaleVO> orderList(SearchAndPageVO sapvo) {
		// TODO Auto-generated method stub
		return orderDAO.orderList(sapvo);
	}

	@Override
	public OrderSaleVO oneOrderSelect(OrderSaleVO osvo){
		// TODO Auto-generated method stub
		return orderDAO.oneOrderSelect(osvo);
	}

	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		// TODO Auto-generated method stub
		return orderDAO.totalRecord(sapvo);
	}

	@Override
	public int orderStatusUpdate(String ordernum, String orderstatus) {
		// TODO Auto-generated method stub
		return orderDAO.orderStatusUpdate(ordernum, orderstatus);
	}



}