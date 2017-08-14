<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>每日一语管理页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	var url;
	function openDailyWordAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加每日一语");
		url="${pageContext.request.contextPath}/admin/dailyWord/save.do";
	}
	
	function openDailyWordModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一个要修改的每日一语！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改每日一语");
		$("#fm").form("load",row);
		url="${pageContext.request.contextPath}/admin/dailyWord/save.do?id="+row.id;
	}
	
	function saveDailyWord(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var dailyWordC = $("#dailyWordC").val();
				var dailyWordE = $("#dailyWordE").val();
				if(dailyWordC == null || dailyWordC == ""){
					$.messager.alert("系统提示","请输入每日一语（中文）！");
					return false;
				}
				if(dailyWordE == null || dailyWordE == ""){
					$.messager.alert("系统提示","请输入每日一语（英文）！");
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
		$("#dailyWordC").val("");
		$("#dailyWordE").val("");
	}
	
	function closeDailyWordDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deleteDailyWord(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的友情链接！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条每日一语吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/dailyWord/delete.do",{ids:ids},function(result){
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
<table id="dg" title="每日一语管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/admin/dailyWord/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">编号</th>
  		<th field="dailyWordC" width="300" align="center" >每日一语（中文）</th>
  		<th field="dailyWordE" width="300" align="center" >每日一语（英文）</th>
  		<th field="releaseDate" width="50" align="center">发布日期</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openDailyWordAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openDailyWordModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteDailyWord()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 800px;height: 300px; padding: 10px 20px;" closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>友情链接名称：</td>
				<td style="padding-top: 25px;">
					<textarea rows="3" cols="30" id="dailyWordC" name="dailyWordC" placeholder="中文每日一语" style="width: 550px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>友情链接地址：</td>
				<td style="padding-top: 25px;">
					<textarea rows="3" cols="30" id="dailyWordE" name="dailyWordE" placeholder="英文每日一语" style="width: 550px;"></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveDailyWord()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeDailyWordDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

</body>

</html>
    