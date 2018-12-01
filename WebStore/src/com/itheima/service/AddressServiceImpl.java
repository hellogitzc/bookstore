package com.itheima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.AddressMapper;
import com.itheima.po.Address;

@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService{
    
	@Autowired
	AddressMapper addressMapper;
	
	@Override
	public void addAddress(Address address) {
		// TODO Auto-generated method stub
		this.addressMapper.insert(address);
	}

	@Override
	public int updateAddress(Address address) {
		// TODO Auto-generated method stub
		return this.addressMapper.updateByPrimaryKey(address);
	}

	@Override
	public List<Address> selectAddress(Integer userid) {
		// TODO Auto-generated method stub
		return this.addressMapper.selectByUser(userid);
	}

	@Override
	public int deleteAddressById(Integer id) {
		// TODO Auto-generated method stub
		return this.addressMapper.deleteById(id);
	}

}
