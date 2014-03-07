<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mvc.model.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>Customer List Page</title>

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
   
   		//load Data
   		loadData();
   		
		
   });
   
</script>


</head>

<body class="easyui-layout">

	<div data-options="region:'north',border:false"
		style="height:50px;background:#B3DFDA;padding:10px">
		<b>Status:${status }</b>
	</div>

	<div data-options="region:'west'" style="width:150px;padding:10px;">
		<h3>Left Menu</h3>
	</div>

	<div data-options="region:'center',title:'Customer List'"
		style="padding:40px;">
		<a iconCls="icon-add" class="easyui-linkbutton"
			href="<%=basePath%>customer/create.do">添加</a>
		<hr />
		<%-- <table>
			<thead>
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>地址</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="customer">
					<tr>
						<td>${customer.id }</td>
						<td>${customer.name }</td>
						<td>${customer.age }</td>
						<td>${customer.address }</td>
						<td><a iconCls="icon-edit" class="easyui-linkbutton"
							href="<%=basePath %>customer/alter.do?id=${customer.id}">修改</a> <a
							iconCls="icon-cancel" class="easyui-linkbutton"
							onclick="return deleteCustomer('${customer.name}')"
							href="<%=basePath%>customer/delete.do?id=${customer.id}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table> --%>
		
		<table id="dg" style="width:500px;"></table> 
	</div>
	<script type="text/javascript">
		
		/* --------------- my Pagination --------------------------*/
		function myPagination(){
			var page=$('#dg').datagrid('getPager');
			
			page.pagination({
				showPageList:false,
				buttons:[
					{iconCls:'icon-search',
					 handler:function(){
					 	alert('没实现呢！');
					 }
					},
					{iconCls:'icon-add',
					 handler:function(){
					 	alert('没实现呢！');
					 }
					}],
				onBeforeRefresh:function(){
					alert('before refresh!');
					return true;
				}
				
			});
		}
		/* --------------- load Data --------------------------*/
		function loadData(){
			$('#dg').datagrid({    
    		method:'get',
    		loadMsg:'正在加载信息，请稍等！',
    		idField:'id', 
    		title:'用户信息',
    		url:'<%=basePath%>customer/json.do',
    		frozenColumns:[[
    			{field:'id',title:'ID',width:100,sortable:true,checkbox:true},
    			{field:'name',title:'姓名',width:100}
    		]],
    		columns:[[
	        {field:'age',title:'年龄',width:100,sortable:true,
	         formatter:function(val,rec){
	        	if(val<18){
	        		return '<span style="color:red;">未成年('+val+'岁)</span>';
	        	}else if(val<30){
	        		return '青年';
	        	}else if(val<60){
	        		return '<span style="color:blue">中年('+val+'岁)</span>';
	        	}else{
	        		return '<span style="color:yellow">老年('+val+'岁)</span>';
	        	}
	        }},
	        {field:'address',title:'地址'},
	        {field:'Action',title:'Action',
	         formatter:function(value,row,index){
	         	var r='';
	         	r='<a href="#" iconCls="icon-edit" class="easyui-linkbutton" >修改</a>';
	         	r=r+'<a href="#" iconCls="icon-cancel" class="easyui-linkbutton">删除</a>';
	         	return r;
	         }
	        }
   			 ]],
   			 pagination:true,
   			 sortName:'id',
   			 sortOrder:'desc',
   			 toolbar:[/* {text:'Add',
   			 			iconCls:'icon-add',
   			 			handler:function(){
   			 				getItems();
   			 			}},'-', */
   			 			{text:'Alert',
   			 			 iconCls:'icon-edit',
   			 			 handler:function(){
   			 			 	updateItem();
   			 			 }
   			 			},'-',
   			 			{text:'Delete',
   			 			 iconCls:'icon-cancel',
   			 			 handler:function(){
   			 			    deleteItem();
   			 			 }}
   			 
   			 ]
   			 /* ,
   			 onLoadSuccess:function(data){
   			 	alert("success");
   			 },
   			 onLoadError:function(){
   			 	alert("error");
   			 } */
		});
		//my pagination
   		myPagination();
		}
		/* --------------- update select item method --------------------------*/
			function updateItem(){
				var row=getItem();
				
				if(row){
					window.location='<%=basePath %>customer/alter.do?id='+row.id;
				}else{
					alert('请选择需要修改的数据.');
				}
				
			}

	 	/* --------------- delete select item method --------------------------*/
	 		function deleteItem(){
	 			//var row=$('#dg').datagrid('getSelected');
	 			var row=getItem();
	 			
	 			//判断是否选择行
	 			if(row){
	 				console.log(row.id);
	 				var con=deleteCustomer(row.name);//删除确认
	 				if(con){
	 					$.ajax({
	 						type:'get',
	 						url:'customer/delete.do',
	 						data:'id='+row.id,
	 						success:function(){
	 							window.location.reload();
	 						}
	 					});
	 				}
	 			}else{
	 				alert('Data Not Select!');
	 			}
	 		}
		/* --------------- delete confirm method --------------------------*/
	 		function deleteCustomer(data){
	 		var result=false;
	 			 result= confirm("确定要删除客户"+data+"?");
	 			 return result;
	 		}
	 	/* ------------------   get select item method  -------------------*/
	 	function getItem(){
	 		var row=$('#dg').datagrid('getSelected');
	 		
	 		if(row){
	 			return row;
	 		}
	 	}
	    /* ------------------get all select item method -------------------*/
	    function getItems(){
	    	var ids = [];
			var rows = $('#dg').datagrid('getSelections');
			for(var i=0; i<rows.length; i++){
    			ids.push(rows[i].id);
    		}
    		console.log(ids);
	    }
	</script>
</body>
</html>
	