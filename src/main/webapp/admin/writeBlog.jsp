<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写博客页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">
	function submitData(){
		var title = $("#title").val();
		var author = $("#author").val();
		var blogTypeId = $("#blogTypeId").combobox("getValue");
		var content = UE.getEditor('editor').getContent()
		var keyWord = $("#keyWord").val();
		
		if(title==null || title==""){
			alert("请输入博客标题！");
		}else if(author==null || author==""){
			alert("请输入博客作者！");
		}else if(blogTypeId==null|| blogTypeId==""){
			alert("请选择博客类别！");
		}else if(content==null || content==""){
			alert("请输入博客正文！");
		}else{
			$.post("${pageContext.request.contextPath}/admin/blog/save.do",
					{'title':title,'author':author,'blogType.blogTypeId':blogTypeId,'contentNoTag':UE.getEditor('editor').getContentTxt(),'content':content,
					'summary':UE.getEditor('editor').getContentTxt().substr(0,155),'keyWord':keyWord},
					function(result){
					if(result.success){
						alert("博客发布成功！");
						resultValue();
					}else{
						alert("博客发布失败！");
					}
			},"json");
		}
	}
	
	function resultValue(){
		$("#title").val("");
		$("#keyWord").val("");
		$("#author").val("");
		$("#blogTypeId").combobox("setValue","");
		UE.getEditor('editor').setContent('');
	}
</script>

</head>
<body style="margin: 10px;">

<div id="p" class="easyui-panel" title="编写博客" style="padding: 10px;">
	<table cellspacing="20px;">
		<tr>
			<td width="80px;">博客标题：</td>
			<td>
				<input type="text" id="title" name="title" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<td width="80px;">博客作者：</td>
			<td>
				<input type="text" id="author" name="author" style="width: 80px;"/>
			</td>
		</tr>
		<tr>
			<td>所属类别：</td>
			<td>
				<select class="easyui-combobox" style="width: 150px;" id="blogTypeId" name="blogType.blogTypeId" editalbe="false" panelHeight="auto">
					<option value="">请选择博客类别...</option>
					<c:forEach var="blogType" items="${blogTypeCountList }">
						<option value="${blogType.blogTypeId }">${blogType.typeName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td valign="top">博客内容：</td>
			<td width="950px;" >
				<script id="editor" name="content" type="text/plain" style="width:100%;height:200px;"></script>
			</td>
		</tr>
		<tr>
			<td>关键字：</td>
			<td>
				<input type="text" id="keyWord" name="keyWord" style="width: 400px"/>&nbsp;(多个关键字用空格隔开)
			</td>
		</tr>
		<tr>
			<td></td>
			<td>	
				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a>
			</td>
		</tr>
	</table>
</div>

 <!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('editor');
</script>
    
   	
</body>
</html>