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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拼团 in SCU</title>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/signinDialog.css">
<link rel="stylesheet" type="text/css" href="css/signinState.css">
<link rel="stylesheet" type="text/css" href="css/navigationBar.css">
<link rel="stylesheet" type="text/css" href="css/indexinfo.css">
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
	    	<a href="${adminPath }/login?method=getMine&tId=${user.id}"><font size=5>我的发布</font></a>
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
        
    <div class="indexinfo" style="top:150px;">
		<table cellspacing="20" width= "550px" height="350px"> 
			<tr>
 				<td width= "300px" rowspan="4"> 　
 				<p style="color:burlywood;position:absolute;top:0px;text-decoration:underline">编辑精选</p>
 				<img src="images/01.jpeg" width="300" height="150"/> 
 				</td>  
        		<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">同行·四川</font></td> 
     		</tr>
     		<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">川藏旅游拼团</font></td>  
			</tr>
			<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">jiajialin</font></td>  
			</tr>
    		<tr>
  				<td width= "150px" align="left">川藏路线，七天，有想一起的小伙伴吗~</td>  
    	    </tr>
		</table>
	</div>
    
    <div class="indexinfo" style="top:550px;">
		<table cellspacing="20" width= "550px" height="350px"> 
			<tr>
 				<td width= "300px" rowspan="4"> 
 				<p style="color:burlywood;position:absolute;top:0px;text-decoration:underline">编辑精选</p>
 				<img src="images/02.jpg" width="300" height="227"/> 
 				</td>  
        		<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">二手·美妆</font></td> 
     		</tr>
     		<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">眼影盘转卖</font></td>  
			</tr>
			<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">wyh</font></td>  
			</tr>
    		<tr>
  				<td width= "150px" align="left">入手不久的眼影盘，因为和之前买的有重复所以想转卖</td>  
    	    </tr>
		</table>
	</div>
    
    
    <div class="indexinfo" style="top:950px;">
		<table cellspacing="20" width= "550px" height="350px"> 
			<tr>
 				<td width= "300px" rowspan="4"> 
 				<p style="color:burlywood;position:absolute;top:0px;text-decoration:underline">编辑精选</p>
 				<img src="images/03.jpg" width="177" height="250"/> 
 				</td>  
        		<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">二手·书籍</font></td> 
     		</tr>
     		<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">出精装版《冰与火之歌》</font></td>  
			</tr>
			<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">ctj</font></td>  
			</tr>
    		<tr>
  				<td width= "150px" align="left"> 自己收藏的冰与火之歌精装版，因为要搬宿舍，低价出售啦~</td>  
    	    </tr>
		</table>
	</div>
    
    <div class="indexinfo" style="top:1350px;">
		<table cellspacing="20" width= "550px" height="350px"> 
			<tr>
 				<td width= "300px" rowspan="4"> 　
 				<p style="color:burlywood;position:absolute;top:0px;text-decoration:underline">编辑精选</p>
 				<img src="images/04.png" width="300" height="92"/> 
 				</td>  
        		<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">组队·比赛</font></td> 
     		</tr>
     		<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">组队！求程序员一名！</font></td>  
			</tr>
			<tr>
				<td width= "150px" height="40px" align="center" bgcolor="lightblue"><font color="white">yw</font></td>  
			</tr>
    		<tr>
  				<td width= "150px" align="left">花旗杯金融创新大赛，我们是金融专业和高分子专业的同学，已有想法，求一名会编程的同学，有意向的请尽快联系我们！！</td>  
    	    </tr>
		</table>
	</div>
    
  
    <div style="position: absolute;top:2000px;border-bottom: 1px solid white;width: 100%;"></div>	
    
    
        
</body>
</html>