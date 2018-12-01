<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>叮当网上书店</title>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : "/WebStore/getBookList",
			cache : false,//禁用缓存
			async : false,
			dataType : "json",
			success:function(data) {
				var html='';
				
				for (var i=0,len=data.length; i<len; i++) {
					
                html += '<div class="mingxing fl">' + '<div class="sub_mingxing">'
                     +  '<a href="/WebStore/findBook.action?bookid='+data[i].bookid+'">'
                     +'<img src="/WebStore/'+data[i].bookpic+'"alt="" width="180px" height="180px"></a>'
                     +'</div><div class="pinpai"><a href="">'+data[i].bookname+'</a></div>'
                     +'<div class="jiage">'+data[i].price+'元</div><div class="fu"><a href="">'
                     +'<span>'+data[i].bookinfo+'</span></a></div></div>';
                    
                if((i+1)%5 == 0){
                    
                     html+='<div class="clear"></div>';
                    }
					}
				
				$('.main').html(html);
              }
		})

    

		})
	
</script>
</head>


<body>

	<!-- start header -->
	<jsp:include page="head.jsp"></jsp:include>
	<!--end header -->

	<!-- end banner_x -->


	<!-- start banner_y -->
	<div class="banner_y center"></div>
	



	<div class="danpin center">

		<div class="biaoti center">新书推荐</div>
		<div class="main center">
			


		</div>
	</div>
	<footer class="mt20 center"> </footer>
</body>
</html>