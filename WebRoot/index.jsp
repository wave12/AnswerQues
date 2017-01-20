<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>tretewt</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible"content="IE=edge"/>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css?435435">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css?20170112_2">
    
    <script src="./js/py.js?33423333"></script>
  </head>
  
  <body> 
    <%@ include file="top.jsp"%>
    <div class="Sep8"></div>
   
    <!-- 核心课程区域开始-->
	<div class="Container">
		<div class="CoreClass" onMouseOut="ContinuePlay()">
	    	<span class="CoreClassPic">
	            <img style="display:block" id="C1" height="200" src="./images/index/banner1.jpg" />
	            <img style="display:none" id="C2" src="./images/index/banner2.jpg" />
	            <img style="display:none" id="C3" src="./images/index/banner3.jpg" />
	            <img style="display:none" id="C4" src="./images/index/banner4.jpg" />
	            <img style="display:none" id="C5" src="./images/index/banner5.jpg" />
	        </span>
	        <span class="CoreClassList">
	            <div class="CoreClassTitle">核心课程</div>
	            <div><hr class="CoreClassHr" /></div>
	            <div id="L1" class="CurCoreClass" onMouseMove="PauseThis(1)"><span class="SortNo">01</span><span class="BannerName"><a class="ClassLink" href="class805b87d2cc728234213915ef67b0b33c7d49.html">C++国际工程师全套培训</a></span><span><a title="详情" class="Detail" href="class805b87d2cc728234213915ef67b0b33c7d49.html">详情</a></span></div>
	            <div id="L2" class="NoCurCoreClass" onMouseMove="PauseThis(2)"><span class="SortNo">02</span><span class="BannerName"><a class="ClassLink" href="classd90e56e86149d79d27c63ef059f2fd73.html">.Net国际工程师全套培训</a></span><span><a title="详情" class="Detail" href="classd90e56e86149d79d27c63ef059f2fd73.html">详情</a></span></div>
	            <div id="L3" class="NoCurCoreClass" onMouseMove="PauseThis(3)"><span class="SortNo">03</span><span class="BannerName"><a class="ClassLink" href="class880c799a59d34e683b38904262e6b57e.html">Java国际工程师全套培训</a></span><span><a title="详情" class="Detail" href="class880c799a59d34e683b38904262e6b57e.html">详情</a></span></div>
	            <div id="L4" class="NoCurCoreClass" onMouseMove="PauseThis(4)"><span class="SortNo">04</span><span class="BannerName"><a class="ClassLink" href="classf69a4a5083be8b376d8dfdda88debfbf.html">PHP国际工程师全套培训</a></span><span><a title="详情" class="Detail" href="classf69a4a5083be8b376d8dfdda88debfbf.html">详情</a></span></div>
	            <div id="L5" class="NoCurCoreClass" onMouseMove="PauseThis(5)"><span class="SortNo">05</span><span class="BannerName"><a class="ClassLink" href="classa3b68218b51172560a8dcba67dec8226.html">嵌入式软件工程师全套培训</a></span><span><a title="详情" class="Detail" href="classa3b68218b51172560a8dcba67dec8226.html">详情</a></span></div>
	        </span>
	    </div>
	</div>
	<!-- 核心课程区域结束 -->
	
	<div class="Sep8"></div>
	
	<!-- 新闻区域开 -->
    <div class="Container">
	  <div class="News_Area">
    	<div class="NewsListArea">
            <div class="CateTitle">热点新闻</div>
            <div class="NewsDoc">
                    
                       <div class="NewsHead"><a href='news6CB2327FBA6F29301519B9E7DBB14B01.html'>WDC超链接图：涵盖35亿网页和280亿超链接</a></div>
                       <div class="NewsOutline">
                           <div class="NewsPic"><img width="100" src="<%=path%>/images/news/5296c28a57d34.jpg" /></div>
                           <div class="NewsNote">
                                曼海姆大学研究人员公开了据称是目前最大规模的网络超链接图，涵盖35亿个网页，280亿个超链接。
                           </div>
                       </div>  
                    
                       <div class="Sep2"></div>
                       <div class="XuLine"></div>
                       <div class="NewsHead"><a href='news1ddc41245b16e98eb74a0e25eb269b2b.html'>Python正在取代R成为数据科学的编程语言</a></div>
                       <div class="NewsOutline">
                           <div class="NewsPic"><img width="100" src="<%=path%>/images/news/2013_12_5_snake.jpg" /></div>
                           <div class="NewsNote">
                                R是数据科学领域传统的编程语言，但这个地位正在迅速被Phython代替。出现这种情况的原因很多，最重要的一点就是Phython容易学习，而要掌握R，需要掌握一套复杂的编程环境.
                           </div>
                       </div>  
                         
                         <div class="Sep2"></div>
                        <div class="XuLine"></div>
                       <div class="NewsHead"><a href='news5ed9fa11e5a52c6f21958f44b2f87757.html'>微软要让Windows Phone成为中国手游一线战场</a></div>
                       <div class="NewsOutline">
                           <div class="NewsPic"><img width="100" src="<%=path%>/images/news/CoreNews3.png" /></div>
                           <div class="NewsNote">
                                坐在旧金山Westin酒店的会议室中，面对微软大中华区副总裁兼市场战略部总经理谢恩伟与其他國內手游厂商与合作伙伴，手游公司完美世界副总裁张云帆(微博)提出了一个大家心中的疑问：“微软的Windows会妥协，会坚持Windows Phone的系统吗？”
                           </div>
                       </div>  
                                      
                   
            </div>          
        </div>
        <div class="OurNews_List">
            <div class="CateTitle">新闻动态</div>  
            <div class="NewsItemList">
              <ul>                             
        	   <%@ include file="page/lastnews.html"%>
        	  </ul>         	 
        	</div>   
        </div>
      </div>
	</div>
	<!-- 新闻区域结束 -->

    <div class="Sep8"></div>
	
	<!-- 文档区域开始-->
	<div class="Container">
		<div class="DOC_Area">
	    	<div class="DocListArea">
	            <div class="CateTitle">文档中心</div>
	            <div class="NewDoc">
	            	<div class="S_Title">最新文档</div>          
	                <div class="DocItemList">
	                   <ul> 
	                 <%@ include file="page/lastdocs.html"%>
	                   </ul>	              
	                </div>       
	            </div>
	            <div class="HotDoc">
	                <div class="S_Title">最热文档</div>          
	                <div class="DocItemList">
	                   <ul>
	                     <%@ include file="page/hotdocs.html"%>
	                   </ul>	              
	                </div>
	                <!--  
	                 <li><span class='SortNo'>01</span><span class="OneDocTitle"><a href="docdetail?id=61cd8fd5ac1fee3c1e32efd81f4a20f1&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用pugixml解析库操作xml</a></span><span  class='ItemDt'>06.15</span></li>
	                <li><span class='SortNo'>02</span><span class="OneDocTitle"><a href="docdetail?id=064975a157240cd5dc099362ead25753&ClassID=805b87d2cc728234213915ef67b0b33c7d49">双机热备与虚拟IP的实现</a></span><span  class='ItemDt'>05.31</span></li>
	                <li><span class='SortNo'>03</span><span class="OneDocTitle"><a href="docdetail?id=207eccd1f05da2f296191aa6fb67bbe7&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用libPng库绘制PNG图片</a></span><span  class='ItemDt'>03.27</span></li>
	                 <li><span class='SortNo'>01</span><span class="OneDocTitle"><a href="docdetail?id=61cd8fd5ac1fee3c1e32efd81f4a20f1&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用pugixml解析库操作xml</a></span><span  class='ItemDt'>06.15</span></li>
	                <li><span class='SortNo'>02</span><span class="OneDocTitle"><a href="docdetail?id=064975a157240cd5dc099362ead25753&ClassID=805b87d2cc728234213915ef67b0b33c7d49">双机热备与虚拟IP的实现</a></span><span  class='ItemDt'>05.31</span></li>
	                <li><span class='SortNo'>03</span><span class="OneDocTitle"><a href="docdetail?id=207eccd1f05da2f296191aa6fb67bbe7&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用libPng库绘制PNG图片</a></span><span  class='ItemDt'>03.27</span></li>
	                 <li><span class='SortNo'>01</span><span class="OneDocTitle"><a href="docdetail?id=61cd8fd5ac1fee3c1e32efd81f4a20f1&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用pugixml解析库操作xml</a></span><span  class='ItemDt'>06.15</span></li>
	                <li><span class='SortNo'>02</span><span class="OneDocTitle"><a href="docdetail?id=064975a157240cd5dc099362ead25753&ClassID=805b87d2cc728234213915ef67b0b33c7d49">双机热备与虚拟IP的实现</a></span><span  class='ItemDt'>05.31</span></li>
	                <li><span class='SortNo'>03</span><span class="OneDocTitle"><a href="docdetail?id=207eccd1f05da2f296191aa6fb67bbe7&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用libPng库绘制PNG图片</a></span><span  class='ItemDt'>03.27</span></li>
	                 <li><span class='SortNo'>01</span><span class="OneDocTitle"><a href="docdetail?id=61cd8fd5ac1fee3c1e32efd81f4a20f1&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用pugixml解析库操作xml</a></span><span  class='ItemDt'>06.15</span></li>
	                <li><span class='SortNo'>02</span><span class="OneDocTitle"><a href="docdetail?id=064975a157240cd5dc099362ead25753&ClassID=805b87d2cc728234213915ef67b0b33c7d49">双机热备与虚拟IP的实现</a></span><span  class='ItemDt'>05.31</span></li>
	                <li><span class='SortNo'>03</span><span class="OneDocTitle"><a href="docdetail?id=207eccd1f05da2f296191aa6fb67bbe7&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用libPng库绘制PNG图片</a></span><span  class='ItemDt'>03.27</span></li>
	                <li><span class='SortNo'>02</span><span class="OneDocTitle"><a href="docdetail?id=064975a157240cd5dc099362ead25753&ClassID=805b87d2cc728234213915ef67b0b33c7d49">双机热备与虚拟IP的实现</a></span><span  class='ItemDt'>05.31</span></li>
	                <li><span class='SortNo'>03</span><span class="OneDocTitle"><a href="docdetail?id=207eccd1f05da2f296191aa6fb67bbe7&ClassID=805b87d2cc728234213915ef67b0b33c7d49">利用libPng库绘制PNG图片</a></span><span  class='ItemDt'>03.27</span></li>
	                --> 
	            </div>
	        </div>
	        <div class="BBS_List">
	            <div class="CateTitle">问与答</div>
	                      
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>01</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=22&SID=2>大神请进来指教指教。.net C# .txt的读取</a></div><div  class='ItemDt'>05.02</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>02</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=21&SID=7>怎么用Qt开发一个桌面系统？</a></div><div  class='ItemDt'>05.02</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>03</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=20&SID=6>测试B/S、C/S问题，测试面试问题！求教</a></div><div  class='ItemDt'>05.02</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>04</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=19&SID=3>学习java用什么开发工具</a></div><div  class='ItemDt'>04.30</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>05</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=18&SID=8>培训机构出来的 java工程师就业问题</a></div><div  class='ItemDt'>04.30</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>06</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=17&SID=5>PHP表单提交时，反斜杠被过滤掉了</a></div><div  class='ItemDt'>04.27</div></div>       
	               
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>01</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=12&SID=4>数据库字段长度的处理习惯</a></div><div  class='ItemDt'>03.18</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>02</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=17&SID=5>PHP表单提交时，反斜杠被过滤掉了</a></div><div  class='ItemDt'>04.27</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>03</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=22&SID=2>大神请进来指教指教。.net C# .txt的读取</a></div><div  class='ItemDt'>05.02</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>04</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=20&SID=6>测试B/S、C/S问题，测试面试问题！求教</a></div><div  class='ItemDt'>05.02</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>05</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=16&SID=1>图像复原</a></div><div  class='ItemDt'>04.27</div></div>
	        	 <div class='NormalItemList'><div style='float:left'><span class='SortNo'>06</span></div><div class='OneTitle'><a class='OneNewsTitle' href=/bbs/topic/?ID=2&SID=1>推荐基本学习C++的书籍</a></div><div  class='ItemDt'>03.15</div></div>        </div>
	    </div>
	</div>
	<!-- 文档区域结束 -->

	<div class="Sep8"></div>
    
    <!-- 友情连接区域开始-->
	<div class="Container">
		<div class="Link_Area">    
	        <div class="CateTitle">友情链接</div>
	        <div class="LinkList">             
	             <%@ include file="link.html"%>
	        </div>     
	    </div>
	</div>
	<!-- 友情连接区域结束 -->
	
	<div class="Sep8"></div>
	
    <%@ include file="bottom.html"%>
     
  </body>
</html>
