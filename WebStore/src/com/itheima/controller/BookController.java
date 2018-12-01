package com.itheima.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.po.Book;
import com.itheima.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	@RequestMapping("/upload")
	public String upload(MultipartFile file, Book book, Model model, HttpServletRequest request) throws Exception {
		System.out.println(book.getAuthor());
		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径

		String path = "E:\\workspace\\WebStore\\WebContent\\picture";
		System.out.println(path);
		// 生成uuid作为文件名称
		String originalFilename = file.getOriginalFilename();
		System.out.println(originalFilename);
		// 新的文件名字
		String newFileName = System.currentTimeMillis() + originalFilename;
		System.out.println(newFileName);
		// 封装上传文件位置的全路径
		file.transferTo(new File(path, newFileName));

		// 把图片的相对路径保存至数据库
		sqlPath = "picture/" + newFileName;
		System.out.println(sqlPath);
		book.setBookpic(sqlPath);
		bookService.addBook(book);
		model.addAttribute("book", book);
		return "addBook";
	}

	@RequestMapping("/findBook.action")
	public String findBookById(Integer bookid, Model model, HttpSession session) {

		Book book = bookService.findBook(bookid);
		book.setBookid(bookid);// 因为条件是按bookid查询的，所以返回的值里没有bookid，这里再次把它加回去
		if (book != null) {
			model.addAttribute("book", book);
			return "bookdetial";
		}

		return "index";
	}

	@RequestMapping("/getBookList")
	@ResponseBody
	public List<Book> findByIdDesc(Model model, HttpSession session) {

		List<Book> book = bookService.selectByIdDesc();
		return book;

	}

	@RequestMapping("/bookList")
	public String bookList(@RequestParam(required = true, defaultValue = "1") Integer page, HttpServletRequest request,
			Model model) {
		// PageHelper.startPage(page,
		// pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
		PageHelper.startPage(page, 15);
		List<Book> bookList = bookService.selectByPageAndSelections();
		PageInfo<Book> p = new PageInfo<Book>(bookList);
		model.addAttribute("page", p);
		model.addAttribute("bookList", bookList);
		return "booklist";
	}

	@RequestMapping("/searchByName")
	public String searchByName(@RequestParam(required = true, defaultValue = "1") Integer page,
			HttpServletRequest request, Model model, String bookname) {
		// PageHelper.startPage(page,
		// pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
		System.out.println("call");
		PageHelper.startPage(page, 15);
		List<Book> bookList = bookService.selectByName(bookname);
		PageInfo<Book> p = new PageInfo<Book>(bookList);
		model.addAttribute("page", p);
		model.addAttribute("bookList", bookList);
		return "booklist";
	}
	

	@RequestMapping("/selectByBookType")
	public String SelectByBookTypeId(@RequestParam(required = true, defaultValue = "1") Integer page,
			HttpServletRequest request, Model model, Integer booktypeid) {
		// PageHelper.startPage(page,
		// pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
		PageHelper.startPage(page, 15);
		System.out.println(booktypeid);
		List<Book> bookList = bookService.SelectByBookTypeId(booktypeid);
		PageInfo<Book> p = new PageInfo<Book>(bookList);
		model.addAttribute("page", p);
		model.addAttribute("bookList", bookList);
		return "booklist";
	}

}
