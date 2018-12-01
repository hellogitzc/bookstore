package com.itheima.service;

import java.util.List;

import com.itheima.po.OrderItem;

public interface OrderItemService {
        

		int addOrderItem(OrderItem orderItem);
		public List<OrderItem> selectOrderItems(Integer userid) ;
		void detletOrder(Integer orderid);
		void detletOrder_Items(Integer orderid);
}
