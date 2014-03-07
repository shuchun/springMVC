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

<title>My JSP 'grid.jsp' starting page</title>

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

<script>
   $(document).ready(function(){
   
   		$('#dg').datagrid({    
    		method:'get',
    		loadMsg:'正在加载信息，请稍等！',
    		idField:'id', 
    		title:'用户信息',
    		/* data:jsonmsg(), */
    		url:'<%=basePath%>customer/json.do',
    		columns:[[
        	    
	        {field:'id',title:'ID',width:100},  
	        {field:'name',title:'姓名',width:100},  
	        {field:'age',title:'年龄',width:100},
	        {field:'address',title:'地址',width:100}
   			 ]],
   			 onLoadSuccess:function(data){
   			 	alert("success");
   			 },
   			 onLoadError:function(){
   			 	alert("error");
   			 }
		});
   });
</script>

</head>

<body>
	<table id="dg"></table> 
</body>
</html>
