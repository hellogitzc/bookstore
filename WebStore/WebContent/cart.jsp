<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="./css/style.css">
 
 <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
 <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
 <script src="./js/carts.js"></script>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/carts.css">
<title>我的购物车</title>
<script type="text/javascript">

</script>
</head>
<!-- start banner_x -->
		<div class="banner_x center">
			<a href="index.jsp" target="_blank"><div class="logo fl"></div></a>
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="clear"></div>
		</div>
		<div class="xiantiao"></div>
		<section class="cartMain">
		<div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>
		 <div class="cartBox">
           
            <div class="order_content">
            <c:forEach items="${cartList}" var="cart" varStatus="cartList">
                <ul class="order_lists">
                    <li class="list_chk">
                        <input type="checkbox" id="${cart.bookid}"class="son_check">
                        <label for="${cart.bookid}"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath}/${cart.bookpic}" alt="" width="80px" height="100px"></a></div>
                        <div class="list_text"><a href="javascript:;">${cart.bookname}</a></div>
                    </li>
                    
                    <li class="list_price">
                        <p class="price">${cart.price}</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="${cart.num}" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥${cart.sum}元</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                    <li class="">
                     <input type="hidden" name="userid"  class="userid" value="${cart.userid}">
                     <input type="hidden" name="bookid"  class="bookid"  value="${cart.bookid}">
                    </li>
                </ul>
                
                   
             
                </c:forEach>
		</div>
		</div>
		
		<div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a href="javascript:;">结算</a></div>
            </div>
        </div>
		</section>
	
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
	<!-- footer -->
	

	</body>
</html>