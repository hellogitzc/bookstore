package com.itheima.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itheima.po.Cart;

import com.itheima.service.CartService;

@Controller
public class CartController {
	 @Autowired
	 private CartService cartService;
	
    @RequestMapping("/addCart")
    public String addCart(Cart cart,Model model) {
    	//如果检查出
    	
    	if(check(cart) == null) {
    	cartService.addCart(cart);
		return "bookdetial";
		}
    	else {
   	      updateNum(cart);
    	   return "bookdetial";
    	}
    	
    }
   //检查是否有该用户是否有该本书，如果有则更新数量以及总价，如果没有则添加到购物车。
    public Cart check(Cart cart) {
    	
    	
		return cartService.check(cart.getUserid(),cart.getBookid());
    
    }
    
    public void updateNum(Cart cart) {
    	 
    	 cartService.updateNum(cart);
    }
   
    @RequestMapping("/searchCart")
    public String searchCart(Integer userid,Model model,
			  HttpServletRequest request) {
    	
    	  
    	 List<Cart> cartList = this.cartService.searchCart(userid);
    	 //因为通过userid来查找，所以userid并不在结果集里，所以要用循环的方式加回去
    	 for(Cart e:cartList) {
    		 e.setUserid(userid); 
    	 }
	      model.addAttribute("cartList",cartList);
		  return "cart";	
    }
    
    @RequestMapping("/deleteItems")
    public void deleteItems(Integer userid,Integer bookid) {
    	System.out.println(userid+" "+bookid);
        cartService.deleteItems(userid,bookid);
    }
}
