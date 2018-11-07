<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>书籍列表</title>
</head>
<body>
       <div class="danpin center">
			
			<div class="biaoti center">书籍列表</div>
		    <div class="main center">
		    <c:forEach begin="0" step="1" items="${bookList}" var="book" varStatus="booklist">
			<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="${pageContext.request.contextPath}/${book.bookpic}" alt="" width="150px" height="200px"></a></div>
					<div class="pinpai"><a href="">${book.bookname}</a></div>
					
					<div class="jiage">${book.price}元</div>
					<div class="fu">
							<a href="">
								<span>${book.bookinfo}</span>
								
							</a>
						</div>
				</div>
				</c:forEach>
				 
       
	   </div>
	   <center>
	    <p>一共${page.pages}页</p>
	    <a href="bookList?page=${page.firstPage}">第一页</a>
        <a href="bookList?page=${page.nextPage}">下一页</a>
        <a href="bookList?page=${page.prePage}">上一页</a>
        <a href="bookList?page=${page.lastPage}">最后页</a>
        </center>
	   </div>
	 
	    

</body>
</html>