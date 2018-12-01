<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>个人中心</title>
<link href="js/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/password.css">
<link rel="stylesheet" type="text/css" href="css/userinfo.css">
<link rel="stylesheet" type="text/css" href="css/address.css">
<link rel="stylesheet" type="text/css" href="css/base.css">
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script type="text/javascript" src="js/update.js"></script>
<script type="text/javascript" src="js/editAddress2.js"></script>
<script language="javascript">
	function switchTag(content) {
              
		for (i = 1; i <= 3; i++) {
			if ("content" + i == content) {
				var a="a"+i;
				
				document.getElementById(content).style = 'display:block';
				document.getElementById(a).style='color: #ff6700; font-weight: bold';
			} else {
				document.getElementById("content" + i).style = 'display:none';
				document.getElementById("a"+i).style='font-weight:normal;';
			}
		}
	}
</script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="grzxbj">
		<div class="selfinfo center">
			<div class="lfnav fl">
				<div class="ddzx">订单中心</div>
				<div class="subddzx">
					<ul>
						<li><a href="javascript:void(0)"
							onclick="switchTag('content2');" id="a2">我的订单</a></li>
						<li></li>

					</ul>
				</div>
				<div class="ddzx">个人中心</div>
				<div class="subddzx">
					<ul>
						<li><a href="javascript:void(0)"
							
							onClick="switchTag('content1');this.blur();" id="a1">我的个人中心</a></li>
						<li><a href="javascript:void(0)" id="show1">修改密码</a></li>
						<li><a href="javascript:void(0)"
							onClick="switchTag('content3');this.blur();" id="a3">收货地址</a></li>
					</ul>
				</div>

			</div>
			<div class="rtcont fr" id="content1">
				<div class="grzlbt ml40">我的资料</div>
				<form id="formUpdate" onsubmit="return false" method="post">
					<div class="subgrzl ml40">
					<input type="hidden" id="old" value='${user.password}'>
						<span>用户名</span><input type="text" value='${user.username}'
							name="username" class="input" readonly><span id="span6">不可修改</span>
					</div>
					<div class="subgrzl ml40">
						<span>手机号</span><input type="text" value='${user.phonenum}'
							id="phonenum" name="phonenum" class="input"><span
							id="span4">此处修改手机号</span>
					</div>
					<div class="subgrzl ml40">
						<span>性别</span>

						<c:if test="${user.sex=='男'}">

							<input type="radio" name="sex" value="男" class="radio"
								checked="checked">
							<font size="5px" color=#444>男</font>

							<input type="radio" name="sex" value="女" class="radio_r">
							<font size="5px" color=#444>女</font>
						</c:if>
						<c:if test="${user.sex=='女'}">
							<input type="radio" name="sex" value="男" class="radio">
							<font size="5px" color=#444>男</font>
							<input type="radio" name="sex" value="女" checked="checked"
								class="radio_r">
							<font size="5px" color=#444>女</font>
						</c:if>

					</div>
					<div class="subgrzl ml40">
						<span>真实姓名</span><input type="text" value='${user.realname}'
							id="realname" name="realname" class="input"><span
							id="span5">此处修改姓名</span>
					</div>
					<div class="subgrzl ml40"></div>
					<div class="button">
						<input type="submit" class="save" value="保存" id="baochun"> <input
							type="reset" class="save" value="重置">
					</div>
				</form>
			</div>


			<div class="rtcont fr" id="content2" style="display: none">
				<div class="ddzxbt">交易订单</div>
				<c:forEach items="${orderItems}" var="item"
											varStatus="orderItems">
				<div class="ddxq">
					<div class="ddspt fl">
						<img src="/WebStore/${item.bookpic}" alt="" width="80px" height="80px">
					</div>
					<div class="ddbh fl">书名:${item.bookname} 订单号:1705${item.id}</div>&nbsp;
					
					<div class="ztxx fr">
						<ul>
							<li>未发货</li>
							<li>￥${item.sum}</li>
							<li>2018/11/20 13:30</li>
							<li><a href="javascript:void(0)">订单详情></a></li>
							<div class="clear"></div>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				</c:forEach>

			</div>


			<!-- 收货地址 -->
			<div class="rtcont fr" id="content3" style="display: none">

				<div class="checkout-box">
					
						<div class="checkout-box-bd">
							<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->

							<!-- 收货地址 -->
							<div class="xm-box">
								<div class="box-hd ">
									<h2 class="title">收货地址</h2>
								</div>
								<div class="box-bd">
									<div class="clearfix xm-address-list" id="checkoutAddrList">

										<c:forEach items="${addressList}" var="address"
											varStatus="addressList">
											<dl class="item">

												<dt>
													<input type="hidden" value="${user.userid}"
														class="userid"> <input type="hidden"
														class="addressId" value="${address.id}"> <strong
														class="itemConsignee">${address.consignee}</strong> <span
														class="itemTag tag">${address.tag}</span>
												</dt>
												<dd>
													<p class="tel itemTel">${address.tel}</p>
													<span class="province">${address.province}</span><span
														class="city">${address.city}</span> <span class="county">${address.county}</span>
														<p>(<span class="zipcode">${address.zipcode}</span>)
													<p class="itemStreet">${address.street} </p>
													<div class="edit-btn1">
													<button class="J_editAddr">编辑</button>
													<button class="J_delAddr">删除</button>
													</div>
												</dd>
											</dl>
										</c:forEach>

										<div class="item use-new-addr" id="J_useNewAddr">
											<span class="iconfont icon-add"><img
												src="picture/add_cart.png" /></span> 使用新地址
										</div>
									</div>
									<!--点击弹出新增/收货地址界面start-->
									<div class="xm-edit-addr-box" id="J_editAddrBox">
										<div class="bd">
											<div class="item">
												<label>收货人姓名<span>*</span></label> <input type="text"
													name="consignee" id="Consignee" class="input2"
													placeholder="收货人姓名" maxlength="15" autocomplete='off' />
												<p class="tip-msg tipMsg"></p>
											</div>
											<input type="hidden" value="${user.userid}"
												name="userid" id="userid"> <input type="hidden"
												id="ID">
											<div class="item">
												<label>联系电话<span>*</span></label> <input type="text"
													name="tel" class="input2" id="Telephone"
													placeholder="11位手机号" autocomplete='off' />
												<p class="tel-modify-tip" id="telModifyTip"></p>
												<p class="tip-msg tipMsg"></p>
											</div>
											<div class="item">
												<label>地址<span>*</span></label>
												<div class="distpicker" id="target">
													<select class="select-1" id="Provinces" name="province"></select>
													<select class="select-2" id="Citys" name="city"></select> <select
														class="select-3" id="Countys" name="district"></select>
												</div>
												<textarea name="street" class="input-area" id="Street"
													placeholder="路名或街道地址，门牌号"></textarea>
												<p class="tip-msg tipMsg"></p>
											</div>
											<div class="item">
												<label>邮政编码<span>*</span></label> <input type="text"
													name="zipcode" id="Zipcode" class="input2"
													placeholder="邮政编码" autocomplete='off' />
												<p class="zipcode-tip" id="zipcodeTip"></p>
												<p class="tip-msg tipMsg"></p>
											</div>
											<div class="item">
												<label>地址标签<span>*</span></label> <input type="text"
													name="tag" id="Tag" class="input2"
													placeholder='地址标签：如"家"、"公司"。限5个字内' />
												<p class="tip-msg tipMsg"></p>
											</div>
										</div>
										<div class="ft clearfix">
											<button type="button" class="btn btn-lineDake btn-small "
												id="J_editAddrCancel">取消</button>
											<button type="button" class="btn btn-primary  btn-small "
												id="J_editAddrOk">保存</button>
										</div>
									</div>
									<!--点击弹出新增/收货地址界面end-->
									<div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>

								</div>
							</div>
						</div>
					
				</div>
			</div>

			<div class="clear"></div>

		</div>
	</div>

	<!-- 修改密码框 -->
	<div class="ui-mask1" id="mask1" onselectstart="return false"></div>
	<div class="ui-dialog1" id="dialogMove1" onselectstart='return false;'>
		<div class="ui-dialog-title1" id="dialogDrag1"
			onselectstart="return false;">
			<a class="ui-dialog-closebutton1" href="javascript:void(0);" id="hide1"></a>
		</div>
		<div class="nav2">
			<div class="nav1">
				<form
					action="${pageContext.request.contextPath}/changePassword.action"
					method="post" onsubmit="return check()">
					<input type="hidden" name="username" value="${user.username}">
					
					<p>
						<label for="oldpassword">原密码：</label> <input type="password"
							id="oldpassword" name="oldpassword" height="30px"><span id="span1">请输入原密码</span>
					</p>
					<p>
						<label for="password">新密码：</label> <input type="password"
							id="password1" name="password" height="30px"
							><span id="span2">密码为6-16位</span>
					</p>
					<p>
						<label for="repassword">确认密码：</label> <input type="password"
							id="repassword" height="30px" ><span
							id="span3">请再次输入密码</span>
					</p>
					<div class="bt_button">
						<input type="submit" class="save1" value="确认修改">
					</div>


				</form>
			</div>
		</div>
	</div>
	<footer class="mt20 center"> </footer>
</body>
</html>