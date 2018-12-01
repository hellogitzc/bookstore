package com.itheima.service;

import com.itheima.po.Orders;

public interface OrderService {
        public int addOrder(Orders order);

		public Orders selectOrderInfo(Integer orderid);
		
		public Integer[] selectIdByUser(Integer userid);

		public void updatePay(Integer orderid);

		public void deleteOrder(Integer orderid);
}
