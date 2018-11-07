function g(id){return document.getElementById(id);}
		  var span=document.querySelectorAll('span1');
		function checkOldPassWord()
        {
	        
    	 if(g('oldpassword').value.length==0)
            {
                g('span1').innerText='密码不能为空';
                g('span1').className='danger';
                return false;
            }
            if(g('oldpassword').value!='${user.password}')
            {
            	g('span1').innerText='原密码输入错误';
            	g('span1').className='danger';
                return false;
            }
            g('span1').innerText='原密码正确';
            g('span1').className='success';
            return true;
           
        }
        
	  function checkPassWord()
	  
        {      
            if(g('password').value.length==0)
            {
            	g('span2').innerText='密码不能为空';
            	g('span2').className='danger';
                return false;
            }
            var pattern=/^[A-Za-z0-9]{6,16}$/;
            if(!pattern.test(g('password').value))
            {
            	g('span2').innerText='密码不符合格式，请重新输入';
            	g('span2').className='danger';
                return false;
            }
            g('span2').innerText='密码输入正确';
            g('span2').className='success';
            return true;
        }


        //重复新密码
        function checkRePassWord()
        {      
            if(g('repassword').value.length==0)
            {
            	g('span3').innerText='重复密码不能为空';
            	g('span3').className='danger';
                return false;
            }
            if(g('repassword').value!=g('password').value)
            {
            	g('span3').innerText='两次输入的密码不一致，请重新输入';
            	g('span3').className='danger';
                return false;
            }
            g('span3').innerText='两次密码一致';
            g('span3').className='success';
            return true;
        }

        
        
       
	   function check()
        {  
		    var oldpassword=checkOldPassWord();
            if(!oldpassword)
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
           
            alert("密码修改成功,请重新登录.");
            return true;
           
        };
		function autoCenter( el ){
			var bodyW = document.documentElement.clientWidth;
			var bodyH = document.documentElement.clientHeight;

			var elW = el.offsetWidth;
			var elH = el.offsetHeight;

			el.style.left = (bodyW-elW)/2 + 'px';
			el.style.top = (bodyH-elH)/2 + 'px';
			
		}
		function fillToBody( el ){
			el.style.width  = document.documentElement.clientWidth  +'px';
			el.style.height = document.documentElement.clientHeight + 'px';
		}

		//标记状态，只有在弹出对话框的时候才变成1
		var flag=0;
		
		//展示对话框
		function showDialog1(){
			$('body').css('overflow-y','hidden');
			$('body').css('overflow-x','hidden');
			g('dialogMove1').style.display = 'block';
			g('mask1').style.display = 'block';
			autoCenter( g('dialogMove1') );
			window.onload;
			fillToBody( g('mask1') );	
			flag=1;
		}
		
		//	关闭对话框
		function hideDialog1(){
			$('body').css('overflow-y','scroll');
			$('body').css('overflow-x','scroll');
			g('dialogMove1').style.display = 'none';
			g('mask1').style.display = 'none';
			
			flag=0;
			
		}   
		//	监听窗口大小变化
		window.onresize = function(){ 
			if(flag==1){
				showDialog();
				}
       } 