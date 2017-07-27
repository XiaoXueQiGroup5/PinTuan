<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("adminPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的发布</title>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/signinDialog.css">
<link rel="stylesheet" type="text/css" href="css/signinState.css">
<link rel="stylesheet" type="text/css" href="css/navigationBar.css">
</head>

<body>

	<!--标题栏-->
	<div class="topleft">
		<img src="images/pintuan.png" width="125" height="50"/>
	</div>
	<div class="topright">
		<a href="index.jsp">首页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${user.id==null }">
		<a href="reg.html">注册</a>
		</c:if>
		<c:if test="${user.id!=null }">
		<a href="logout.jsp">退出</a>
		</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:showDivFun()"><font size=2 color=slategrey>联系我们</font></a>
	</div>
	<div class="line"></div>
	<!--联系我们-->
	<div id="connectDialog" class="connectDialog">
		<div class="closeConnectDialog1" align="right" onclick="closeDivFun()">
			<span class="closeConnectDialog2">×</span>
		</div>
		<p style="text-align: center;">联系我们</p>
		<p style="text-indent:2em;">若您有任何问题或建议，可以用以下方式联系我们：</p>
		<p style="text-indent:2em;">电话：17780731453</p>
		<p style="text-indent:2em;">邮箱：1272660474@qq.com</p>
		<p style="text-align:right;">拼团 in SCU&nbsp;&nbsp;</p>
	</div>
	<script src="js/connectWithUs.js"></script>



	<c:if test="${user.id!=null }">
	   	<!--用户信息-->
		<div class="signinState">
			<p style="font-size: 24px;text-align: center;">${user.name }</p>
	        <a href="userInfo.jsp"><font size=5>个人信息</font></a>
	    	</br></br>
	    	<a href="myPostList.jsp"><font size=5>我的发布</font></a>
	    	</br></br>
	    	<a href="post.jsp"><font size=5>发布信息</font></a>
	   </div>
   </c:if>
   <c:if test="${user.id==null }">
	<!--登录框-->
	<div class="signin">
        <p class="signin-title">帐号登录</p>
        <div>
           <form name="form1" method="post" action="${adminPath }/login?method=login" onsubmit="return check()">
            	<div>
                	<input id="indextext1" type="text" name="user" class="user" placeholder="用户名" onblur="check()">
                </div>
            	<!-- input的value为空时弹出提醒 -->
            	<div id="index1" class="signin-remind"></div>
            	
            	<div>
                	<input id="indextext2" type="password" name="password" class="password" placeholder="密码" onblur="check()">
            	</div>
            	<!-- input的value为空时弹出提醒 -->
            	<div id="index2" class="signin-remind"></div>
            	
                <div>
                    <input class="signin-submit" type="submit" value="登录">
                </div>
           	</form>
        </div>
    </div>
    <script src="js/signinDialog.js"></script>
   </c:if>
        
    <!--导航栏-->  
    <div class="navigationBar">
    	<table cellspacing="20">
    		<tr><td><a href="${adminPath }/login?method=postList&tag=0">最新</a></td></tr>
    		<tr><td><a href="${adminPath }/login?method=postList&tag=1">同行</a></td></tr>
			<tr><td><a href="${adminPath }/login?method=postList&tag=2">购物</a></td></tr>
			<tr><td><a href="${adminPath }/login?method=postList&tag=3">二手</a></td></tr>
			<tr><td><a href="${adminPath }/login?method=postList&tag=4">组队</a></td></tr>
		</table>
    </div> 
    
    <!--我的发布-->  
    <div style="position:absolute;top: 100px; left: 200px; width:80%; overflow: auto;">
    	<table cellspacing="20" width="80%">
    		<tr>
    			<th width="10%">标题</th>
   				<th width="10%">标签</th>
   				<th width="10%">副标签</th>
   				<th width="13%">联系方式</th>
   				<th width="27%">内容</th>
   				<th width="10%">图片</th>
   				<th width="13%">发布日期</th>
   				<th width="7%">操作</th>
   			</tr>
    		<c:forEach items="${postList }" var="post">
    			<tr>
    				<td>${post.PTitle }</td>
    				<td>${post.PTag}</td>
    				<td>${post.PTag2}</td>
    				<td>${post.PTelephone}</td>
    				<td>${post.PDescription}</td>
    				<td><img src="${post.picUrl}" width="50px" height="50px"></td>
    				<td>${post.PDate}</td>
    				<td><a href="${adminPath }/login?method=delPost&id=${post.AId}">删除</a></td>
    			</tr>
    		</c:forEach>
		</table>
    </div>




</body>
</html>