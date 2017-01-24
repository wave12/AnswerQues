<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${questionInfo.questionTitle}</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible"content="IE=edge"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css?20170116_1">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/back.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/askpro.css?20170120_4">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/wave12Editor.css?33356">

	<script language=javascript src="<%=path%>/js/wave12Editor.js"></script>
    <script src="<%=path%>/js/jquery-1.9.1.js"></script>
    <script src="<%=path%>/js/jquery-ui.min.js"></script>    
    <script src="<%=path%>/js/login.js?3423"></script> 
    <script src="<%=path%>/js/placeholderfriend.js"></script>
    
    <style type="text/css">
.intLink { cursor: pointer; }
img.intLink { border: 0;  }
#toolBar1 select { font-size:10px; }
#textBox {
  width: 540px;
  height: 200px;
  border: 1px #000000 solid;
  padding: 2px;
  overflow: scroll;
}
#textBox #sourceText {
  padding: 0;
  margin: 0;
  min-width: 498px;
  min-height: 200px;
} 
</style>

  </head>
  
  <script type="text/javascript">
     var g_cartID  = "";
     function HideTxt(userID,objID) {
     	var userId = document.getElementById("userID");
     	alert(userID);
    /* 	var inputs = document.getElementsByClassName("GivePay");
     	for(var i=0; i<inputs.length; i++) {
	     	if(objId == userId)
	     		inputs[i].style.display = "none";
     	}*/
     }
     function CloseHandle() {
     	var total_pay = 0;
     	var inputs = document.getElementsByName("input");
	    for(var i=0; i<inputs.length; i++) {
	    	var pay = inputs[i].value;
			if(pay != "") {
				total_pay += parseInt(pay);
		    }
	    }
    	if(${questionInfo.price} < total_pay) {
    		alert("超过总金额！");
    	}else if(${questionInfo.price} > total_pay){
    		alert("当前报酬仍有剩余！！");
    	}else {
    		alert("正在提交数据");
    	}
    	total_pay = 0;
     }
     //数据验证处理
     function DataVal() {
	 	var inputs = document.getElementsByName("input");
	    for(var i=0; i<inputs.length; i++) {
	    	var pay = inputs[i].value;
			if(pay != ""){
				var patten = /^-?\d+$/;  
				if(!patten.test(pay)){
					alert("金额应为整数！");
					inputs[i].focus();				
					return;
				}
				if(pay <= 0) {
					alert("最少为1元");
					inputs[i].focus();
					return;
				}
			}
	    }
    }
    
    function AnswerQuestion(id) {
		var uid = $('#userID').val();
		if (uid == '') {
		    $('#nextUI').val('dlgAnswer');
			RegisterDialog();
		}
		else
			ShowUI('dlgAnswer');
	}
	
	function ShowUI(id) {
	 	$('#' + id).dialog({
			resizable: false,
			height: 440,
			width: 700,
			modal: true 
		});
		$(".ui-dialog").css('z-index', '99999');
		/*$(".ui-dialog-titlebar").css('display', 'none');*/		
		
		$('body').append('<div id="mask"></div>');  
        $('#mask').fadeIn(300); 
	}
	
	function RegisterDialog() {
	    $("#dialog").dialog({
			resizable: false,
			height: 440,
			width: 400,
			modal: true 
		});
		$(".ui-dialog").css('z-index', '99999');
		/*$(".ui-dialog-titlebar").css('display', 'none');*/
		
		$('body').append('<div id="mask"></div>');  
        $('#mask').fadeIn(300); 
        
    }
   
    function AnswerDialog() {	                
	    $("#dlgAnswer").dialog({
			resizable: false,
			height: 180,
			width: 700, 
			modal: true 
		});
		$(".ui-dialog").css('z-index', '99999');
		$(".ui-dialog-titlebar").css('display', 'none');  	 
    }
    
     function AnswerHandle() {
        // 处理回复
        var uid = $('#userID').val();
        oCon = document.getElementById("textBox");
     
    	var con = oCon.innerHTML;
        //var con = $('#textBox').val();
        alert(con);
        $.ajax({
	  		type:"post",
	  		url:"AnswerQestionJsonAction",
	  		data:{ 
	  		        userID:uid,
	  			    questionID:'${questionInfo.id}',
	  			    con:con
	  		},
	  		dataType:"json",
	  		success:function(data){	  			  			 
	  			if (data == "1") { 
	  			    alert('回复成功！');  
	  			    $('#mask').remove();
	  			    $('#dlgAnswer').dialog('close');
	  			    window.location.reload();
	  			    				  
	  			}
	  			else {    	  			      
	  				alert('加入失败,请稍后再试!');
	  				$('#mask').remove();
	  				$('#dlgAnswer').dialog('close'); 
	  			}	  			
	  		},
	  		error:function() {
	  		    alert('系统异常，请稍后再试!');
	  		    $('#mask').remove(); 
	  		}
  	 	});
  	 	
                
    }
