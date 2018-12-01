<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	// var zIndex = 9000;   
	$(function() {
		var flag = 0;
		var a = document.getElementById("dialogMove");
		var b = document.getElementById("mask");
		$("#submit").click(
				function() {

					if ($('#username').val() == ""
							|| $('#password').val() == "") {
						alert("用户名或密码不能为空！")
						return false;
					}
					;
					$.ajax({
						type : "post",
						url : "/WebStore/login",
						cache : false,//禁用缓存
						async : false,
						data : 'username=' + $('#username').val()
								+ '&password=' + $('#password').val(),
						success : function(data) {
							console.log(data.userid);
							if (data != "") {
								alert('登录成功!');
								hideDialog();
								location.reload(true);
							} else {
								alert('账号或密码错误，请重新输入!');
							}
						}

					})
				});
		$('#logout').click(function() {
			
			$.ajax({
				type : "post",
				url : "/WebStore/logout",
				cache : false,//禁用缓存
				async : false,
				success : function(data) {

					location.reload(true);
				}

			})
		});
		function autoCenter(el) {
			var bodyW = document.documentElement.clientWidth;
			var bodyH = document.documentElement.clientHeight;

			var elW = el.offsetWidth;
			var elH = el.offsetHeight;

			el.style.left = (bodyW - elW) / 2 + 'px';
			el.style.top = (bodyH - elH) / 2 + 'px';

		}
		function fillToBody(el) {
			el.style.width = document.documentElement.clientWidth + 'px';
			el.style.height = document.documentElement.clientHeight + 'px';
		}
		;

		//展示对话框
		function showDialog() {
			$('body').css('overflow-y', 'hidden');
			$('body').css('overflow-x', 'hidden');
			a.style.display = 'block';
			b.style.display = 'block';
			autoCenter(a);
			fillToBody(b);
			flag = 1;
		}

		//	关闭对话框
		function hideDialog() {
			$('body').css('overflow-y', 'scroll');
			$('body').css('overflow-x', 'scroll');
			a.style.display = 'none';
			b.style.display = 'none';
			flag = 0;
		}
		//	监听窗口大小变化
		window.onresize = function() {
			//标记状态，只有在弹出对话框的时候才变成1
			if (flag == 1) {
				showDialog();
			}

		}
		$('#login_button').click(function() {
			showDialog();
			//标记状态，只有在弹出对话框的时候才变成1
		});
		$('#close_button').click(function() {
			hideDialog();

		});
	});
</script>
</head>

<body>
	<header>
	<div class="top center">
		<div class="left fl">
			<ul>
				<li><a href="" target="_blank">欢迎来到叮当网上书店</a></li>

				<li><a href=""></a></li>

			</ul>
		</div>
		<div class="right fr">
			<c:if test="${not empty msg}">
				<script type="text/javascript">
					
				</script>
			</c:if>
			<c:if test="${not empty user.username}">
				<div class="gouwuche fr">
					<a
						href="${pageContext.request.contextPath}/searchCart?userid=${user.userid}">购物车</a>
				</div>
				<div class="fr">
					<ul>
						<li>${user.username},您好!欢迎光临叮当网上书店</li>
						<li></li>
						<li><a href="javascript:void(0)" id="logout">退出登录</a></li>
						<li>|</li>
						<li><a
							href="${pageContext.request.contextPath}/user_info.action?userid=${user.userid}"
							target="_blank">个人信息</a></li>
						<li>|</li>
						<li><a href="">消息通知</a></li>
					</ul>
				</div>
			</c:if>

			<c:if test="${empty user.username}">
				<div class="fr">
					<ul>

						<li><a href="javascript:void(0)" id="login_button">登录</a></li>
						<li>|</li>
						<li><a href="./register.jsp" target="_blank">注册</a></li>
						<li>|</li>

					</ul>
				</div>
			</c:if>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	</header>

	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">
		<div class="logo fl"></div>
		<div class="ad_top fl"></div>
		<div class="nav fl">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/bookList.action"
					target="_blank">全部图书</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=1">IT技术</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=2">幼儿童书</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=3">小说传记</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=4">经济管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=5">教辅资料</a></li>
				<li><a
					href="${pageContext.request.contextPath}/selectByBookType?booktypeid=6">经典名著</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="/WebStore/searchByName" method="post">
				<div class="text fl">
					<input type="text" class="shuru" name="bookname" placeholder="Java&nbsp;C++">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo"  value="搜索" />
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end banner_x -->

	<div class="ui-mask" id="mask" onselectstart="return false"></div>
	<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
		<div class="ui-dialog-title" id="dialogDrag"
			onselectstart="return false;">
			<a class="ui-dialog-closebutton" id="close_button"></a>
		</div>
		<!-- 登录框 -->

		<form method="post" method="post" class="form center">
			<div class="login" id=>
				<div class="login_center">
					<div class="login_top">
						<div class="left fl">用户登录</div>
						<div class="right fr">
							还没有注册?点击此处<a href="register.jsp">立即注册</a>
						</div>
						<div class="clear"></div>
						<div class="xian center"></div>
					</div>
					<div class="login_main center">
						<div class="username">
							用户名:&nbsp;<input class="shurukuang" type="text" name="username"
								id="username" placeholder="请再此处输入用户名" />
						</div>
						<div class="username">
							密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang"
								type="password" name="password" id="password"
								placeholder="请在此处输入密码" />
						</div>

					</div>
					<div class="login_submit">
						<input class="submit" type="button" id="submit" value="立即登录">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>