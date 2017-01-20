<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>关于我们</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible"content="IE=edge"/>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css?43543435">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/aboutus.css">

  </head>
  
  <body>
    <%@ include file="../top.jsp"%>
     <!-- 导航区域开始 -->
	<div class="Container">      
	    <div class="NavArea">
	    你的位置： <a href="/">首页</a> 》  {{{{pageName}}}}
	    </div> 
	</div>
	<!-- 导航区域结束 -->

    <div class="Sep8"></div>

	<div class="Container">
	  <span class="AboutUsList">
		 
		    <div class="CateTitle" style="text-align:center;padding-left:0px;">         
	        	 关于我们
	   	    </div>
	   	    
	   	     <div class="CateList">
	   	        <ul>
	   	          <%@ include file="../page/aboutus_item.html"%>
	   	        </ul>
	   	     </div>  
		 
	  </span>
	  <span class="AboutUsContent">	     
	     <p>
	      {{{{content}}}}
         </p>
	  </span>
	</div>

	<div class="Sep8"></div>
	
	<%@ include file="../bottom.html"%>
	
  </body>
</html>
