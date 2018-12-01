package com.itheima.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.po.Address;
import com.itheima.po.OrderItem;
import com.itheima.po.User;
import com.itheima.service.AddressService;
import com.itheima.service.OrderItemService;
import com.itheima.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired 
	private AddressService addressService;
	
	@Autowired
	private OrderItemService orderItemService;
	//用户登录
	@RequestMapping("/login")
	@ResponseBody
	public User login(String username,String password,HttpSession session,HttpServletResponse response){
		   
		    User user = userService.findUser(username, password);
			if(user!=null){
			    session.setAttribute("user",user);
			     return user;
				}
			//如果账号密码不匹配
			
			return user;
			
	}
	
	//退出登录
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpSession session){
		//清除session
		
		session.invalidate();
		return "ok";
	}
	
	//查询用户名是否存在
	@RequestMapping("/checkUserName.action")
	@ResponseBody
	public int CheckUserName(String username,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//查询是否有输入的用户名
		int judge =userService.checkUserName(username);
		//设置返回数据为utf-8	
		System.out.print(judge);
		 return judge; 
	}
	
	//用户注册
	@RequestMapping("/register.action")
	public String register(User user,Model model){  
       userService.register(user);  
        return "redirect:index.jsp";  
    }  
	
	//查询用户所有信息
	@RequestMapping("/user_info.action")
	public String user_info(Integer userid,Model model,HttpSession session) {
		 
		 User user = userService.user_info(userid);
		 List<Address> addressList= addressService.selectAddress(userid);
		 List<OrderItem> orderItems =this.orderItemService.selectOrderItems(userid);
		 if(user!=null){
			model.addAttribute("user", user);
			model.addAttribute("addressList", addressList);
			model.addAttribute("orderItems",orderItems);
			
			return "user_info";
			}
		 
		return "index";
		
	}
		
	//修改密码
	@RequestMapping("/changePassword.action")
	
	public String changePassword(String username,String password,HttpSession session) {
		
		int user = userService.changePassword(username,password);
		if(user!=0) {
			session.invalidate();
			return "redirect:index.jsp";
		}
		return null;
	}
    
	
	//修改个人信息
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(User user,HttpServletRequest request,Model model){
		    System.out.println(user.getUsername()+user.getPhonenum()+user.getRealname()+user.getSex());
			int result = userService.update(user);
			if(result!=0) {
				user = userService.user_info(user.getUserid());
				 if(user!=null){
						model.addAttribute("user", user);
						return "修改成功";
						}
		}
			return "修改成功";
	}
	
	

 
}