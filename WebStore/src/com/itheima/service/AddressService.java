package com.itheima.service;

import java.util.List;

import com.itheima.po.Address;

public interface AddressService {
	
	void addAddress(Address address);
  
	int updateAddress(Address address);
	
	List<Address> selectAddress(Integer userid);

	int deleteAddressById(Integer id);

}
