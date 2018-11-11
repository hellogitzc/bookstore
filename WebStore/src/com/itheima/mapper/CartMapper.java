package com.itheima.mapper;

import com.itheima.po.Cart;
import com.itheima.po.CartExample;
import com.itheima.po.CartKey;

import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartMapper {
    long countByExample(CartExample example);

    int deleteByExample(CartExample example);

    int deleteByPrimaryKey(CartKey key);

    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByExample(CartExample example);

    Cart selectByPrimaryKey(CartKey key);

    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

	void addCart(Cart cart);

	List<Cart> searchCart(@Param("userid")Integer userid);

	Cart check(@Param("userid")Integer userid, @Param("bookid")Integer bookid);

	void updateNum(Cart cart);

	void deleteItems(@Param("userid")Integer userid,  @Param("bookid")Integer bookid);	
}