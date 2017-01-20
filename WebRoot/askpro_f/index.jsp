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
    
    <title>十二维问专家</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="ask question from professor">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible"content="IE=edge"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css?435435333">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/askpro.css?20170119_1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/wave12Editor.css?33356">

	<script language=javascript src="<%=path%>/js/wave12Editor.js"></script>    
    <script src="<%=path%>/js/jquery-1.9.1.js"></script>
    <script src="<%=path%>/js/jquery-ui.min.js"></script>  
    <script src="<%=path%>/js/placeholderfriend.js"></script>
    <script src="<%=path%>/js/login.js?3423"></script> 
    <script src="<%=path%>/js/wave12_fun.js?3423"></script> 
    
      <style type="text/css">
	.intLink { cursor: pointer; }
	img.intLink { border: 0; }
	#toolBar2 select { font-size:10px; }
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
	
	<script type="text/javascript">
     function startRestTime(id, seconds) {      
     	timeBackCount(id, seconds);
     }
     </script>
    
  </head>
  
  <body>
     <%@ include file="../askpro_top.jsp"%>
    <div class="Sep8"></div>
	<div class="Container">

      <div>
	 
		  <s:iterator id="obj" value="#request.askProList">
			    
			     <div class="QuestionListTitle"><a href="askpro_detail?id=${obj.id}">${obj.questionTitle}</a></div>
			     <div class="QuestionExInfo">		
			        <div style="float:left"><img class="HeadImage2" src="${obj.cbUser.bbsheadIcon}" /></div>             
					<div style="float:left" class="Questioner"> ${obj.cbUser.userName}</div>
					<div class="PriceArea">报酬：<font class="QuestionPrice">${obj.price}</font>(元)</div>
					<div class="DtRest">剩余时间：<span class="DtRestValue" id="t_${obj.id}"></span><script type="text/javascript">startRestTime('t_${obj.id}', ${obj.keepMinutes} * 60);</script></div>			         
			     </div>
		   
			      <div class="QuestionNoteArea">
			           <table cellpading="0" cellspacing="0" border="0" width="100%">
			              <tr> 
			                   <td class="AskProCon" valign="top">${obj.con}</td>
			              </tr>
			           </table>
			      </div> 		   
			    
		  </s:iterator>
	 
	   </div>
	</div> 
	
	
	<div class="Sep8"></div>
	
     <%@ include file="../bottom.html"%>
     
     
     
  </body>
</html>
