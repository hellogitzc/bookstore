package com.itheima.controller;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itheima.po.User;
import com.itheima.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	//用户登录
	@RequestMapping(value = "/login.action",method=RequestMethod.POST)
	public String login(String username,String password,Model model,HttpSession session){
		   
		    User user = userService.findUser(username, password);		
	
			if(user!=null){
				model.addAttribute("user", user);
				return "index";
				}
			//如果账号密码不匹配
			model.addAttribute("msg", "账号或密码错误!请重新登录");
			return "index";
	}
	
	//退出登录
	@RequestMapping("/logout.action")
	public String logout(HttpSession session){
		//清除session
		session.invalidate();
		return "index";
	}
	
	//查询用户名是否存在
	@RequestMapping("/checkUserName.action")
	public String CheckUserName(String username,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//查询是否有输入的用户名
		int judge =userService.checkUserName(username);
		//设置返回数据为utf-8	
		response.setCharacterEncoding("UTF-8"); 
		response.flushBuffer();
		response.getWriter().write(judge);
		response.getWriter().flush();  
		response.getWriter().close();
		
		 return null;
		 
	}
	
	//用户注册
	@RequestMapping("/register.action")
	public String register(User user,Model model){  
       userService.register(user);  
        
        return "index";  
    }  
	
	//查询用户所有信息
	@RequestMapping("/user_info.action")
	public String user_info(String username,Model model,HttpSession session) {
		 
		 User user = userService.user_info(username);
		 if(user!=null){
			model.addAttribute("user", user);
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
			return "index";
		}
		return null;
	}
    
	
	//修改个人信息
	
	@RequestMapping("/update.action")
	public String update(User user,HttpServletRequest request,Model model){
		    System.out.println(user.getUsername()+user.getPhonenum()+user.getRealname()+user.getSex());
			int result = userService.update(user);
			if(result!=0) {
				user = userService.user_info(user.getUsername());
				 if(user!=null){
						model.addAttribute("user", user);
						return "user_info";
						}
		}
			return null;
	}
//	@SuppressWarnings("finally")
//	@RequestMapping("/addInfo")
//	public String add(User user,HttpServletRequest request){
//		try {			
////			user.setId(UUID.randomUUID().toString());
//			System.out.println(user.getUsername() + ":::::" + user.getUsername() + ":::::" + user.getPassword());
//			
//			System.out.println(str);
//			request.setAttribute("InfoMessage", str);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
//		} finally {			
//			return "result";
//		}
//	}
//	
//	@RequestMapping("/getAll")
//	public String getAddInfoAll(HttpServletRequest request){
//		try {			
//			List<User> list = userService.getAll();
//			System.out.println("------User_list-----"+list.size());
//			request.setAttribute("addLists", list);
//			return "listAll";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
//			return "result";
//		}
//	}
//	
//	@SuppressWarnings("finally")
//	@RequestMapping("del")
//	public String del(int id,HttpServletRequest request){
//		try {			
//			String str = userService.delete(id);
//			request.setAttribute("InfoMessage", str);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
//		} finally {			
//			return "result";
//		}
//	}
//	@RequestMapping("modify")
//	public String modify(int id,HttpServletRequest request){
//		try {			
//			User user = userService.findById(id);
//			request.setAttribute("add", user);
//			return "modify";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
//			return "result";
//		}
//	}
//	@SuppressWarnings("finally")
	

 
}