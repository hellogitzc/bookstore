<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>书籍详情</title>
     <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
  
<script type="text/javascript">

function addCart(){ 
	var cart={
		userid:parseInt('${user.userid}'),
	    bookid:parseInt('${book.bookid}'),
	    num: parseInt($(".num").val()),
	    sum: parseFloat($("#total").html().trim()).toFixed(2),
	    bookname:'${book.bookname}',
	    price:'${book.price}',
	    bookpic:'${book.bookpic}'
	};

	$.ajax({
		url:"/WebStore/addCart",
		type:"post",
        async:false,
        cache:false,
        data:JSON.stringify(cart),
        contentType:"application/json ; charset=UTF-8",
        dataType:"json",
        success:function(data){
           
        }
		});
    alert("该商品已经成功添加到购物车！")
    
};

function createOrder(){
	var price= '${book.price}';
	document.charset='UTF-8';
	
	document.getElementById('num').value = parseInt($(".num").val());
	
	document.getElementById('sum').value = document.getElementById("total").innerText;
	
    document.form1.action="/WebStore/createOrderItems";
    document.form1.submit();
    
    }
	
$(document).ready(function(){
	//加的效果
	$(".add").click(function(){
	var n=$(this).prev().val();
	var num=parseInt(n)+1;
	if(num==0){ return;}
	$(this).prev().val(num);
	 setTotal(); 
	});
	//减的效果
	$(".jian").click(function(){
	var n=$(this).next().val();
	var num=parseInt(n)-1;
	if(num==0){ return}
	$(this).next().val(num);
	 setTotal(); 
	});
	function setTotal() {
		var s=0;
		var price= '${book.price}';
		
		s += parseInt($(".num").val())*price;
		
		$("#total").html(s.toFixed(2)); 
	}
	setTotal();

})
</script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>	
<form method="post" name="form1" accept-charset="UTF-8">
     <div class="jieshao mt20 w">
		<div class="left fl"><img src="${pageContext.request.contextPath}/${book.bookpic}" width="400px" height="400px"></div>
		<div class="right fr">
			<div class="h3 ml20 mt20">${book.bookname}</div>
			<div class="jianjie mr40 ml20 mt10">出版社: ${book.bookpress} 作者/主编:${book.author}</div>
			<div class="jianjie mr40 ml20 mt10">简介: ${book.bookinfo}</div>
			<div class="jiage ml20 mt10">${book.price}</div>
			<div class="ft20 ml20 mt20">选择数量</div>
			<div class="xzbb ml20 mt10">
				<div class="gw_num">   
                <em class="jian">-</em>
                <input type="text" value="1" class="num"/>
                <em class="add">+</em>
                </div>	
			</div>
				<div class="bot mt20 ft20 ftbc">总计：<label id="total"></label></div>
			
			<div class="xiadan ml20 mt20">
			<c:if test="${not empty user.userid}">
			       
			<input type="hidden" name="status" value="1"/>
			<input type="hidden" name="bookid" value="${book.bookid}">
			<input type="hidden" name="bookname" id="bookname" value="${book.bookname}">
			<input type="hidden" name="userid" value="${user.userid}">
			<input type="hidden" name="price" value="${book.price}">
			<input type="hidden" name="bookpic" value="${book.bookpic}">
			<input type="hidden" name="num" id="num">
			<input type="hidden" name="sum" id="sum">
					<input class="jrgwc"  type="button"  value="立即选购" onclick="createOrder()" />
					<input class="jrgwc" type="button"  id="gwc" value="加入购物车" onclick="addCart()" />
			</c:if>	
			<c:if test="${empty user.userid}"><input type="text"  class="jrgwc" value="请先登录，再进行选购" disabled/></c:if>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
</body>
</html>