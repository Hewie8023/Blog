<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>相册管理页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	function formatTitle(val,row){
		return "<a target='_blank' href='${pageContext.request.contextPath}/static/photo/images/"+row.id+".html'>"+val+"</a>";
	}

	var url;
	function openPhotoAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加图片");
		url="${pageContext.request.contextPath}/admin/photo/save.do";
	}
	
	function openPhotoModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");  
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一张要修改的图片！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改图片");
		$("#fm").form("load",row);
		url="${pageContext.request.contextPath}/admin/photo/save.do?id="+row.id;
	}
	
	function savePhoto(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
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
		$("#nickName").val("");
		$("#author").val("");
		$("#profile").val("");
		$("#imageFile").val("");
	}
	
	function closePhotoDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deletePhoto(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的图片！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>张图片吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/photo/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","图片已成功删除！");							
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","图片删除失败！");
					}
				},"json");
			}
		});
	}
</script>

</head>

	
<body style="margin: 1px">
<table id="dg" title="相册管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/admin/photo/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">编号</th>
  		<th field="imageName" width="100" align="center" formatter="formatTitle">文件名</th>
  		<th field="nickName" width="100" align="center">图片名</th>
  		<th field="author" width="100" align="center">拍摄者</th>
  		<th field="profile" width="100" align="center">描述</th>
  		<th field="releaseDate" width="100" align="center">发布日期</th>
  		<th field="clickHit" width="100" align="center">点击量</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openPhotoAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openPhotoModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deletePhoto()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 500px;height: 300px; padding: 10px 20px;" closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post" enctype="multipart/form-data">
		<table cellspacing="8px">
			<tr>
				<td>图片名：</td>
				<td>
					<input type="text" id="nickName" name="nickName" class="easyui-validatebox" required="true"/>
				</td>
			</tr>
			<tr>
				<td>拍摄者：</td>
				<td>
					<input type="text" id="author" name="author" class="easyui-validatebox" required="true" />
				</td>
			</tr>
			<tr>
				<td>描述：</td>
				<td style="padding-top: 20px;">
					<textarea rows="4" style="width: 350px;" id="profile" name="profile"></textarea>
				</td>
			</tr>
			<tr>
				<td >图片：</td>
				<td>
					<input type="file" id="imageFile" name="imageFile" />
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:savePhoto()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closePhotoDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

</body>

</html>
    