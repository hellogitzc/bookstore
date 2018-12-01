package com.itheima.service;

import com.itheima.po.User;

public interface UserService {
	public User findUser(String username, String password);

	public int checkUserName(String username);

	public void register(User user);
	
	public User user_info(Integer userid);

	public int changePassword(String username, String password);

	public int update(User user);
}
