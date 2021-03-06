package com.itheima.mapper;

import com.itheima.po.OrderItem;
import com.itheima.po.OrderItemExample;
import com.itheima.po.OrderItemKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderItemMapper {
    long countByExample(OrderItemExample example);

    int deleteByExample(OrderItemExample example);

    int deleteByPrimaryKey(OrderItemKey key);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    List<OrderItem> selectByExample(OrderItemExample example);

    OrderItem selectByPrimaryKey(OrderItemKey key);

    int updateByExampleSelective(@Param("record") OrderItem record, @Param("example") OrderItemExample example);

    int updateByExample(@Param("record") OrderItem record, @Param("example") OrderItemExample example);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);

	List<OrderItem> selectByUser(@Param("userid")Integer userid);
	 int  deleteById(@Param("orderid")Integer orderid);
}