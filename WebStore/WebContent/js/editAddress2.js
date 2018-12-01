$(function() {
	// 新建地址按钮
	var a = document.getElementById("J_editAddrBox");
	var ab = document.getElementById("J_editAddrBackdrop");
	var $j = jQuery.noConflict();
	
	function autoCenter(el) {
		var bodyW = document.documentElement.clientWidth;
		var bodyH = document.documentElement.clientHeight;

		var elW = el.offsetWidth;
		var elH = el.offsetHeight;

		el.style.left = (bodyW - elW) / 2 + 'px';
		el.style.top = (bodyH - elH) / 2 + 'px';

	}
	var judge = 0;
	function fillToBody(el) {
		el.style.width = document.documentElement.clientWidth + 'px';
		el.style.height = document.documentElement.clientHeight + 'px';
	}
	// 标记状态，只有在弹出对话框的时候才变成1
	var flag = 0;
	// 展示对话框
	function showDialog3() {
		$('body').css('overflow-y', 'hidden');
		$('body').css('overflow-x', 'hidden');
		a.style.display = 'block';
		a.style.width = '300px';
		ab.style.display = 'block';
		autoCenter(a);
		fillToBody(ab);
		flag = 1;
	}
	// 关闭对话框
	function hideDialog3() {
		$('body').css('overflow-y', 'scroll');
		$('body').css('overflow-x', 'scroll');
		a.style.display = 'none';
		ab.style.display = 'none';
		flag = 0;
	}
	// 监听窗口大小变化
	window.onresize = function() {
		if (flag == 1) {
			showDialog3();
		}
	}
 //新建收货地址
	$('#J_useNewAddr').click(function() {
		
		$("#checkoutAddrList").find(".item").removeClass("selected");
		$('#target').distpicker('destroy');
		$('#target').distpicker({
			province: '北京市',
            city: '北京市辖区',
            district: '东城区'
});
		 judge=0;
		
		showDialog3();
	});
	var consignee = $('#Consignee'), tel = $("#Telephone"), street = $("#Street"), zipcode = $("#Zipcode"), Tag = $("#Tag");

	function checkTel() {
		if (tel.val().length == 0) {
			tel.focus(), tel.siblings(".tipMsg").html('手机号不能为空').show();
			return false;
		}

		var pattern = /^1[0-9]{10}$/;
		var w = $.trim(tel.val());
		if (!pattern.test(w)) {
			tel.focus(), tel.siblings(".tipMsg").html('请填写11位手机号').show();

			return false;
		}
		tel.siblings(".tipMsg").html("").hide();
		return true;
	}
	;

	function checkConsignee() {
		if (consignee.val().length == 0) {
			consignee.focus(), consignee.siblings(".tipMsg").html('不能为空')
					.show();

			return false;
		}

		var pattern = /^[a-zA-Z\u4e00-\u9fa5]+$/;

		if (!pattern.test(consignee.val())) {
			consignee.focus(), consignee.siblings(".tipMsg").html(
					'收货人姓名不正确（只能是英文、汉字）').show();

			return false;
		}
		consignee.siblings(".tipMsg").html("").hide();
		return true;
	}
	;
	function checkStreet() {
		if (street.val().length == 0) {
			street.focus(), street.siblings(".tipMsg").html('不能为空').show();

			return false;
		}

		if (!street.val().length >= 5 && street.val().length <= 32) {
			street.focus(), street.siblings(".tipMsg").html(
					'详细地址长度不对，最小为 5 个字，最大32个字').show();

			return false;
		}
		var n = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var o = /^\d+$/;
		var p = /^[0-9a-zA-Z]+$/;
		if (n.test(street.val()) || o.test(street.val())
				|| p.test(street.val())) {
			street.focus(), street.siblings(".tipMsg").html('详细地址不正确').show();
			return false;
		}
		street.siblings(".tipMsg").html("").hide();
		return true;
	}
	;
	function checkZipcode() {
		var l = /^\d{6}$/;
		var F = $.trim(zipcode.val());
		if (!l.test(F)) {
			zipcode.focus(), zipcode.siblings(".tipMsg").html(
					'邮编是6位数，如果不清楚，则输入000000').show();
			return false;
		}
		zipcode.siblings(".tipMsg").html("").hide();
		return true;
	}
	;
	function checkTag() {
		if (Tag.val().length == 0) {
			Tag.focus(), Tag.siblings(".tipMsg").html('不能为空').show();

			return false;
		}

		if (Tag.val().length > 5) {
			Tag.focus(), Tag.siblings(".tipMsg").html('地址标签最长5个字').show();

			return false;
		}
		Tag.siblings(".tipMsg").html("").hide();
		return true;
	}
	;

	$('#J_editAddrOk').click(function() {
		var Province = $(".select-1").find("option:selected").text();
		var City = $(".select-2").find("option:selected").text();
		var County = $(".select-3").find("option:selected").text();
		var   c = $("#Consignee"), 
	          g = $("#Street"),
	          h = $("#Zipcode"),
	          t = $("#Telephone"),
	          j = $("#Tag"),
		      i = $("#ID");
		
		var con = checkConsignee();
		
		if (!con) {
			return false;

		}
		var te = checkTel();
		if (!te) {
			return false;
		}
		var st = checkStreet();
		if (!st) {
			return false;
		}
		var zip = checkZipcode();
		if (!zip) {
			return false;
		}

		var tag = checkTag();
		if (!tag) {
			return false;
		}
		var address = {
                userid: $('#userid').val(),
                consignee: c.val(),
                tel: t.val(),
                province: Province,
                city: City,
                county: County,
                street: g.val(),
                zipcode: h.val(),
                tag: j.val()
            };
		
		// 0代表新建状态
		if (judge == 0) {
			
			
			 $.ajax({
	                url: "/WebStore/createAddress",
	                type: "post",
	                async: false,
	                cache: false,
	                data: address,
	                success: function(data) {
	                	if(data!=null){
	                	
	                	location.reload(true);
	                	}
	                }
	            });
			 
			   alert("新的收货地址添加成功!");
		}
		// 1代表修改状态
		if(judge==1){
			address.id=i.val();			
			 $.ajax({
	                url: "/WebStore/updateAddress",
	                type: "post",
	                async: false,
	                cache: false,
	                data: address,
	                success: function(data) {
	                	if(data!=null){
	                	location.reload(true);
	                	}	
	                }
	            });	 
		alert("收货地址修改成功!");
		}
		resetData();
		hideDialog3();
		return true;

	});
	$(".J_delAddr").click(	
			function() {
				var con = confirm("确定删除该收获地址?");
				if(con){
				var $p = $(this).parents('.item'),
			    $id = $p.find('.addressId').val();
				 $.ajax({
		                url: "/WebStore/deleteAddress",
		                type: "post",
		                async: false,
		                cache: false,
		                data: "id="+$id,
		                dataType:"Text",
		                success: function(data) {
		                	if(data!=null){
		                	
		                	location.reload(true);
		                	}	
		                }
				
					});
				 }
			});
	function resetData() {
		$("#Consignee").val(""), $("#Street").val(""), $("#Telephone").val("")
				.attr("placeholder", "11位手机号"), $("#Zipcode").val(""),
				$("#Tag").val("");
		
		$(".tipMsg").html("").hide();
	}
	// 取消按钮
	$('#J_editAddrCancel').click(function() {
		resetData();
		$('#target').distpicker('destroy');
		hideDialog3();
	})
	$("#checkoutAddrList").find(".item").on("click", function() {
		$("#checkoutAddrList").find(".item").removeClass("selected");
		$(this).addClass("selected");
	});
	// 编辑按钮

	$(".J_editAddr").click(
			
			function() {
				console.log("edit");
				var $p = $(this).parents('.item');
					$consignee = $p.find('.itemConsignee').html(),
					$tel = $p.find('.itemTel').html(), 
					$tag = $p.find('.itemTag').html(), 
					$street = $p.find('.itemStreet').html(),
					$zipcode = $p.find('.zipcode').html(),
				    $province = $p.find('.province').html(),
					$city = $p.find('.city').html(), 
					$county = $p.find('.county').html();
					$id = $p.find('.addressId').val();
				
  			  $('#target').distpicker('destroy');
  			  $('#target').distpicker({
  			  province: $province,
  			  city: $city,
  			  district:$county
  			});
			$('#Consignee').val($consignee), 
			$("#Telephone").val($tel), 
			$("#Street").val($street), 
			$("#Tag").val($tag), 
			$("#Zipcode").val($zipcode),
			$("#ID").val($id),
			
			judge = 1;
			showDialog3();
    });
	
});
