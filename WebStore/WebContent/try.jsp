<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/public.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/checkOut.css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var s = 0;
	$('#checkoutGoodsList').find('.item').each(function() {
		var $b = parseFloat($(this).find('.col-4').html());
		s += $b;

	});

	$('#checkoutGoodsList').find('#total').html(s.toFixed(2));
	$('#totalPrice').html(s.toFixed(2));
})
</script>
<script type="text/javascript" src="js/editAddress.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="border_top_cart">

		<div class="container">
			<div class="checkout-box">
				<form id="checkoutForm" action="${pageContext.request.contextPath}/addOrder" method="post">
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
											<input type="hidden" value="${cartList[0].userid}" class="userid">
										   
											<input type="hidden" class="addressId" value="${address.id}">
											<input type="hidden" class="addressdetial" 
											value=" ${address.consignee}/ ${address.tel}/ ${address.province}/ ${address.city}/ ${address.county}/ ${address.street}/ ">
												<strong class="itemConsignee">${address.consignee}</strong>
												<span class="itemTag tag">${address.tag}</span>
											</dt>
											<dd>
												<p class="tel itemTel">${address.tel}</p>
												<span class="province">${address.province}</span><span
													class="city">${address.city}</span> <span class="county">${address.county}</span>
												<p class="itemStreet">${address.street}</p>
												(<span class="zipcode">${address.zipcode}</span>) <span
													class="edit-btn J_editAddr">编辑</span>
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
										 <input type="hidden" value="${cartList[0].userid}" name="userid" id="userid">
										 <input type="hidden" id="ID">
										<div class="item">
											<label>联系电话<span>*</span></label> <input type="text"
												name="tel" class="input" id="Telephone" placeholder="11位手机号"
												autocomplete='off' />
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
												name="zipcode" id="Zipcode" class="input" placeholder="邮政编码"
												autocomplete='off' />
											<p class="zipcode-tip" id="zipcodeTip"></p>
											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>地址标签<span>*</span></label> <input type="text"
												name="tag" id="Tag" class="input"
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
							<div id="checkoutPayment">
								<!-- 支付方式 -->
								<div class="xm-box">
									<div class="box-hd ">
										<h2 class="title">支付方式</h2>
									</div>
									<div class="box-bd">
										<ul id="checkoutPaymentList"
											class="checkout-option-list clearfix J_optionList">
											<li class="item selected"><input type="radio" name="pay"
												checked="checked" value="1"  class="choice"/>
												<p>
													在线支付<span></span>
												</p></li>
											<li class="item"><input type="radio" name="pay"
												value="0"  class="choice" />
												<p>
													货到付款<span></span>
												</p></li>
										</ul>
									</div>
								</div>
								<!-- 支付方式 END-->
								<div class="xm-box">
									<div class="box-hd ">
										<h2 class="title">配送方式</h2>
									</div>
									<div class="box-bd">
										<ul id="checkoutShipmentList"
											class="checkout-option-list clearfix J_optionList">
											<li class="item selected"><input type="radio"
												name="shipment" checked="checked" value="1" />
												<p>
													快递配送（免运费）<span></span>
												</p></li>
										</ul>
									</div>
								</div>
								<!-- 配送方式 END-->

								<div class="checkout-box-ft">
									<!-- 商品清单 -->
									<div id="checkoutGoodsList" class="checkout-goods-box">
										<div class="xm-box">
											<div class="box-hd">
												<h2 class="title">确认订单信息</h2>
											</div>
											<div class="box-bd">
												<dl class="checkout-goods-list">
													<dt class="clearfix">
														<span class="col col-1">商品名称</span> <span
															class="col col-2">购买价格</span> <span class="col col-3">购买数量</span>
														<span class="col col-4">小计（元）</span>
													</dt>
													<c:forEach items="${cartList}" var="cart"
														varStatus="cartList">
														<dd class="item clearfix">
														<input type="hidden" name="cartid" value="${cart.id}" class="cart_id">
														<input type="hidden" value="${cart.bookid}" class="bookid" >
														
															<div class="item-row">
																<div class="col col-1">
																	<div class="g-pic">
																		<img
																			src="${pageContext.request.contextPath}/${cart.bookpic}"
																			width="40" height="40" />
																	</div>
																	<div class="g-info">
																		<a href="#">${cart.bookname } </a>
																	</div>
																</div>
																<div class="col col-2">${cart.price}</div>
																<div class="col col-3">${cart.num }</div>
																<div class="col col-4">${cart.sum }</div>
															</div>
														</dd>
													</c:forEach>
												</dl>
												<div class="checkout-count clearfix">
													<div class="checkout-count-extend xm-add-buy">
														<h3 class="title">会员留言</h3>
														<br></br> <input type="text" id="content" name="content"/>

													</div>
													<!-- checkout-count-extend -->
													<div class="checkout-price">
														<ul>

															<li>订单总额：<span id="total"></span>
															</li>
															<li>活动优惠：<span>-0元</span> 
															</li>
															<li>优惠券抵扣：<span id="couponDesc">-0元</span>
															</li>
															<li>运费：<span id="postageDesc">0元</span>
															</li>
														</ul>
														<p class="checkout-total">
															应付总额：<span><strong id="totalPrice"></strong>元</span>
														</p>
													</div>
													<!--  -->
												</div>
											</div>
										</div>
									</div>
									<!-- 商品清单 END -->
                                       <input type="hidden" name="addressid" id="addressid">
                                       <input type="hidden" name="addressdetial" id="addressdetial">
									   <input type="hidden" name="status" id="status">
									   <input type="hidden" name="total" id="t_price">
									<div class="checkout-confirm">

										<a href="javascript:void(0)" class="btn btn-lineDakeLight btn-back-cart" id="back-to-cart">取消</a>
										<input type="button" class="btn btn-primary" value="立即下单"
											id="checkoutToPay" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>