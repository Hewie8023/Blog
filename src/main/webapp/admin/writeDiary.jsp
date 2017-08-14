<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写日记页面</title>

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
		var content = UE.getEditor('editor').getContent()
		
		if(title==null || title==""){
			alert("请输入日记标题！");
		}else if(author==null || author==""){
			alert("请输入日记作者！");
		}else if(content==null || content==""){
			alert("请输入日记正文！");
		}else{
			$.post("${pageContext.request.contextPath}/admin/diary/save.do",
					{'title':title,'author':author,'contentNoTag':UE.getEditor('editor').getContentTxt(),'content':content,
					'summary':UE.getEditor('editor').getContentTxt().substr(0,155),},
					function(result){
					if(result.success){
						alert("日记发布成功！");
						resultValue();
					}else{
						alert("日记发布失败！");
					}
			},"json");
		}
	}
	
	function resultValue(){
		$("#title").val("");
		$("#author").val("");
		UE.getEditor('editor').setContent('');
	}
</script>

</head>
<body style="margin: 10px;">

<div id="p" class="easyui-panel" title="编写日记" style="padding: 10px;">
	<table cellspacing="20px;">
		<tr>
			<td width="80px;">日记标题：</td>
			<td>
				<input type="text" id="title" name="title" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<td width="80px;">日记作者：</td>
			<td>
				<input type="text" id="author" name="author" style="width: 80px;"/>
			</td>
		</tr>
		<tr>
			<td valign="top">日记内容：</td>
			<td width="950px;" >
				<script id="editor" name="content" type="text/plain" style="width:100%;height:200px;"></script>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>	
				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布日记</a>
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