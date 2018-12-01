package com.itheima.mapper;

import com.itheima.po.Address;
import com.itheima.po.AddressExample;
import com.itheima.po.AddressKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    long countByExample(AddressExample example);

    int deleteByExample(AddressExample example);

    int deleteByPrimaryKey(AddressKey key);

    int insert(Address record);

    int insertSelective(Address record);

    List<Address> selectByExample(AddressExample example);

    Address selectByPrimaryKey(AddressKey key);

    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    int updateAddress(@Param("id")Integer id, @Param("userid")Integer userid);
    List<Address> selectByUser(@Param("userid")Integer userid);

	int deleteById(@Param("id")Integer id);
}