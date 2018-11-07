<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
		<title>用户注册</title>
		<script type="text/javascript" src="js/register.js" ></script>
        <link rel="stylesheet" type="text/css" href="./css/register.css">
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	</head>
	<body>
      
			<div class="nav">
    <div>
        <img src="picture/relog.jpg">
    </div>
    <div class="nav1">
        <form action="${pageContext.request.contextPath}/register.action" method="post">
            <p>
                <label for="username">用户名：</label>
                <input type="text" id="username" name="username"><span style="margin-left:19px">请输入4-12位用户名</span>
            </p>
            <p>
                <label for="password">登录密码：</label>
                <input type="password" id="password" name="password"><span>密码为6-16位</span>
            </p>
            <p>
                <label for="repassword">重复登录密码：</label>
                <input type="password" id="repassword"><span>请再次输入密码</span>
            </p>
            <p>
                <label>性别：</label>
                <input type="radio" name="sex" checked value="男">男
                <input type="radio" name="sex"  value="女">女
            </p>
            <p>
                <label for="name">真实姓名：</label>
                <input type="text" id="name" name="realname"><span>请输入您的真实姓名，请输入汉字</span>
            </p>
            
             <p>
                <label for="tel">关联手机号：</label>
                <input type="text" id="tel" name="phonenum"><span>请输入关联手机号</span>
            </p>
            
            <button type="submit">
                <img src="picture/register.jpg">
            </button>
            <p></p>
        </form>
    </div>
</div>
	</body>
</html>