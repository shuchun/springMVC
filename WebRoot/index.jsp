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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="easyUI/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="easyUI/themes/default/easyui.css"
	type="text/css"></link>
<script type="text/javascript" src="easyUI/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="easyUI/jquery.easyui.min.js"></script>

</head>

<body>
	<div id="win" class="easyui-window" title="Login"
		style="width:300px;height:200px;">
		<form style="padding:10px 20px 10px 40px;">
			<p>
				Name: <input id="name" type="text" value="Admin"
					class="easyui-validatebox" data-options="required:true">
			</p>
			<p>
				Pass: <input id="pass" type="password" value="admin"
					class="easyui-validatebox" data-options="required:true">
			</p>
			<div style="padding:5px;text-align:center;">
				<a href="<%=basePath%>customer/list.do" onclick="return valid();"
					class="easyui-linkbutton" icon="icon-ok">Ok</a> <a href="#"
					class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function valid() {

			if($("#name").val().trim()=="Admin"&&$("#pass").val().trim()=="admin"){
				return true;
			}else{
				$.messager.alert('Warning','用户名或密码错误！'); 
			}
			return false;
		}
	</script>
</body>
</html>
