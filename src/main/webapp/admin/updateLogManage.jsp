<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新日志管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	var url;
	function openUpdateLogAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加更新日志");
		url="${pageContext.request.contextPath}/admin/updateLog/save.do";
	}
	
	function openUpdateLogModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一个要修改的更新日志！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改更新日志");
		$("#fm").form("load",row);
		url="${pageContext.request.contextPath}/admin/updateLog/save.do?id="+row.id;
	}
	
	function saveUpdateLog(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var logContent = $("#logContent").val();
				if(logContent == null || logContent == ""){
					$.messager.alert("系统提示","请输入更新日志！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#logContent").val("");
	}
	
	function closeUpdateLogDialog(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function deleteUpdateLog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的更新日志！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条更新日志吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/updateLog/delete.do",{ids:ids},function(result){
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
</script>

</head>

	
<body style="margin: 1px">
<table id="dg" title="更新日志管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/admin/updateLog/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">编号</th>
  		<th field="logContent" width="300" align="center" >更新内容</th>
  		<th field="date" width="50" align="center">更新日期</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openUpdateLogAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openUpdateLogModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteUpdateLog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 800px;height: 180px; padding: 10px 20px;" closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>公告内容：</td>
				<td style="padding-top: 25px;">
					<textarea rows="3" cols="30" id="logContent" name="logContent" placeholder="更新内容" style="width: 550px;"></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveUpdateLog()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeUpdateLogDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

</body>

</html>
    