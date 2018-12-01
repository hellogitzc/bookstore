<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>支付订单</title>
<link href="css/public.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script>
	$(document).ready(function() {
		$('#payBtn').click(function() {
			var url = "/WebStore/updatePay";
			$("#pay-form").attr('action', url);
			$("#pay-form").submit();
			alert("支付成功！");
			window.location.href="index.jsp";
		})

		$('#delete').click(function() {
			if(confirm("确定要取消该订单吗？")){
			var url = "/WebStore/deleteOrder";
			$("#pay-form").attr('action', url);
			alert("取消成功!");
			$("#pay-form").submit();
			window.location.href="index.jsp";
			}
		})
	})
</script>
</head>

<body>

	<div class="banner_red_top"></div>
<jsp:include page="head.jsp" />
	<!--订单提交body部分开始-->


	

		<div class="container payment-con">
			<form target="_blank" id="pay-form" method="post">
			<input type="hidden" name="orderid" value="${orderInfo.orderid }"></input>
				<div class="order-info">
					<div class="msg">
						<h3>您的订单已提交成功！付款咯～</h3>
						<p></p>

						<p class="post-date">成功付款后，7天发货</p>
					</div>
					<div class="info">
						<p>
							金额：<span class="pay-total">${orderInfo.total }</span>
						</p>
						<p>订单：11505057${orderInfo.orderid }</p>
						<p>
							配送：${orderInfo.addressdetial} <span class="line"></span>

						</p>
					</div>
					<div class="icon-box">
						<i class="iconfont"><img src="picture/yes_ok.png" /></i>
					</div>
				</div>

				<div class="box-ft clearfix">
					<center>
						
							<input type="submit" class="btn btn-primary" value="确认并支付"
								id="payBtn" />
						
						<a href="javascript:void(0)" class="btn btn-lineDakeLight"
							id="delete">取消订单</a> <span class="tip"></span>
					</center>
				</div>
			</form>
			<a href="index.jsp">返回首页继续购物</a>
		</div>

		<div class="checkout-confirm"></div>
</body>
</html>
