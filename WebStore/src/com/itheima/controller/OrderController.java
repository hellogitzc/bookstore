package com.itheima.controller;

import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itheima.po.Cart;
import com.itheima.po.OrderItem;
import com.itheima.po.Orders;
import com.itheima.service.CartService;
import com.itheima.service.OrderItemService;
import com.itheima.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	@Autowired
	private OrderItemService orderItemService;     

	@RequestMapping("/addOrder")
	public String addOrder(Orders order, Integer[] cartid, Model model) {

		System.out.print(order.getAddressdetial());
		// 获取时间
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		order.setCreateTime(timeStamp);// 让日期时间转换为数据库中的timestamp类型
		// 向订单表中插入数据
		orderService.addOrder(order);
		// 得到最新插入的id

		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		for (int i = 0; i < cartid.length; i++) {
			cartService.updateStatus(cartid[i]);
			Cart cart = cartService.selectCartById(cartid[i]);
			OrderItem orderItem = new OrderItem();
			orderItem.setUserid(cart.getUserid());
			orderItem.setBookid(cart.getBookid());
			orderItem.setBookname(cart.getBookname());
			orderItem.setNum(cart.getNum());
			orderItem.setSum(cart.getSum());
			orderItem.setBookpic(cart.getBookpic());
			orderItem.setOrderid(order.getOrderid());
			orderItems.add(orderItem);
		}

		for (OrderItem o : orderItems) {
			orderItemService.addOrderItem(o);
		}

		Orders orderInfo = orderService.selectOrderInfo(order.getOrderid());
        model.addAttribute("orderInfo",orderInfo);
		return "order_pay";

	}
	@RequestMapping("/updatePay")
	public String updatePay(Integer orderid) {
		this.orderService.updatePay(orderid);
		return "index";
		
	}
	@RequestMapping("/deleteOrder")
	public String deleteOrder(Integer orderid) {
		this.orderItemService.detletOrder(orderid);
		this.orderService.deleteOrder(orderid);
		return "index";
		
	}

}
