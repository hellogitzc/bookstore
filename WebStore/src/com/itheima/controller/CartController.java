package com.itheima.controller;

import org.springframework.stereotype.Controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.po.Address;
import com.itheima.po.Cart;

import com.itheima.service.AddressService;
import com.itheima.service.CartService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class CartController {
	 @Autowired
	 private CartService cartService;
	 
	 @Autowired
	 private AddressService addressService;
	
	 
	 private List<Cart>  lt;
    @RequestMapping("/addCart")
    @ResponseBody
    public void addCart(@RequestBody Cart cart,Model model,Integer userid,String bookname) {
    	//如果检查出没有该本书，则添加
       
    	if(check(cart) == null) {
    		cart.setStatus(0);
    	cartService.addCart(cart);
		}
    	//否则则更新书目
    	else {
  	      updateNum(cart);
   
    	}
    	
    }
    
    
    @RequestMapping("/createOrderItems")
  
    public String createOrderItems(Cart cart,Model model,Integer userid,String bookname) {
    	
    	//直接向Cart表中加入，把status属性设置为1，即进入变成了订单商品明细。
//         
//    	cartService.addCart(cart);
    	//
      List<Cart> cartList = new ArrayList<Cart>();
      cartList.add(cart);
      model.addAttribute("cartList",cartList);
       
       //查找该用户的收货人地址信息
       List<Address> addressList = addressService.selectAddress(cart.getUserid());
       for(Address e:addressList) {
  		 e.setUserid(cart.getUserid()); 
  	 }
       
       model.addAttribute("addressList",addressList);
		return "try";	    	
    }
    
    @RequestMapping("/createOrder")
    public String createOrder(Integer userid,Model model) {
    	
    	 List<Cart> cartList = getLt();
    	
    	 List<Address> addressList = addressService.selectAddress(userid);
         
	      model.addAttribute("cartList",cartList);
	      model.addAttribute("addressList",addressList);
	      return "try";
    }
   //检查是否有该用户是否有该本书，如果有则更新数量以及总价，如果没有则添加到购物车。
    public Cart check(Cart cart) {
    	
    	
		return cartService.check(cart.getUserid(),cart.getBookid());
    
    }
    //在购物车里，进行数量以及总价的更新
    @RequestMapping("/updateSumAndNum")
    public void updateSumAndNum(Integer userid,Integer bookid,Integer num,Float sum) {
    	
        cartService.updateSumAndNum(userid,bookid,num,sum);
    }
    
    //添加进购物车时更新书目
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
    
        cartService.deleteItems(userid,bookid);
    }
    
    @RequestMapping("/getSelectedBook")
    public void  getList(@RequestBody String cartList,HttpServletResponse response) throws IOException {
    	
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(cartList);
        List<Cart> list = (List<Cart>)JSONArray.toCollection(jsonArray,Cart.class);
        
        setLt(list);
        System.out.print(getLt().size());
//        for(Cart cart : list){
//            System.out.println(cart.getBookid());
//    }
        
        if(list.size()!=0) {
        	String data="ok";
        	response.setCharacterEncoding("UTF-8"); 
    		response.flushBuffer();
    		response.getWriter().write(data);
    		response.getWriter().flush();  
    		response.getWriter().close();
		}
        
        
}
	public List<Cart> getLt() {
		return lt;
	}


	public void setLt(List<Cart> lt) {
		
		this.lt = lt;
	}}
