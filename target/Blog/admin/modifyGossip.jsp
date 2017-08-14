<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改碎语页面</title>

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
		var content = UE.getEditor('editor').getContent()
		
		if(content==null || content==""){
			alert("请写一点碎语呗！");
		}else{
			$.post("${pageContext.request.contextPath}/admin/gossip/save.do",
					{'id':'${param.id}','content':content},
					function(result){
					if(result.success){
						alert("碎语修改成功！");
					}else{
						alert("碎语修改失败！");
					}
			},"json");
		}
	}
	
</script>

</head>
<body style="margin: 10px;">

<div id="p" class="easyui-panel" title="修改碎语" style="padding: 10px;">
	<table cellspacing="20px;">
		<tr>
			<td valign="top">碎语内容：</td>
			<td width="950px;" >
				<script id="editor" name="content" type="text/plain" style="width:100%;height:200px;"></script>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>	
				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布碎语</a>
			</td>
		</tr>
	</table>
</div>

 <!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('editor');
    
    ue.addListener("ready",function(){
    	//通过ajax请求数据
    	UE.ajax.request("${pageContext.request.contextPath}/admin/gossip/findById.do",
    			{
    				method:"post",
    				async:false,
    				data:{"id":"${param.id}"},
    				onsuccess:function(result){
    					result = eval("("+result.responseText+")");
    					UE.getEditor('editor').setContent(result.content);
    				}
    			});
    });
</script>
    
   	
</body>
</html>