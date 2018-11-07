<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" type="text/css" href="./css/login.css">
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
     <link href="./js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
     <link rel="stylesheet" type="text/css" href="css/style.css">
    
<title>叮当网上书店</title>

</head>
<body>

<!-- start header -->
<jsp:include page="head.jsp"></jsp:include>	
<!--end header -->
		
<!-- end banner_x -->

   
<!-- start banner_y -->
		<div class="banner_y center">
			
		
		</div>	
        <div class="biaoti center">推荐</div>
		<div class="sub_banner center">
			<div class="sidebar fl">
				<img src="./image/m03.jpg" alt="" height="170px" width="230px"/>
				
				<div class="clear"></div>
			</div>
			<div class="datu fl"><a href=""><img src="./picture/a22.jpg" alt=""></a></div>
			<div class="datu fl"><a href=""><img src="./picture/c2.jpg" alt=""></a></div>
			<div class="datu fr"><a href=""><img src="./picture/b2.jpg" alt=""></a></div>
			<div class="clear"></div>


		</div>
		
		
		<div class="danpin center">
			
			<div class="biaoti center">新书推荐</div>
			<div class="main center">
			  <%
                 int i=1;
               %>
				 <c:forEach  items="${booklist}" var="book" varStatus="booklist">
				
				 
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
				 <% if(i%5 ==0){
					 %><div class="clear"></div><%}
				 i++; %>	
		</c:forEach>
			
			
			</div>
		</div>
</body>
</html>