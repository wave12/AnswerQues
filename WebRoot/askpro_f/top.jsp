<div style="clear:both;">
	<div class="Container">
	   <span class="Log"><img src="<%=request.getContextPath()%>/images/logo.png" /></span>
	   <span class="LogS"><img src="<%=path%>/images/logo_askpro.png?343" /></span>
	   <div class="RegLogin">
	       <s:if test="#session.admin != null">
	          <table cellpadding="0" cellspacing="0" border="0" height="100%" style="float:left;">
	             <tr>
	                <td class="UserHead"><img style="vertical-align: middle;" src="<%=path%>/images/user_head.png" /></td>
	                <td class="UserHeadNick"><s:property value="#session.admin.substring(#session.admin.indexOf('|')+1)"/></td>
	             </tr>
	         </table>	          
	       </s:if>
	       <s:if test="#session.admin == null">
	           <div><a href="<%=request.getContextPath()%>/register">注册</a></span>&nbsp;&nbsp;<span><a href="<%=request.getContextPath()%>/login">登陆</a></div>
	   	   </s:if>
	   </div>    
	</div>
</div>

<div class="CateRow">
    <div class="Container">           
            <form id="frmSearch" action="askpro" method="post">
            <span class="FrameSearch">		           	 
		        <span style="float:left;">		        
		            <input placeholder="搜索问题" type="text" class="inputRegRow2" id="titleKey"  name="titleKey" value="${titleKey}" />
		        </span> 
		    </span> 
		    <span onclick="window.frmSearch.submit();" class="IconSearch"><img style="vertical-align:top" src="<%=path%>/images/ico_search.png"/></span>
		    </form>
		             
            <span onclick="AskQuestion()" class="BtnAskPro">提&nbsp;问</span>
          
            <span class="Help"><img src="<%=path%>/images/askpro_help.png" /></span>   
            <input id="nextUI" style="display:none" value='' />
            <input id="userID" style="display:none" value='<s:property value="#session.admin.substring(0, #session.admin.indexOf('|'))"/>' />       
    </div>
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

<div class="DlgPopup" id="dlgQuestion" style="display: none;z-index: 99999; text-align:left;  "  title="提问">

       <div class="NormalFormRow">
          <div class="NormalConRowLabel">问题标题(<span class="mustItem">*</span>)：</div>
          <div style="float:left"><input style="width:400px" class="NormalFormInput" id="QuestionSubject" /></div>
       </div>
       <div class="NormalFormRow">
          <div class="NormalConRowLabel">报&emsp;&emsp;酬(<span class="mustItem">*</span>)：</div>
          <div style="float:left"><input style="width:50px" class="NormalFormInput" id="price" />元 (限整数，至少1元)</div>
       </div>
       <div class="NormalFormRow">
          <div class="NormalConRowLabel">大&emsp;&emsp;类(<span class="mustItem">*</span>)：</div>
          <div style="float:left">IT技术</div>
       </div>
        <div class="NormalFormRow">
          <div class="NormalConRowLabel">小&emsp;&emsp;类(<span class="mustItem">*</span>)：</div>
          <div style="float:left">JAVA开发</div>
       </div>
	   <div class="NormalConRow">
	      <div class="NormalConRowLabel">问题描述：</div>
	      <div class="NormalConInputArea"> 	    
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
		
		</div>
	   </div>
	   
	   <div class="NormalFormRow">
		<div class="NormalConRowLabel">&nbsp;</div>
		<div style="float:left"><input id="JoinConfirm" class=btnSubmit onclick="QuestionHandle()"   type="Button"  value="确定" /></div>
	   </div>
	    
</div>

  <script type="text/javascript">
     var g_cartID = "";
    function AskQuestion() {
		var uid = $('#userID').val();
		if (uid == '') {
		    $('#nextUI').val('dlgQuestion');
			RegisterDialog();
		}
		else
			ShowAskQuestion();
	}
	
	function ShowAskQuestion() { 
    	$('#dlgQuestion').dialog({
			resizable: false,
			height: 440,
			width: 700,
			modal: true,
			close: function(event, ui) {
				$('#mask').remove();
			}
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
			modal: true,
			close: function(event, ui) {
				$('#mask').remove();
			}
		});
		$(".ui-dialog").css('z-index', '99999');
		/*$(".ui-dialog-titlebar").css('display', 'none');*/
		
		$('body').append('<div id="mask"></div>');  
        $('#mask').fadeIn(300); 
        
    }
    
    
     function QuestionHandle() {
        // 处理回复
        var uid = $('#userID').val();
        var queTitle = $('#QuestionSubject').val();
        var price = $('#price').val();
        oCon = document.getElementById("textBox");
     
    	var con = oCon.innerHTML;
        //var con = $('#textBox').val();
        alert(con);
        $.ajax({
	  		type:"post",
	  		url:"MakeOneQestionJsonAction",
	  		data:{ 
	  		        userID:uid,
	  			    queTitle:queTitle,
	  			    price:price,
	  			    con:con
	  		},
	  		dataType:"json",
	  		success:function(data){	  			  			 
	  			if (data == "1") { 
	  			    alert('提问成功！');  
	  			    $('#mask').remove();
	  			    $('#dlgAnswer').dialog('close');
	  			    window.location.reload();	  			    				  
	  			}
	  			else {    	  			      
	  				alert('提问失败,请稍后再试!');
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