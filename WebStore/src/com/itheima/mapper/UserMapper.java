package com.itheima.mapper;

import com.itheima.po.User;
import com.itheima.po.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    public User findUser(@Param("username") String username,
    		@Param("password") String password);

	public User checkUsreName(@Param("username") String username);

	public void register(User user);
	
	public User user_info(@Param("username") String username);

	public int changePassWord(@Param("username")String username, @Param("password")String password);

	public int update(User user);
}