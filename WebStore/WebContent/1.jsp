<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"
     pageEncoding="UTF-8"%>  
<html>
<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" type="text/css" href="./css/login.css">
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
     <script type="text/javascript" src="./js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
     <link href="./js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
     <script type="text/javascript">
			
	
		// var zIndex = 9000;   

		//	
		function g(id){return document.getElementById(id);}

		
		function autoCenter( el ){

			var st=document.documentElement.scrollTop;//æ»å¨æ¡è·é¡¶é¨çè·ç¦» 
			 
			var sl=document.documentElement.scrollLeft;//æ»å¨æ¡è·å·¦è¾¹çè·ç¦» 
						
			var bodyW = document.documentElement.clientWidth;
			var bodyH = document.documentElement.clientHeight;

			var elW = el.offsetWidth;
			var elH = el.offsetHeight;

			el.style.left = (bodyW-elW)/2 + 'px';
			el.style.top = (bodyH-elH)/2 + 'px';
			
		}

		
		function fillToBody( el ){
			el.style.width  = document.documentElement.clientWidth  +'px';
			el.style.height = document.documentElement.clientHeight + 'px';
		}

		

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
		<title>叮当网上书店</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	 <body>

	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="" target="_blank">欢迎来到叮当网上书店</a></li>
						
						<li><a href=""></a></li>
						
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="">购物车</a></div>
					<div class="fr">
						<ul>
							<li><a onClick="javascript:showDialog()">登录</a></li>
							<li>|</li>
							<li><a href="./register.html" target="_blank" >注册</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
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
					<li><a href="./liebiao.html" target="_blank">全部图书</a></li>
					<li><a href="">IT</a></li>
					<li><a href="">幼教</a></li>
					<li><a href="">文学</a></li>
					<li><a href="">历史</a></li>
					<li><a href="">教材</a></li>
					<li><a href=""></a></li>
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

<div class="ui-mask" id="mask" onselectstart="return false"></div>
	<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
	<div class="ui-dialog-title" id="dialogDrag"  onselectstart="return false;" >
	<a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>
	</div>
	
<!-- 登录框 -->	
	   <form  method="post" action="./login.action" class="form center" >

		<div class="login" id= >
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">用户登录</div>
					<div class="right fr">还没有账号？点击此处注册<a href="./register.html" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名：&nbsp;<input class="shurukuang" type="text" name="name" placeholder="è¯·è¾å¥ä½ çç¨æ·å"/></div>
					<div class="username">密码：&nbsp;&nbsp;&nbsp;&nbsp;ç :&nbsp;<input class="shurukuang" type="password" name="password" placeholder="è¯·è¾å¥ä½ çå¯ç "/></div>
					<div class="username">
						<div class="left fl">验证码  :&nbsp;<input class="yanzhengma" type="text" name="username" placeholder="è¯·è¾å¥éªè¯ç "/></div>
						<div class="right fl"><img src="./image/yanzhengma.jpg"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="submit" name="submit" value="ç«å³ç»å½" >
				</div>
			</div>
		</div>
     </form>
     </div>

	<!-- start banner_y -->
		<div class="banner_y center">
			
		
		</div>	
        <div class="biaoti center">æ¨è</div>
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
	<!-- end banner -->
	<div class="tlinks">Collect from <a href="" ></a></div>

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center">çéä¹¦ç±</div>
			<div class="main center">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./picture/b1.jpg" alt="" width="150px" height="200px"></a></div>
					<div class="pinpai">ç²¾éJ2EE<a href=""></a></div>
					
					<div class="jiage">35å</div>
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./image/3.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">è½¯ä»¶æµè¯</a></div>
				
					<div class="jiage">99å</div>
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./picture/b3.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">æä½ç³»ç»</a></div>
					
					<div class="jiage">59å</div>
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="./picture/a25.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">æç±ä½ ï¼å¦å¦</a></div>
					<div class="jiage">39å</div>

					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>	
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./picture/b2.jpg" alt=""></a></div>
					<div class="pinpai">J2EEæå¨æå<a href=""></a></div>
					
					<div class="jiage">42å</div>
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				
				<div class="clear"></div>
				
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="./picture/c2.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">çªè¾¹çå°è±è±</a></div>
					
					<div class="jiage">29å</div>
					
				
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="./picture/c4.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">ç«¥å¿æäº</a></div>
					
					<div class="jiage">29å</div>
					
				
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
				
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="./picture/b5.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">ç½ç»å·¥ç¨å¸æç¨</a></div>
					
					<div class="jiage">49å</div>
					
				
					<div class="fu">
							<a href="">
								<span>åè´§éåº¦å¾å¿«ï¼å¾éå°ç±³6ï¼</span>
								
							</a>
						</div>
				</div>
			</div>
		</div>

 
		<footer class="mt20 center">			
			<div class="mt20"></div>
			<div></div> 
			<div></div>
		</footer>
	</body>
</html>