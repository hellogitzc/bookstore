package com.itheima.mapper;

import com.itheima.po.Book;
import com.itheima.po.BookExample;
import com.itheima.po.Page;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {
    long countByExample(BookExample example);

    int deleteByExample(BookExample example);

    int deleteByPrimaryKey(Integer bookid);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByExample(BookExample example);

    Book selectByPrimaryKey(Integer bookid);

    int updateByExampleSelective(@Param("record") Book record, @Param("example") BookExample example);

    int updateByExample(@Param("record") Book record, @Param("example") BookExample example);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

	void addBook(Book book);

	Book findBook(@Param("bookid")Integer bookid);
	
	public List<Book> selectByPageAndSelections(); 
	List<Book> selectByIdDesc();
}