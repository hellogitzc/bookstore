package com.itheima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.itheima.mapper.BookMapper;

import com.itheima.po.Book;


@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;

	@Override
	public int BookName(String bookname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addBook(Book book) {
		// TODO Auto-generated method stub
		 this.bookMapper.addBook(book);
	}

	@Override
	public Book findBook(Integer bookid) {
		// TODO Auto-generated method stub
		return this.bookMapper.findBook(bookid);
	}
	
@Override
public List<Book> selectByPageAndSelections() {
	// TODO Auto-generated method stub
	return this.bookMapper.selectByPageAndSelections();
}

@Override
public List<Book> selectByIdDesc() {
	// TODO Auto-generated method stub
	return this.bookMapper.selectByIdDesc();
}

}
