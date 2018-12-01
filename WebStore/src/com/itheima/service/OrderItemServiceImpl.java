package com.itheima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.OrderItemMapper;
import com.itheima.po.OrderItem;

@Service("orderItemService")
@Transactional
public class OrderItemServiceImpl implements OrderItemService{

	@Autowired
	private OrderItemMapper orderItemMapper;
	@Override
	public int addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return this.orderItemMapper.insertSelective(orderItem);
	}
	@Override
	public List<OrderItem> selectOrderItems(Integer orderid) {
		// TODO Auto-generated method stub
		return this.orderItemMapper.selectByUser(orderid);
	}
	@Override
	public void detletOrder(Integer orderid) {
		// TODO Auto-generated method stub
		this.orderItemMapper.deleteById(orderid);
	}
	@Override
	public void detletOrder_Items(Integer orderid) {
		// TODO Auto-generated method stub
		
	}

}
