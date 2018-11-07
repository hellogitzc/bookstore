function g(id){return document.getElementById(id);}
		 
		 function checkName()
	        {
	            if(g('realname').value.length==0)
	            {
	                span5.innerText='真实姓名不能为空';
	                span5.className='error';
	                return false;
	            }
	            var pattern=/^[\u4e00-\u9fa5]{2,4}$/;
	            if(!pattern.test(g('realname').value))
	            {
	                span5.innerText='真实姓名格式错误，请重新输入';
	                span5.className='error';
	                return false;
	            }
	            span5.innerText='真实姓名输入正确';
	            span5.className='ok';
	            return true;
	        }
		   function checkTel()
	        {
	            if(g('phonenum').value.length==0)
	            {
	                span4.innerText='手机号不能为空';
	                span4.className='error';
	                return false;
	            }
	            var pattern=/^1[34578]\d{9}$/;
	            if(!pattern.test(g('phonenum').value))
	            {
	                span4.innerText='手机号码格式错误，请重新输入';
	                span4.className='error';
	                return false;
	            }
	            span4.innerText='手机号输入正确';
	            span4.className='ok';
	            return true;
	        }

        function Check()
        {
            
          
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
            alert("修改成功！");
            return true;
           
        };

	