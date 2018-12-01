package com.itheima.controller;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.po.Address;
import com.itheima.service.AddressService;


@Controller
public class AddressController {
	@Autowired
	private AddressService addressService;
	
	
	@RequestMapping("/createAddress")
	@ResponseBody
	public String createAddress(Address address,HttpServletResponse response,Model model) throws IOException {
		  
			addressService.addAddress(address);
			String data="ok";
		    return data;
	
		    			
	}

	@RequestMapping("/updateAddress")
	@ResponseBody
	public String updateAddress(Address address,HttpServletResponse response,Model model)  throws IOException{
		System.out.println(address.getId()+address.getProvince()+address.getCity());  
		int result=	addressService.updateAddress(address);
		if(result!=0) {
		String data="ok";
		return data;
        	
		}
		return null;
	}
	
	@RequestMapping("/selectAddress")
	@ResponseBody
	public void selectAddressByUserId(Integer userid,Model model) {
		List<Address> address = addressService.selectAddress(userid);
		model.addAttribute("addressList",address);
	
	}
   @RequestMapping("/deleteAddress")
   @ResponseBody
	public String delteAddressById(Integer id,Model model) {
	  int result = addressService.deleteAddressById(id);
	  if(result!=0)
		return "删除成功";
	  else
		  return "删除失败"; 
	}
}
