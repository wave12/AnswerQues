/**
 * 
 */

   function check() {
  	var objUserName = document.getElementById('userName');
  	var objPass = document.getElementById('pass');
  	if (objUserName.value == "" || objUserName.value == "邮箱或手机") {
  		//alert('用户名不能为空!');
  		var UserNameErr = document.getElementById('userNameErr');
  		UserNameErr.style.display = "block";
  		objUserName.focus();
  		return false;
  	}
  	if (objPass.value == "" || objPass.value == "登陆密码") {
  		//alert('密码不能为空!');
  		var PassErr = document.getElementById('passErr');
  		PassErr.style.display = "block";
  		objPass.focus();
  		return false;
  	}
  	
    $.ajax({
  		type:"post",
  		url:"loginJsonAction",
  		data:{ 
  		        userName:objUserName.value,
  			    pass:objPass.value
  		},
  		dataType:"json",
  		success:function(data){
  			//alert(data);  			
  			if (data == "0" || data == "-1") {
  				ShowLoginErr();
  			}
  			else {    // 登陆成功
  				$('#userID').val(data);
  				$('#dialog').dialog('close'); 
  				$('#mask').remove(); 
  				
  				var nextUIValue = $('#nextUI').val();  				 
  				if (nextUIValue != "")
  					ShowUI(nextUIValue);
  			}
  		},
  		error:function() {
  		    alert('系统异常，请稍后再试!');
  		}
  	 });
  	 
  }
  
  function ShowLoginErr()
  {      
  	  var UserNameErr = document.getElementById('userNameErr');
  	  UserNameErr.style.display = "block";
  	  UserNameErr.innerText = "用户名或密码不正确！";
  }
  
  function doKeydown(id) {
     var obj = document.getElementById(id);
      obj.style.color = "#222";
      var objErr = document.getElementById(id + 'Err');
      objErr.style.display = "none";
  }  
  
   function lostFocus(id) {
 	var userName = document.getElementById(id);
 	var value = userName.value;
 	if (value == "")
       	userName.style.color = "#999"; 
  }