package com.itheima.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.OrdersMapper;
import com.itheima.po.Orders;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService{
  @Autowired 
  private OrdersMapper orderMapper;

 
@Override
public int addOrder(Orders order) {
	// TODO Auto-generated method stub
	return this.orderMapper.insertSelective(order);
}


@Override
public Orders selectOrderInfo(Integer orderid) {
	// TODO Auto-generated method stub
	System.out.println(orderid);
	return this.orderMapper.selectOrderInfo(orderid);
}
  

@Override
public Integer[] selectIdByUser(Integer userid) {
	// TODO Auto-generated method stub
	return this.orderMapper.selectIdByUser(userid);
}


@Override
public void updatePay(Integer orderid) {
	// TODO Auto-generated method stub
	this.orderMapper.update_pay(orderid);
	}


@Override
public void deleteOrder(Integer orderid) {
	// TODO Auto-generated method stub
	this.orderMapper.deleteById(orderid);
}
}
