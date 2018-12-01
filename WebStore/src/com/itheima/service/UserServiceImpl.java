package com.itheima.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.UserMapper;
import com.itheima.po.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Override
	public User findUser(String username, String password) {
		
		// TODO Auto-generated method stub
		User user = this.userMapper.findUser(username, password);
		return user;
	}
	@Override
	public int checkUserName(String username) {
		// TODO Auto-generated method stub
		User user = this.userMapper.checkUsreName(username);
		//如果用户名不存在返回1
		if(user == null){
            return 1;
        }else{
            return 0;
        }
	}
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
	  this.userMapper.register(user);
	}
	@Override
	public User user_info(Integer userid) {
		// TODO Auto-generated method stub
		return this.userMapper.user_info(userid);
	}
	
	@Override
	public int changePassword(String username, String password) {
		// TODO Auto-generated method stub
		
		return this.userMapper.changePassWord(username,password);
	}
	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.update(user);
	}
	
}
