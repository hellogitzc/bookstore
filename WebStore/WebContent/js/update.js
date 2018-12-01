$(function() {
	var realname = $("#realname");
	var phonenum = $("#phonenum");
	var span4 = document.getElementById("span4");
	var span5 = document.getElementById("span5");

	realname.blur(function() {

		checkName();
	});
	phonenum.blur(function() {

		checkTele();
	});
	function checkName() {
		if (realname.val().length == 0) {
			span5.innerText = '真实姓名不能为空';
			span5.className = 'error';
			return false;
		}
		var pattern = /^[\u4e00-\u9fa5]{2,4}$/;
		if (!pattern.test(realname.val())) {
			span5.innerText = '真实姓名格式错误，请重新输入';
			span5.className = 'error';
			return false;
		}
		span5.innerText = '真实姓名输入正确';
		span5.className = 'ok';
		return true;
	}
	function checkTele() {
		if (phonenum.val().length == 0) {
			span4.innerText = '手机号不能为空';
			span4.className = 'error';
			return false;
		}
		var pattern = /^1[34578]\d{9}$/;
		if (!pattern.test(phonenum.val())) {
			span4.innerText = '手机号码格式错误，请重新输入';
			span4.className = 'error';
			return false;
		}
		span4.innerText = '手机号输入正确';
		span4.className = 'ok';
		return true;
	}

	$('#baochun').click(function() {

		var name = checkName();
		if (!name) {
			return false;
		}

		var tel = checkTele();
		if (!tel) {
			return false;
		}
		$.ajax({
			// 几个参数需要注意一下
			type : "POST",// 方法类型
			url : "/WebStore/update",// url
			data : $('#formUpdate').serialize(),
			success : function(result) {
				alert("修改成功");
				location.reload(true);
				;
			}
		});
	})
	var span1 = document.getElementById("span1");
	var span2 = document.getElementById("span2");
	var span3 = document.getElementById("span3");
	var dialogMove1 = document.getElementById("dialogMove1");
	var mask1 = document.getElementById("mask");
	var oldpassword = $("#oldpassword");
	var old = $("#old").val();
	var repassword = $("#repassword");
	var password1 = $("#password1");
	oldpassword.blur(function() {
		checkOldPassWord();
	});
	repassword.blur(function() {

		checkRePassWord();
	});

	password1.blur(function() {

		checkPassWord();
	});

	$('#show1').click(function() {
	
		showDialog1();
	})
	$('#hide1').click(function() {
		hideDialog1();
	})

	function checkOldPassWord() {
		console.log(old);
		if (oldpassword.val().length == 0) {
			span1.innerText = '密码不能为空';
			span1.className = 'danger';
			return false;
		}
		if (oldpassword.val() != old) {
			span1.innerText = '原密码输入错误';
			span1.className = 'danger';
			return false;
		}
		span1.innerText = '原密码正确';
		span1.className = 'success';

		return true;

	}

	function checkPassWord()

	{
		if (password1.val().length == 0) {
			span2.innerText = '密码不能为空';
			span2.className = 'danger';
			return false;
		}
		var pattern = /^[A-Za-z0-9]{6,16}$/;
		if (!pattern.test(password1.val())) {
			span2.innerText = '密码不符合格式，请重新输入';
			span2.className = 'danger';
			return false;
		}
		span2.innerText = '密码输入正确';
		span2.className = 'success';
		return true;
	}

	// 重复新密码
	function checkRePassWord() {
		if (repassword.val().length == 0) {
			span3.innerText = '重复密码不能为空';
			span3.className = 'danger';
			return false;
		}
		if (repassword.val() != password1.val()) {
			span3.innerText = '两次输入的密码不一致，请重新输入';
			span3.className = 'danger';
			return false;
		}
		span3.innerText = '两次密码一致';
		span3.className = 'success';
		return true;
	}

	function check() {
		var oldpassword = checkOldPassWord();
		if (!oldpassword) {
			return false;
		}

		var password = checkPassWord();
		if (!password) {
			return false;
		}
		var rePassWord = checkRePassWord();
		if (!rePassWord) {
			return false;
		}
		alert("密码修改成功,请重新登录。");
		return true;

	}
	;
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

	// 标记状态，只有在弹出对话框的时候才变成1
	var flag = 0;

	// 展示对话框
	function showDialog1() {
		$('body').css('overflow-y', 'hidden');
		$('body').css('overflow-x', 'hidden');
		dialogMove1.style.display = 'block';
		mask1.style.display = 'block';
		autoCenter(dialogMove1);
		window.onload;
		fillToBody(mask1);
		flag = 1;
	}

	// 关闭对话框
	function hideDialog1() {
		$('body').css('overflow-y', 'scroll');
		$('body').css('overflow-x', 'scroll');
		dialogMove1.style.display = 'none';
		mask1.style.display = 'none';

		flag = 0;

	}
	// 监听窗口大小变化
	window.onresize = function() {
		if (flag == 1) {
			showDialog1();
		}
	}
})
