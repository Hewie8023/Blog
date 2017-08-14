<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>博客留言审核页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	function msgReview(state){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要审核的留言！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要审核这<font color=red>"+selectedRows.length+"</font>条留言吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/msg/review.do",{ids:ids,state:state},function(result){
					if(result.success){
						$.messager.alert("系统提示","提交通过！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","提交失败！");
					}
				},"json");
			}
		});
	}
</script>

</head>

	
<body style="margin: 1px">
<table id="dg" title="博客评论审核" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/admin/msg/list.do?state=0" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">编号</th>
  		<th field="msgContent" width="200" align="center" >留言内容</th>
  		<th field="msgIP" width="50" align="center">留言IP</th>
  		<th field="msgName" width="50" align="center">留言名字</th>
  		<th field="msgEmail" width="80" align="center">留言Email</th>
  		<th field="msgDate" width="50" align="center">留言日期</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:msgReview(1)" class="easyui-linkbutton" iconCls="icon-ok" plain="true">审核通过</a>
		<a href="javascript:msgReview(2)" class="easyui-linkbutton" iconCls="icon-no" plain="true">审核不通过</a>
	</div>
</div>



</body>

</html>
    