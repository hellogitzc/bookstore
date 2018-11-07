<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <html>
   <head>
		
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
		<title>个人中心</title>
		<script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
        <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <link href="./js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/password.css">
		<link rel="stylesheet" type="text/css" href="./css/userinfo.css">
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	    <script type="text/javascript" src="js/changePassword.js"></script> 
	    <script language="javascript" src="js/update.js"></script>
	    <script language="javascript" src="js/pcasunzip.js"></script>  		
	</head>
	 <body>
<!-- start header -->
	<jsp:include page="head.jsp"></jsp:include>		
<!-- start header -->

<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./dingdanzhongxin.html" >我的订单</a></li>
					<li></li>
		
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user_info.action?username=${user.username}" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
					<li><a href="javascript:showDialog1()">修改密码</a></li>
				</ul>
			</div>
		
		</div>
		<div class="rtcont fr">
			<div class="grzlbt ml40">我的资料</div>
			<form action="update.action" method="post" onsubmit="return Check()">
			<div class="subgrzl ml40"><span>用户名</span><input type="text" value='${user.username}' name="username"class="input" readonly><span id="span6">不可修改</span></div>
			<div class="subgrzl ml40"><span>手机号</span><input type="text" value='${user.phonenum}' id="phonenum" name="phonenum" class="input" onblur="checkTel()"><span id="span4">此处修改手机号</span></div>
			<div class="subgrzl ml40"><span>性别</span>
			
			<c:if test="${user.sex=='男'}">
			
			<input type="radio" name="sex" value="男" class="radio" checked="checked">
			<font size="5px" color=#444>男</font>
						
            <input type="radio" name="sex" value="女" class="radio_r">
            <font size="5px" color=#444>女</font>
            </c:if>
            <c:if test="${user.sex=='女'}">
			<input type="radio" name="sex" value="男" class="radio">
			<font size="5px" color=#444>男</font>
            <input type="radio" name="sex" value="女" checked="checked" class="radio_r">
            <font size="5px" color=#444>女</font>
            </c:if> 
                                                    
            </div>
			<div class="subgrzl ml40"><span>真实姓名</span><input type="text" value='${user.realname}' id="realname" name="realname" class="input" onblur="checkName()"><span id="span5">此处修改姓名</span></div>
			<div class="subgrzl ml40"><span>收货地址</span>
			
	
			<c:if test="${empty user.address}">
			<input type="text" value="暂未填写" class="input">
			</c:if>
			<c:if test="${not empty user.address}">
			<input type="text" value='${user.address}'class="input">
			</c:if>
			</div>
			<div class="button">
			<input type="submit" class="save" value="保存" > 
			<input type="reset" class="save" value="重置" >
			</div>
			</form>	
		</div>
		
		
		<div class="clear"></div>
		</div>
	</div>
	
<!-- 修改密码框 -->	
    <div class="ui-mask1" id="mask1"  onselectstart="return false"></div>
	<div class="ui-dialog1" id="dialogMove1" onselectstart='return false;'>
	<div class="ui-dialog-title1" id="dialogDrag1"  onselectstart="return false;" >
	<a class="ui-dialog-closebutton1" href="javascript:hideDialog1();"></a>
	</div> 
        <div class="nav2">
        <div class="nav1">
        <form action="${pageContext.request.contextPath}/changePassword.action" method="post"   onsubmit="return check()">
               <input type="hidden" name="username" value='${user.username}'>
            <p>
                <label for="oldpassword">原密码：</label>
                <input type="password" id="oldpassword" name="oldpassword" height="30px" onblur="checkOldPassWord()"><span id="span1">请输入原密码</span>
            </p>
            <p>
                <label for="password">新密码：</label>
                <input type="password" id="password" name="password" height="30px" onblur="checkPassWord()"><span id="span2">密码为6-16位</span>
            </p>
            <p>
                <label for="repassword">确认密码：</label>
                <input type="password" id="repassword" height="30px" onblur="checkRePassWord()"><span id="span3">请再次输入密码</span>
            </p>
            <button>
                <img src="picture/queren.jpg">
            </button>
           
        </form>
    </div>
   </div>
</div>
		<footer class="mt20 center">			
		</footer>
	</body>
</html>