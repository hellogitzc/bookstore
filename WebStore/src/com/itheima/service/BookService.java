package com.itheima.service;
import java.util.List;


import com.itheima.po.Book;



public interface BookService {
	
	
	public int BookName(String bookname);

	public void addBook(Book book);

	public Book findBook(Integer bookid);

	
    public List<Book> selectByPageAndSelections();
     public List<Book> selectByIdDesc();
}
