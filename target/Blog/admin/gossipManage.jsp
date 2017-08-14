<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>时光轴管理页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	
	function deleteGossip(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/gossip/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
	
	function openGossipModifyTab(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一个要修改的碎语！");
			return;
		}
		var row = selectedRows[0];
		window.parent.openTab('修改碎语','modifyGossip.jsp?id='+row.id,'icon-writeblog');
	}
</script>

</head>

	
<body style="margin: 1px">
<table id="dg" title="时光轴管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/admin/gossip/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">编号</th>
  		<th field="content" width="400" align="center" >碎语内容</th>
  		<th field="releaseDate" width="50" align="center">发布日期</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openGossipModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteGossip()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>
</body>

</html>
    