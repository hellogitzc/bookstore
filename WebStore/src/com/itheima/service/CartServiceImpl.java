package com.itheima.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.CartMapper;
import com.itheima.po.Cart;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService{
    
	@Autowired
	private CartMapper cartMapper;
	@Override
	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
	   this.cartMapper.addCart(cart);
	}

	@Override
	public List<Cart> searchCart(Integer userid) {
		// TODO Auto-generated method stub
		return this.cartMapper.searchCart(userid);
	}

	@Override
	public void deleteCart() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Cart check(Integer userid, Integer bookid) {
		// TODO Auto-generated method stub
		return this.cartMapper.check(userid,bookid);
	}

	@Override
	public void updateNum(Cart cart){
		// TODO Auto-generated method stub
		this.cartMapper.updateNum(cart);
	}

	@Override
	public void deleteItems(Integer userid, Integer bookid) {
		// TODO Auto-generated method stub
		this.cartMapper.deleteItems(userid,bookid);
	}

	@Override
	public void updateSumAndNum(Integer userid, Integer bookid, Integer num, Float sum) {
		// TODO Auto-generated method stub
		this.cartMapper.updateSumAndNum(userid,bookid,num,sum);
	}

	@Override
	public Cart selectCartById(Integer id) {
		// TODO Auto-generated method stub
		return cartMapper.selectById(id);
	}

	@Override
	public int updateStatus(Integer id) {
		// TODO Auto-generated method stub
		return this.cartMapper.updateStatus(id);
	}

	
	

	

}
