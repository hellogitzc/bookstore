package com.itheima.service;

import java.math.BigDecimal;
import java.util.List;

import com.itheima.po.Cart;

public interface CartService {
	public void addCart(Cart cart);
	public List<Cart> searchCart(Integer userid);
	public void deleteCart();
	public Cart check(Integer userid, Integer bookid);
	
	public void updateNum(Cart cart);
	public void deleteItems(Integer userid, Integer bookid);

}
