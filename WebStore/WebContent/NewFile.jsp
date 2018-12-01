<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/checkOut.css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script type="text/javascript" src="js/editAddress.js"></script>
<title>Insert title here</title>
</head>
<body>
<dl class="item">
<dd>
<span class="province">天津市</span><span
class="city">天津市市辖区</span> <span class="county">河西区</span>
<p class="itemStreet">丰台区</p>

<span class="edit-btn J_editAddr">编辑</span>
</dd>
</dl>
<div class="item use-new-addr" id="J_useNewAddr">
										<span class="iconfont icon-add"><img
											src="picture/add_cart.png" /></span> 使用新地址
									</div>
<div class="xm-edit-addr-box" id="J_editAddrBox">
									<div class="bd">
										<div class="item">
											<label>收货人姓名<span>*</span></label> <input type="text"
												name="consignee" id="Consignee" class="input"
												placeholder="收货人姓名" maxlength="15" autocomplete='off' />
											<p class="tip-msg tipMsg"></p>
										</div>
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
</body>
</html>