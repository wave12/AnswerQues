<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.crab.dao.*, com.crab.entity.CbDoc" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的问题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible"content="IE=edge"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css?111">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/askpro.css?111_2">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/back.css?222">

	<script src="<%=path%>/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.blockUI.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/wsLoadingBlock.js"></script>
  </head>
  
   <script type="text/javascript">
  function changePage() {
  	  parent.startBlock();
  }
   
  function ChangeCate(cateID, obj, pageNo) {
    var oldCate = $('#curActiveCate').val();
    var newCate = 'c' + cateID;
    if(oldCate == newCate)
    {        
        return;
    }    
       
    if (oldCate == "c1")
    	$('#' + oldCate).attr("class", "FirstBtnActiveNo");
    else if (oldCate == "c2")
    	$('#' + oldCate).attr("class", "LastBtnActiveNo");    
    	
    $('#curActiveCate').attr("value",'c' + cateID);
   
    if (newCate == "c1") {
    	$('#' + obj).attr("class", "FirstBtnActive");
    	 window.location.href = "<%=path%>/askpro/myquestion";
        return;
    }
    else if (newCate == "c2") {
        $('#' + obj).attr("class", "LastBtnActive");       
    }   
    	
    	
  	$.ajax({
  		type:"post",
  		url:"getMyDocJsonAction",
  		data:{ 
  		        pageNo:pageNo,
  			    cateID:cateID
  		},
  		dataType:"json",
  		success:function(data){
  			//alert(data);
  			$('#Content').html(data);
  		},
  		error:function() {
  		    alert('系统异常，请稍后再试!');
  		}
  	});
 }
  </script>
  
  <script type="text/javascript">  
  $(document).ready(function () {
     //alert('111');
     //setLoadingBlock('正在加载数据7777...');
  	  
  });     
  $(window).load(function(){ 
     //alert('000');
     //closeLoadingBlock('', "页面即将跳转<span style='color:red'> %d </span>秒", 5000);
     
      //var arrBlockInfo = new Array();
      //arrBlockInfo[0] = new Array("loading.gif", "正在加载数据", 1000); 
      //setArrayLoadingBlock(arrBlockInfo, '', true);
      parent.closeBlock();
      //parent.$('#ppp', parent.doucment).trigger('closeBlock');
  }); 
  
  </script>
  
  <body style="width:100%; padding:0px; margin:0px">
    <div class="MainHeadRow">
       <div class="HeadTitle">我的文档</div>
       <div class="HeadToolBtnArea">
       		<input id="curActiveCate" style="display:none" value="2" />
       		<div onclick="ChangeCate(1, 'c1', 1)" id="c1" class="FirstBtnActiveNo">我的问题</div>
       		<div onclick="ChangeCate(2, 'c2', 1)" id="c2"  class="LastBtnActive">参与的问题</div> 
       </div>
    </div>
    <div class="HeadRowLine"></div>
     
    
     <div class="MainCon">
  
       <table cellspacing="0" cellpadding="0" border="0" width="100%" class="TblRecord">
         <tr class="HeadRowRecord"> 
            <td class="QecordTitleCol">问题标题</td>	
            <td class="DocStatus">状态</td>	
            <td class="DocDtCol">发布时间</td>			     
		    <td class="RecordActionCol">操作</td>
		 </tr>
	     <s:iterator id="obj" value="#request.questionList"  status="L">			   
				  <s:if test="#L.index%2==0">
				    <tr class="DataRow">
				  </s:if>
				  <s:if test="#L.index%2!=0">
				    <tr class="DataRowSep">
				  </s:if>
				  <td  class="RecordTitle">${obj.questionTitle}</td>		
				  <td>
				   <s:if test="#obj.isOver==0">
				   	 <span class="WaitCheck">未结算</span>
				   </s:if>
				   <s:if test="#obj.isOver==1">
				   	 <span class="CheckPass">已结算</span>
				   </s:if>				  
				  </td>	
				  <td  class="DocDt"><s:date name="#obj.dt" format="yy-MM-dd HH:mm"/></td>		     
				     <td class="RecordActionCol"><a target="_blank" href="<%=path%>/askpro/detail?id=${obj.id}"><img class='BtnEdit' src='<%=path%>/images/eye.gif'/></a> 
				     </td>
				  </tr>
		  </s:iterator>
	  </table>	 
     </div>
	 <div class="pageInfoArea">
         <s:if test="pager.curPage > 1">
              <span onclick="changePage()"><a href="myquestion?pager.curPage=1">首页</a></span>
              <span onclick="changePage()"><a href="myquestion?pager.curPage=${pager.curPage-1}">上一页</a></span>		    
	     </s:if>
	     <s:if test="pager.curPage < pager.pageCount">
	        <span onclick="changePage()"><a href="myquestion?pager.curPage=${pager.curPage+1}">下一页</a></span>
	        <span onclick="changePage()"><a href="myquestion?pager.curPage=${pager.pageCount}">尾页</a></span>	    
	     </s:if>	     
	 </div>

     <s:if test = '#request.js != ""'>
	       <div>${js}</div>
	 </s:if>
	 
  </body>
</html>
