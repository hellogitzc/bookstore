package com.itheima.po;

import java.math.BigDecimal;



public class Book {

	private Integer bookid;
	private Integer booktypeid;
	private String bookname;
	private String bookpress;
	private String author;
	private String isbn;
	private String bookinfo;
	private BigDecimal price;
	private String bookpic;
	private String content;

	public Integer getBookid() {
		return bookid;
	}

	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}

	public Integer getBooktypeid() {
		return booktypeid;
	}

	public void setBooktypeid(Integer booktypeid) {
		this.booktypeid = booktypeid;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname == null ? null : bookname.trim();
	}

	public String getBookpress() {
		return bookpress;
	}

	public void setBookpress(String bookpress) {
		this.bookpress = bookpress == null ? null : bookpress.trim();
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author == null ? null : author.trim();
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn == null ? null : isbn.trim();
	}

	public String getBookinfo() {
		return bookinfo;
	}

	public void setBookinfo(String bookinfo) {
		this.bookinfo = bookinfo == null ? null : bookinfo.trim();
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getBookpic() {
		return bookpic;
	}

	public void setBookpic(String bookpic) {
		this.bookpic = bookpic == null ? null : bookpic.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}
    
	

}