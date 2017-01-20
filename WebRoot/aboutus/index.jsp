<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.crab.dao.*, com.crab.entity.CbPageInfo" %>

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
	    你的位置： <a href="/">首页</a> 》  ${pageInfo.pageName} 
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
	   	         <li>关于我们</li>
	   	         <li>联系方式</li>
	   	         <li>招商合作</li>
	   	        </ul>
	   	     </div>  
		 
	  </span>
	  <span class="AboutUsContent">
	     
	       <p>
	       <jsp:include page="../page/${pageInfo.htmlName}.html"/>     深圳市十二维信息技术有限公司，成立于2005年9月,总部位于中国深圳。公司按照现代企业制度的规范运作，致力于计算机软件、网络时尚文化、技术咨询等研发和推广。主要业务范围如下：
      •教育、技术培训
      •应用软件、中间件开发
      •时尚文化传播 
      •多媒体应用
      •电子商务 
      </p>
   <p>
      本公司拥有一致专业的软件开发技术团队，技术力量雄厚，在组件技术、图像处理，多媒体技术应用方面有深厚的经验积累，为国内和国际客户提供各种专业的软件技术产品。 凭借公司强大的技术力量，面向社会各类爱好技术的人员提供技术培训服务，包括远程培训。我们推出的远程教育平台，功能强大，资料丰富，深受用户喜爱！互联网让地球变成一个村庄，足不出户，享受专业技术指导，是我们远程教育平台的宗旨！ 

  </p>

 <p>
      为适应不同类型、不同发展阶段企业的上网要求，十二维网提供包括域名注册、主机、企业邮局、网站制作、系统集成在内的完整的网络平台产品线。域名实时在线注册、虚拟主机、企业邮局自动开设、自助建站系统等国际领先的自主或专有技术，使企业可以在低成本、高效率、强保障的前提下建立自己的上网平台，从而大大降低了企业信息化的门槛。 

 </p>

<p>
      网络正在改变我们的生活，十二维网为了拓展业务，丰富网络的生活，推出时尚精品，为大家提供最前沿的潮流时尚产品。相信，在用户的支持下，我们前面的路会越走越宽广。服务是我们的立足之本，我们一直在努力地使我们的创意，更有效地配合客户的品牌及市场营销战略。我们深知：创意是为品牌和市场而存在的！只要你需要，我们就能办到！ 

 </p>

<p>
      我们的核心竞争力：

      •规范的管理 

      •专业的队伍 

      •完善服务的核心理念
      </p>
      
	  </span>
	</div>

	<div class="Sep8"></div>
	
	<%@ include file="../bottom.html"%>
	
  </body>
</html>
