<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/login.css">
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
     <link href="./js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
     <link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
  <script type="text/javascript">
		// var zIndex = 9000;   	
		function g(id){return document.getElementById(id);}
		function check(e){
            if(g('username').value == ""|| g('password').value == ""){
                alert("用户名或密码不能为空！")
            	return false; 
			}
			
		}
		function autoCenter( el ){
			var bodyW = document.documentElement.clientWidth;
			var bodyH = document.documentElement.clientHeight;

			var elW = el.offsetWidth;
			var elH = el.offsetHeight;

			el.style.left = (bodyW-elW)/2 + 'px';
			el.style.top = (bodyH-elH)/2 + 'px';
			
		}
		function fillToBody( el ){
			el.style.width  = document.documentElement.clientWidth  +'px';
			el.style.height = document.documentElement.clientHeight + 'px';
		}

		//标记状态，只有在弹出对话框的时候才变成1
		var flag=0;
		
		//展示对话框
		function showDialog(){
			$('body').css('overflow-y','hidden');
			$('body').css('overflow-x','hidden');
			g('dialogMove').style.display = 'block';
			g('mask').style.display = 'block';
			autoCenter( g('dialogMove') );
			fillToBody( g('mask') );	
			flag=1;
		}
		
		//	关闭对话框
		function hideDialog(){
			$('body').css('overflow-y','scroll');
			$('body').css('overflow-x','scroll');
			g('dialogMove').style.display = 'none';
			g('mask').style.display = 'none';
			
			flag=0;
			
		}   
		//	监听窗口大小变化
		window.onresize = function(){ 
			if(flag==1){
				showDialog();

				}

       } 
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
				<script type="text/javascript"> alert('${msg}');</script>
				</c:if>
				<c:if test="${not empty user.username}">
					<div class="gouwuche fr"><a href="${pageContext.request.contextPath}/searchCart?userid=${user.userid}">购物车</a></div>
					<div class="fr">
						<ul>
						    <li>${user.username},您好!欢迎光临叮当网上书店</li>
						    <li></li>
							<li><a href="${pageContext.request.contextPath}/logout.action">退出登录</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/user_info.action?username=${user.username}" target="_blank" >个人信息</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
				</c:if>
				
				<c:if test="${empty user.username}">
					<div class="fr">
						<ul>
						    
							<li><a onClick="javascript:showDialog()">登录</a></li>
							<li>|</li>
							<li><a href="./register.jsp" target="_blank" >注册</a></li>
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
					<li><a href="${pageContext.request.contextPath}/bookList.action" target="_blank">全部图书</a></li>
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=1">IT技术</a></li>
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=2">幼儿童书</a></li>					
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=3">小说传记</a></li>
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=4">经济管理</a></li>
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=5">教辅资料</a></li>
					<li><a href="${pageContext.request.contextPath}/selectByBookType?booktypeid=6">经典名著</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="Java&nbsp;C++">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

      <div class="ui-mask" id="mask"  onselectstart="return false"></div>
	<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
	<div class="ui-dialog-title" id="dialogDrag"  onselectstart="return false;" >
	<a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>
	</div>
<!-- 登录框 -->	
        
	   <form  method="post" action="${pageContext.request.contextPath}/login.action" method="post"class="form center" >
		<div class="login" id= >
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">用户登录</div>
					<div class="right fr">还没有注册?点击此处<a href="register.jsp">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名:&nbsp;<input class="shurukuang" type="text" name="username" id="username" placeholder="请再此处输入用户名"/></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" id="password" placeholder="请在此处输入密码"/></div>
					
				</div>
				<div class="login_submit">
					<input class="submit" type="submit" name="submit" onClick="return check()"value="立即登录" >
				</div>
			</div>
		</div>
     </form>
     </div>
</body>
</html>