</script>
  
  
  <body>
    <%@ include file="../askpro_top.jsp"%>   

    <div class="Sep8"></div>

	<div class="Container">
	       <div class="QuestionDetailTitle">${questionInfo.questionTitle}</div>
	       <div class="QuestionPayInfo">	
				<div class="PriceArea">报酬：<font class="QuestionPrice">${questionInfo.price}</font>(元)</div>
				<div class="DtRest">剩余时间：<s:date name="#request.questionInfo.dt" format="yy-MM-dd HH:mm"/></div>		         
		   </div>
		     
		   <div class="QuestionHeadArea">		      
		     		       
		           <table cellpadding="0" cellspacing="0" border="0" width="100%">
		              <tr>
		                   <td class="QuestionerInfo">
		                       <div class="HeadImageArea"><img class="HeadImage" src="${questionInfo.cbUser.bbsheadIcon}" /></div>
		                        ${questionInfo.cbUser.userName}    
		                   </td>
		                   <td class="AskProCon" valign="top">
			                    <div class="QuestionInfo">						            
						            <div class="DtPub">发布时间：<s:date name="#request.questionInfo.dt"  format="yy-MM-dd HH:mm"/></div>						            
						        </div>
						        <div>
		                   			${questionInfo.con}
		                   		</div>		                   
		                   </td>
		              </tr>
		           </table>
		       
		    </div> 
		     
		      <div class="AnswerHead">回复列表 </div>
		      <div class="AnswerListLine"></div>	
		        
		      <div>		      
		          <s:iterator id="obj" value="#request.anwserInfo"> 		                   
		             <div class="AnswerList">
		               <table cellpadding="0" cellspacing="0" border="0" width="100%">
		                 <tr>
		                   <td class="QuestionerInfo">
		                       <div class="HeadImageArea"><img class="HeadImage" src="${obj.cbUser.bbsheadIcon}" /></div>
		                        ${obj.cbUser.userName}    		                        
		                   </td>
		                   <td class="AskProCon" valign="top">
		                     <div class="QuestionInfo">
		                        <div class="DtAnswer">回复时间：${obj.dt}</div>	
		                         <div class="GivePay"><script>HideTxt(userID,${obj.cbUser.id})</script>报酬：<input class="InputPay" id="pay" name="input" onblur="DataVal()" /></div>	                       
		                     </div>
		                     <div>${obj.con}</div>
		                   </td>
		                 </tr>
		              </table>
		             </div>
		          </s:iterator>		      	   	 
	         </div>
	         
	         <div><input id="CloseConfirm" class="btnPay" onclick="CloseHandle()"   type="Button"  value="结    算" /></div>
		
	          
	  </div>
	  
	<div id="dialog" style="display: none;z-index: 99999;"  title="用户登陆">
	   		            
		            
		           	<div class="FormSingleRow">
		           	  <div style="width:250px; margin-left:30px;" class="InputOutFrame">
		           	     <span style="float:left;vertical-align:middle"><img style="vertical-align:top" src="<%=path%>/images/ico_user.gif"/></span>
		           	     <span style="float:left;"><input  placeholder="邮箱或手机" onblur="lostFocus('userName')" onkeydown="doKeydown('userName')"  type="text" class="inputRegRow" id="userName"  name="userName"  
			           	     <s:if test = 'userName != ""'>value="${userName}"</s:if> 
			           	     />
		           	     </span>
		           	  </div>
		           	</div> 
			        <div class="FormTipRow">
			             <span style="display:none" id="userNameErr" class="errNote">用户名不能为空！</span>
			        </div> 
			        <div class="FormSingleRow">
                         <div style="width:250px; margin-left:30px;" class="InputOutFrame">
		           	         <span style="float:left;"><img style="vertical-align:top" src="<%=path%>/images/ico_pass.gif"/></span>
		           	         <span style="float:left;margin:auto 0"><input  placeholder="登陆密码"  onblur="lostFocus('pass')"   onkeydown="doKeydown('pass')"  type="password" class="inputRegRow"  type="password" id="pass"  name="pass" />
		           	         </span>
		           	    </div>
                    </div> 
			        <div class="FormTipRow">
			           <span style="display:none"  id="passErr"  class="errNote">密码不能为空！</span>
			        </div> 
			        <div class="FormSingleRow">
			             <div style="width:150px; margin-left:30px; float:left" class="InputOutFrame">
			                <span><input placeholder="验证码" style="width:150px;"  onblur="lostFocus('code')"  onkeydown="doKeydown('code')"    type="text" class="inputRegRow"  id="code"  name="code" value="" /></span>
			             </div>
			              <span style="float:left" class="ValidateCode"><img style="padding-top:2px" src="<%=path%>/user_center/v_code.jsp" /></span>
			        </div>
			        <div class="FormTipRow"><span class="NormalLabel">&nbsp;</span><span style="display:none"  id="codeErr"  class="errNote">验证码不正确</span></div> 
			        <div class="FormSingleRow"><span class="NormalLabel">&nbsp;</span><span><input onclick="check()" type="button" id="btnReg" class="btnReg" value="登录" /></span></div>
		            <div class="FormSingleRow"><span class="NormalLabel">&nbsp;</span><span style="float:left;text-align:left;">还没有十二维账号，马上<a class="BlueLink" href="<%=request.getContextPath()%>/register">注册</a></span></div> 
		  
	</div>
	
	<div class="DlgAnswer" id="dlgAnswer" style="display: none;z-index: 99999;  "  title="用户登陆">
	    
	  	<input type="hidden" name="myDoc" id="myDoc">
		 
		<div id="toolBar2">
		<ul id="TextParagraphList" style="display:none; z-index:9999; position:absolute;background-color:#f3f3f3;list-style-type: none;margin:5px;padding:5px;float:left;">
		  <li onmousedown="changeTextParagraph('h1')">Title 1 &lt;h1&gt;</li>
		  <li onmousedown="changeTextParagraph('h2')">Title 2 &lt;h2&gt;</li>
		  <li onmousedown="changeTextParagraph('h3')">Title 3 &lt;h3&gt;</li>
		  <li onmousedown="changeTextParagraph('h4')">Title 4 &lt;h4&gt;</li>
		  <li onmousedown="changeTextParagraph('h5')">Title 5 &lt;h5&gt;</li>
		  <li onmousedown="changeTextParagraph('h6')">Title 6 &lt;h6&gt;</li> 
		</ul> 
		<ul id="BackColorList" style="display:none; z-index:9999; position:absolute;background-color:#f3f3f3;list-style-type: none;margin:5px;padding:5px;float:left;">
		  <li onmousedown="changeBackColor('Red')">Red</li>
		  <li onmousedown="changeBackColor('Blue')">Blue</li> 
		  <li onmousedown="changeBackColor('Green')">Green</li> 
		  <li onmousedown="changeBackColor('Black')">Black</li> 
		</ul> 
		<ul id="ForeColorList" style="display:none; z-index:9999; position:absolute;background-color:#f3f3f3;list-style-type: none;margin:5px;padding:5px;float:left;">
		  <li onmousedown="changeForeColor('Red')">Red</li>
		  <li onmousedown="changeForeColor('Blue')">Blue</li> 
		  <li onmousedown="changeForeColor('Green')">Green</li> 
		  <li onmousedown="changeForeColor('Black')">Black</li> 
		</ul> 
		<ul id="FontSizeList" style="display:none; z-index:9999; position:absolute;background-color:#f3f3f3;list-style-type: none;margin:5px;padding:5px;float:left;">
		  <li onmousedown="changeSize('8px')">8px</li>
		  <li onmousedown="changeSize('9px')">9px</li> 
		  <li onmousedown="changeSize('10px')">10px</li> 
		  <li onmousedown="changeSize('11px')">11px</li>
		  <li onmousedown="changeSize('12px')">12px</li>
		  <li onmousedown="changeSize('13px')">13px</li>
		  <li onmousedown="changeSize('14px')">14px</li>
		  <li onmousedown="changeSize('16px')">16px</li>
		  <li onmousedown="changeSize('17px')">18px</li>
		  <li onmousedown="changeSize('24px')">24px</li>
		</ul> 
		<ul id="TextFamilyList" style="display:none; z-index:9999; position:absolute;background-color:#f3f3f3;list-style-type: none;margin:5px;padding:5px;float:left;">
		  <li onmousedown="changeTextFamily('Arial')">Arial</li>
		  <li onmousedown="changeTextFamily('Arial Black')">Arial Black</li> 
		  <li onmousedown="changeTextFamily('Courier New')">Courier New</li> 
		  <li onmousedown="changeTextFamily('Times New Roman')">Times New Roman</li> 
		</ul> 
		
		<img class="intLink" title="Clean" onclick="setDocMode();" src="data:image/gif;base64,R0lGODlhFgAWAMQAAAAAAP///0JCQxkVEfDw8OLi4t7e3t3d3czMzL29vaqqqpCQkIyMjISEhHt7e3d3dyEhIf///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABEALAAAAAAWABYAAAWBYCSOZGmeaKqu6uIu7HgkC1HYS3KshwARwCBEUEA5cr/XQlGDJFAKAeMXrDpTD1+hwW0UEIRryle1PlMKyKPbmIXPqMSwQQiYVXKGQOBwzA5icT8OAlUFgSdyCA9ZDgg6iCYJAzcHNwVfA3AnPQCen54CBisGCaanpqMxq6ytrq4hADs=" />
		<img class="intLink" title="Undo" onclick="formatDoc('undo');" src="data:image/gif;base64,R0lGODlhFgAWAOMKADljwliE33mOrpGjuYKl8aezxqPD+7/I19DV3NHa7P///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARR8MlJq7046807TkaYeJJBnES4EeUJvIGapWYAC0CsocQ7SDlWJkAkCA6ToMYWIARGQF3mRQVIEjkkSVLIbSfEwhdRIH4fh/DZMICe3/C4nBQBADs=" />
		<img class="intLink" title="Redo" onclick="formatDoc('redo');" src="data:image/gif;base64,R0lGODlhFgAWAMIHAB1ChDljwl9vj1iE34Kl8aPD+7/I1////yH5BAEKAAcALAAAAAAWABYAAANKeLrc/jDKSesyphi7SiEgsVXZEATDICqBVJjpqWZt9NaEDNbQK1wCQsxlYnxMAImhyDoFAElJasRRvAZVRqqQXUy7Cgx4TC6bswkAOw==" />
		<img class="intLink" title="Bold" onclick="formatDoc('bold');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAInhI+pa+H9mJy0LhdgtrxzDG5WGFVk6aXqyk6Y9kXvKKNuLbb6zgMFADs=" />
		<img class="intLink" title="Italic" onclick="formatDoc('italic');" src="data:image/gif;base64,R0lGODlhFgAWAKEDAAAAAF9vj5WIbf///yH5BAEAAAMALAAAAAAWABYAAAIjnI+py+0Po5x0gXvruEKHrF2BB1YiCWgbMFIYpsbyTNd2UwAAOw==" />
		<img class="intLink" title="Underline" onclick="formatDoc('underline');" src="data:image/gif;base64,R0lGODlhFgAWAKECAAAAAF9vj////////yH5BAEAAAIALAAAAAAWABYAAAIrlI+py+0Po5zUgAsEzvEeL4Ea15EiJJ5PSqJmuwKBEKgxVuXWtun+DwxCCgA7" />
		<img class="intLink" title="Left align" onclick="formatDoc('justifyleft');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JMGELkGYxo+qzl4nKyXAAAOw==" />
		<img class="intLink" title="Center align" onclick="formatDoc('justifycenter');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIfhI+py+0Po5y02ouz3jL4D4JOGI7kaZ5Bqn4sycVbAQA7" />
		<img class="intLink" title="Right align" onclick="formatDoc('justifyright');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JQGDLkGYxouqzl43JyVgAAOw==" />
		<img class="intLink" title="Numbered list" onclick="formatDoc('insertorderedlist');" src="data:image/gif;base64,R0lGODlhFgAWAMIGAAAAADljwliE35GjuaezxtHa7P///////yH5BAEAAAcALAAAAAAWABYAAAM2eLrc/jDKSespwjoRFvggCBUBoTFBeq6QIAysQnRHaEOzyaZ07Lu9lUBnC0UGQU1K52s6n5oEADs=" />
		<img class="intLink" title="Dotted list" onclick="formatDoc('insertunorderedlist');" src="data:image/gif;base64,R0lGODlhFgAWAMIGAAAAAB1ChF9vj1iE33mOrqezxv///////yH5BAEAAAcALAAAAAAWABYAAAMyeLrc/jDKSesppNhGRlBAKIZRERBbqm6YtnbfMY7lud64UwiuKnigGQliQuWOyKQykgAAOw==" />
		<img class="intLink" title="Hyperlink" onclick="var sLnk=prompt('Write the URL here','http:\/\/');if(sLnk&&sLnk!=''&&sLnk!='http://'){formatDoc('createlink',sLnk)}" src="data:image/gif;base64,R0lGODlhFgAWAOMKAB1ChDRLY19vj3mOrpGjuaezxrCztb/I19Ha7Pv8/f///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARY8MlJq7046827/2BYIQVhHg9pEgVGIklyDEUBy/RlE4FQF4dCj2AQXAiJQDCWQCAEBwIioEMQBgSAFhDAGghGi9XgHAhMNoSZgJkJei33UESv2+/4vD4TAQA7" />
		<img class="intLink" title="Image" onclick="var sImg=prompt('Write the Image URL here','http:\/\/');if(sImg&&sImg!=''&&sImg!='http://'){insertURLImage(sImg)}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABuUlEQVR42mL8//8/Ay0AQAAxMdAIAAQQzQwGCCCaGQwQQDQzGCCAWJA5p44epSgmzaytGWFsgABCMfjzjx8MDk5OZBl6YN8+FD5AALGgK/j3j4HhSoYQw8OvTAzy3P/AYoTYOjPeYVgEEEA4wximmVg2OgAIIBSDv//4yfDrDwPD6Xc8ODVwygvDMQz8//cXrBcZAAQQSlB8//ufgYXhF0P/NZDBPAzJepwMPrqfUDSIaiozcMmJMnx79JrhNcyQPz/BepEBQAChBsWvHwy///xhePDgIYMnxyuGuZe+Myw+wsJw6DxQ48O3YCUgQ5FpEPj2D6IXGQAEEIqLf/yASGZqcDLs//SOwZMP6IuXDAw3gGI37jExcD5mYUgWf8ogaSDN8PzCU4Yb196D1csg6YUBgADCSBWfv/xgsNNkYLBjEMISoS8ZPp4C4QsoHv6JZigIAAQQisFfvn5hYAOKHLqOO65BloLAJc5vDB+uc4HZtlC9yAAggDBczM7BwVC95xbBDOH5/w/DF0YWuB50ABBAGAYvXrKEKmUFQAAx0qqgBwggmpVuAAFEM4MBAohmBgMEEM0MBggwAOdpj38t9iZLAAAAAElFTkSuQmCC" />
		<img class="intLink" title="Image2" onclick="insertImg()" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABuUlEQVR42mL8//8/Ay0AQAAxMdAIAAQQzQwGCCCaGQwQQDQzGCCAWJA5p44epSgmzaytGWFsgABCMfjzjx8MDk5OZBl6YN8+FD5AALGgK/j3j4HhSoYQw8OvTAzy3P/AYoTYOjPeYVgEEEA4wximmVg2OgAIIBSDv//4yfDrDwPD6Xc8ODVwygvDMQz8//cXrBcZAAQQSlB8//ufgYXhF0P/NZDBPAzJepwMPrqfUDSIaiozcMmJMnx79JrhNcyQPz/BepEBQAChBsWvHwy///xhePDgIYMnxyuGuZe+Myw+wsJw6DxQ48O3YCUgQ5FpEPj2D6IXGQAEEIqLf/yASGZqcDLs//SOwZMP6IuXDAw3gGI37jExcD5mYUgWf8ogaSDN8PzCU4Yb196D1csg6YUBgADCSBWfv/xgsNNkYLBjEMISoS8ZPp4C4QsoHv6JZigIAAQQisFfvn5hYAOKHLqOO65BloLAJc5vDB+uc4HZtlC9yAAggDBczM7BwVC95xbBDOH5/w/DF0YWuB50ABBAGAYvXrKEKmUFQAAx0qqgBwggmpVuAAFEM4MBAohmBgMEEM0MBggwAOdpj38t9iZLAAAAAElFTkSuQmCC" />
		<img class="intLink" id="FontSize" title="font-size" onclick="showObj('FontSize')" src="data:image/png;base64,R0lGODlhFgAWALMAAAAAAP///0JCQxkVEd7e3szMzL29va2trXt7e3NzczMzM////wAAAAAAAAAAAAAAACH5BAEAAAsALAAAAAAWABYAAARFcMlJq7046827/yA1AGQJeEaqKGkRCkI4wRoBwwlFZwQiAIiDLjZBGBEUxKmykxwrSkvTaYkyiRrrkENwVQoEmXhMLosjADs=" />
		<img class="intLink" id="BackColor" title="Text Background Color" onclick="showObj('BackColor')" src="data:image/png;base64,R0lGODlhFgAWAMQAAAAAAP////zzAOzkANzVAM3FAL22AJ2YAI2IAH56AG9rAE9MAD89AC8uAPrxAvvyCl9bACAeABAPAP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABMALAAAAAAWABYAAAVs4CSOZGmSQqqurFC2MDvGtCrW9R0jEK3Dkkgh9mMdGIkerLhqHAiAwXICK0hSC8T00YIwDAZFZMsaSABotIHlYAoQjZVi0XJHtKoCgCCjrgxRLA0JfSwEQ4aINn44U41Ebo0ojysmlCeYmSIhADs=" />
		<img class="intLink" id="ForeColor" title="Text Color" onclick="showObj('ForeColor')" src="data:image/png;base64,R0lGODlhFgAWAMQAAAAAAP////Dx/eTq/LTG9IKl8d7n/FOF6Y+w9aS/9GqV53Og75S6/C916sTX9s/d9Xt7e////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABEALAAAAAAWABYAAAVSYCSOZGmeaKqubOu+sPg0RCwuzWEPdPPECEXkUIjRIomG4EVoIBiFRmIEqVZPioZWq6NeTYaGYeRoOEgQVKE7aixYAmkJ0RisBL8S3sbv+/99IQA7" />
		<img class="intLink" id="TextParagraph" title="Text Paragraph" onclick="showObj('TextParagraph')" src="data:image/png;base64,R0lGODlhFgAWAMQAAAAAAP///0JCQxkVEfDw8OLi4t7e3t3d3czMzL29vaqqqpCQkIyMjISEhHt7e3d3dyEhIf///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABEALAAAAAAWABYAAAVcYCSOZGmeaKqubOu+8OCQDEAeDwrMo2OLhUXutCP5RI2HUscTHSOHg2JoAkAEWAHkJ0pQSwCBY+wQcCNepvGcJjYjz+6XVOyx56O6845KlAwIJAQFMIWGh4iJIyEAOw==" />
		<img class="intLink" id="TextFamily" title="Text Family" onclick="showObj('TextFamily')" src="data:image/png;base64,R0lGODlhFgAWAMQAAAAAAP///1FRUkJCQxkVEd7e3szMzL29va2traSkpIyMjHt7e3Nzc1tbWzMzMyEhIf///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABAALAAAAAAWABYAAAVQICSOZGmeaKqubOu+5MEWjDAAxKAnayKMAMaLsBApAAYXIigaEF6HB0IEeCwW0xcDoDjIRNdwSvA0iVOEBqqYSjhgEK8PLgA4svC8fs/vn0IAOw==" />
		</div>
		<div id="textBox" contenteditable="true"><p>Lorem ipsum</p></div>
		
		<div><input id="JoinConfirm" style="margin-left:150px" class="btnReg" onclick="AnswerHandle()"   type="Button"  value="确定" /></div>
		 
	   
	</div>

	<div class="Sep8"></div>
	
	<%@ include file="../bottom.html"%>
	
	 
	
  </body>
</html>
