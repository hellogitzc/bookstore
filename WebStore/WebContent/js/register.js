
    window.onload=function(e)
    {
        var form=document.querySelector('form');
        var userName=document.querySelector('#username');
        var passWord=document.querySelector('#password');
        var rePassWord=document.querySelector('#repassword');
        var name=document.querySelector('#name');
        var tel=document.querySelector('#tel');
        var span=document.querySelectorAll('span');

        //onsubmit事件
        form.onsubmit=function(e)
        {
            var username=checkUserName();
            if(!username)
            {
                return false;
               
            }
          
            var password=checkPassWord();
            if(!password)
            {
                return false;
            }
            var rePassWord=checkRePassWord();
            if(!rePassWord)
            {
                return false;
            }
            var name=checkName();
            if(!name)
            {
                return false;
            }
           
            var tel=checkTel();
            if(!tel)
            {
                return false;
            }
            alert("注册成功!快去登录吧!");
            return true;
           
        };



        //onblur失去焦点事件
        userName.onblur=function(e)
        {
            checkUserName();
        };
        passWord.onblur=function(e)
        {
            checkPassWord();
        };
        rePassWord.onblur=function(e)
        {
            checkRePassWord();
        };
        name.onblur=function(e)
        {
            checkName();
        };
       
        tel.onblur=function(e)
        {
            checkTel();
        };
      



//---------------------------------函数封装-------------------------------------------------------------
       //通行证用户名
    	
    	 function checkUserName(e)
         {
            if(userName.value.length==0)
            {
                span[0].innerText='用户名不能为空';
                span[0].className='danger';
                return false;
            }
            var pattern=/[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}$/;
            var flag=false;
             if(!pattern.test(userName.value))
            {
                span[0].innerText='用户名格式错误，请重新输入';
                span[0].className='danger';
                return false;
            }
            	$.ajax({ //一个Ajax过程
        		type: "post", //以post方式与后台沟通
        		url :"/WebStore/checkUserName.action", //与此页面沟通
        		
        		data: 'username='+userName.value, //发给的数据
        		cache: false,//禁用缓存
        		async:false,
        		error: function (XMLHttpRequest, textStatus, errorThrown) { },
        		success: function(data){
        			
        			if(data==0){
        				span[0].innerText='用户名已存在';
        				span[0].className='danger';       				
        				
        				
        			}else {
        				span[0].innerText='用户名输入正确';
        	            span[0].className='success';
        	            flag = true;
        	     
        				
        			}
        		}
        		
        });   
            	return flag;
            	
           }
   
      
       
      	
        //登录密码
        function checkPassWord(e)
        {
            if(passWord.value.length==0)
            {
                span[1].innerText='密码不能为空';
                span[1].className='danger';
                return false;
            }
            var pattern=/^[A-Za-z0-9]{6,16}$/;
            if(!pattern.test(passWord.value))
            {
                span[1].innerText='密码不符合格式，请重新输入';
                span[1].className='danger';
                return false;
            }
            span[1].innerText='密码输入正确';
            span[1].className='success';
            return true;
        }

        //重复登录密码
        function checkRePassWord(e)
        {
            if(rePassWord.value.length==0)
            {
                span[2].innerText='重复密码不能为空';
                span[2].className='danger';
                return false;
            }
            if(rePassWord.value!=passWord.value)
            {
                span[2].innerText='两次输入的密码不一致，请重新输入';
                span[2].className='danger';
                return false;
            }
            span[2].innerText='两次密码一致';
            span[2].className='success';
            return true;
        }


        //真实姓名（2-4位汉字）
        function checkName(e)
        {
            if(name.value.length==0)
            {
                span[3].innerText='真实姓名不能为空';
                span[3].className='danger';
                return false;
            }
            var pattern=/^[\u4e00-\u9fa5]{2,4}$/;
            if(!pattern.test(name.value))
            {
                span[3].innerText='真实姓名格式错误，请重新输入';
                span[3].className='danger';
                return false;
            }
            span[3].innerText='真实姓名输入正确';
            span[3].className='success';
            return true;
        }



        //手机号（）
        function checkTel(e)
        {
            if(tel.value.length==0)
            {
                span[4].innerText='手机号不能为空';
                span[4].className='danger';
                return false;
            }
            var pattern=/^1[34578]\d{9}$/;
            if(!pattern.test(tel.value))
            {
                span[4].innerText='手机号码格式错误，请重新输入';
                span[4].className='danger';
                return false;
            }
            span[4].innerText='手机号输入正确';
            span[4].className='success';
            return true;
        }


       
    }
