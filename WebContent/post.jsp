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
<title>发布信息</title>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/post.css">
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
	
	
	<script src="js/post.js"></script>
	<div class="post-titile">>发布信息<</div>
		<div class="post-dialog">
			<form name="form1" method="post" action="UploadServlet" enctype="multipart/form-data" onsubmit="return postcheck()">
				<table id="dl" cellspacing="10">
					<tr>
						<td><input type="text" name="title" placeholder="标题，必填，4-40字" class="post-input" onblur="postcheck()"></td>
						<td width="200"><div id="postremind1" class="post-remind"></div></td> 
					</tr>
					<tr>
						<td><textarea name="content" class="post-textarea" placeholder="正文，必填，15-1000字" onblur="postcheck()"></textarea></td>
						<td><div id="postremind2" class="post-remind"></div></td>
					</tr>
					
					<tr>
						<td><input type="text" name="contactway" placeholder="联系方式，必填，微信/QQ/邮箱/手机号" class="post-input" onblur="postcheck()"></td>
						<td><div id="postremind3" class="post-remind"></div></td>
					</tr>
					
					<tr>
						<td><input type="file" name="uploadFile" accept="image/jpg, image/jpeg, image/png">&nbsp;&nbsp;&nbsp;&nbsp;添加一张jpg/jpeg/png格式的图片，选填</td>
					</tr>
					<tr>
						<td>
							
							<select id="selectLabel" name="tag1" onChange="setSubLabel(this.options[this.selectedIndex].value);">
								<option value="0">--选择标签--</option>
								<option value="同行">同行</option>
								<option value="购物">购物</option>
								<option value="二手">二手</option>
								<option value="组队">组队</option>
							</select>
							&nbsp;&nbsp;&nbsp;
							<select id="selectSubLabel" name="tag2">
								<option>--选择副标签--</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;选择标签和副标签，必填
						</td>
					
					</tr>
					<tr>
						<td align="center"><input type="submit" value="发布" class="post-submit"></td>
					</tr>
					
				</table>
			</form>
			
	</div>
	
	
	
	
	
	
	
</body>
</html>