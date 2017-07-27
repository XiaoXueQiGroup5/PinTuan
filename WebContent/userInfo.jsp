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
<meta charset="UTF-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>


<body>
	<!--标题栏-->
	<div class="topleft">
		<img src="images/pintuan.png" width="125" height="50"/>
	</div>
	<div class="topright">
		<a href="index.jsp">首页</a>
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

	
	<div class="register">
		<form name="form1" method="post" action="${adminPath }/login?method=update" onsubmit="return check()"> 
			<input type="hidden" value="${user.id }" name="id">
			<table cellspacing="18"> 
				<tr>
					<td>用户名：</td>
					<td><input id="text1" type="text" name="name" class="register-input" value="${user.name }" placeholder="4-12位数字、字母或下划线" onblur="check()" disabled="disabled"></td>
					<td width="200"><div id="div1" class="register-remind"></div></td> 
				</tr> 
				<tr>
					<td>密码：</td> 
					<td><input id="text2" type="password" name="pwd1" class="register-input" value="${user.pwd }" placeholder="4-12位数字或字母" onblur="check()"></td>
					<td><div id="div2" class="register-remind"></div></td> 
				</tr> 
				<tr>
					<td>确认密码：</td>
					<td><input id="text3" type="password" name="pwd2"  class="register-input" value="${user.pwd }" onblur="check()"></td>
					<td><div id="div3" class="register-remind"></div></td> 
				</tr>
				<tr>
					<td>Email：</td> 
					<td><input id="text4" type="text" name="email"  class="register-input" value="${user.email }" placeholder="请输入有效邮箱"  onblur="check()"></td>
					<td><div id="div4" class="register-remind"></div></td> 
				</tr>
				<tr>
					<td>手机号：</td> 
					<td><input id="text5" type="text" name="telephone" class="register-input" value="${user.telephone }" placeholder="请输入有效手机号" onblur="check()"></td>
					<td><div id="div5" class="register-remind"></div></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td align="center">
					<c:if test="${user.sex=='M' }">
						<input id="" type="radio" name="sex" value="M" checked="checked">男&nbsp;&nbsp;&nbsp;<input id="" type="radio" name="sex" value="F">女
					</c:if>
					<c:if test="${user.sex=='F' }">
						<input id="" type="radio" name="sex" value="M">男&nbsp;&nbsp;&nbsp;<input id="" type="radio" name="sex" value="F"  checked="checked">女
					</c:if>
					
					
					</td>
					<td><div id="div6" class="register-remind"></td>
				</tr>
				<tr align="center">
					<td style="height: 40px;"></td>
					<td align="center"><input type="submit" value="保存" name="text6" class="register-submit"></td>
					<td></td>
				</tr>
			</table>
		</form> 
	</div>
	

    <script src="js/register.js"></script> 



    
    
</body>
</html>