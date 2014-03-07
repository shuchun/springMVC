<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'update.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="easyUI/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="easyUI/themes/default/easyui.css"
	type="text/css"></link>
<script type="text/javascript" src="easyUI/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="easyUI/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false"
		style="height:50px;background:#B3DFDA;padding:10px"><h1>This is Top banner</h1></div>

	<div data-options="region:'west'" style="width:150px;padding:10px;"><h3>Left Menu</h3></div>

	<div data-options="region:'center',title:'Update Form'" style="padding:40px;">
		<form action="customer/update.do" method="post">
			<input type="hidden"  name="id" value="${customer.id }"> 姓名：<input
				type="text" class="easyui-validatebox" data-options="required:true" name="name" value="${customer.name }"><br /> 年龄：<input
				type="text" class="easyui-numberbox" data-options="required:true,min:18,max:200"  name="age" value="${customer.age }"><br /> 地址：<input
				type="text" name="address" value="${customer.address }"><br />
			<input type="submit" value="提交">
		</form>
	</div>

</body>

</html>
