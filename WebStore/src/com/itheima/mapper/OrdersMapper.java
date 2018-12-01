package com.itheima.mapper;

import com.itheima.po.Orders;
import com.itheima.po.OrdersExample;
import com.itheima.po.OrdersKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrdersMapper {
    long countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(OrdersKey key);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example);
    Orders selectOrderInfo(@Param("orderid") Integer orderid);
 
    Orders selectByPrimaryKey(OrdersKey key);
    
    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
    
    int update_pay(@Param("orderid")Integer orderid);
    
    int  deleteById(@Param("orderid")Integer orderid);
	Orders test(@Param("orderid")Integer orderid);

	Integer[] selectIdByUser(@Param("userid")Integer userid);
}