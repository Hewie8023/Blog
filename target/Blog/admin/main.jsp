<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Hewie个人博客后台管理页面 — Powered by Hewie</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/admin.css">
<link href="${pageContext.request.contextPath}/favicon.ico" rel="SHORTCUT ICON">

<script type="text/javascript">

	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/admin/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改博主密码");
		url="${pageContext.request.contextPath}/admin/blogger/modifyPassword.do";
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var newPassword =  $("#newPassword").val();
				var newPassword2 =  $("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","两次密码输入不一致，请重新输入！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登陆生效！");
					resetValue();
					$("#dlg").dialog("close");
				}else{
					$.messager.alert("系统提示","密码修改失败！");
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function closeModifyPasswordDlg(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function refreshSystem(){
		$.post("${pageContext.request.contextPath}/admin/system/refreshSystem.do",{},function (result){
			if(result.success){
				$.messager.alert("系统提示","系统缓存刷新成功！");
			}else{
				$.messager.alert("系统提示","系统缓存刷新失败！");
			}
		},"json");
	}

	function logout(){
		$.messager.confirm("系统提示","确定要退出系统吗？",function(r){
			if(r){
				window.location.href="${pageContext.request.contextPath}/admin/blogger/logout.do";
			}
		});
	}
	
</script>

</head>
<body class="easyui-layout" style="background: #494A5F;">
	<div region="north" style="height: 85px;background-color: #E0ECFF">
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="50%">
					<img alt="logo" src="${pageContext.request.contextPath}/static/images/logo.png">
				</td>
				<td valign="bottom" align="right" width="50%">
					<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.userName }</font>
				</td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div style="margin-top: 150px;">
					<div style="width: 150px;height: 150px;background-color: #E08031;margin: 15px 15px 15px 95px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">博客</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${blogNum }</font></p>
					</div>
					<div style="width: 150px;height: 150px;background-color: #199475;margin: 15px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">照片</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${photoNum }</font></p>
					</div>
					<div style="width: 150px;height: 150px;background-color: #C7CEB2;margin: 15px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">日记</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${diaryNum }</font></p>
					</div>
					<div style="width: 150px;height: 150px;background-color: #0B6E48;margin: 15px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">碎语</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${gossipNum }</font></p>
					</div>
					<div style="width: 150px;height: 150px;background-color: #044D22;margin: 15px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">评论</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${commentNum }</font></p>
					</div>
					<div style="width: 150px;height: 150px;background-color: #E08031;margin: 15px;text-align: center;float: left;">
						<p style="padding-top: 8px;"><font size="6" color="white">留言</font></p>
						<p style="padding-top: 8px;"><font size="8" color="white">${msgNum }</font></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
				<a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px">写博客</a>
				<a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
				<a href="javascript:openTab('写日记','writeDiary.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写日记</a>
			</div>
			<div title="日记管理"  data-options="iconCls:'icon-rjgl'" style="padding:10px;">
				<a href="javascript:openTab('写日记','writeDiary.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写日记</a>
				<a href="javascript:openTab('日记信息管理','diaryManage.jsp','icon-rjgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-rjgl'" style="width: 150px;">日记信息管理</a>
			</div>
			<div title="博客管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
				<a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写博客</a>
				<a href="javascript:openTab('博客信息管理','blogManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
			</div>
			<div title="相册管理"  data-options="iconCls:'icon-tpgl'" style="padding:10px;">
				<a href="javascript:openTab('相册信息管理','photoManage.jsp','icon-tpgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tpgl'" style="width: 150px;">相册信息管理</a>
			</div>
			<div title="时光轴管理"  data-options="iconCls:'icon-sjgl'" style="padding:10px;">
				<a href="javascript:openTab('写碎语','writeGossip.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写碎语</a>
				<a href="javascript:openTab('时光轴信息管理','gossipManage.jsp','icon-sjgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjgl'" style="width: 150px;">时光轴信息管理</a>
			</div>
			<div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
				<a href="javascript:openTab('博客类别信息管理','blogTypeManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
			</div>
			<div title="评论管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
				<a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
				<a href="javascript:openTab('评论信息管理','commentManage.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
			</div>
			<div title="留言管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
				<a href="javascript:openTab('留言审核','msgReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">留言审核</a>
				<a href="javascript:openTab('留言信息管理','msgManage.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">留言信息管理</a>
			</div>
			<div title="个人信息管理"  data-options="iconCls:'icon-grxx'" style="padding:10px">
				<a href="javascript:openTab('修改个人信息','modifyInfo.jsp','icon-grxxxg')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-grxxxg'" style="width: 150px;">修改个人信息</a>
			</div>

			<div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
			    <a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'" style="width: 150px">友情链接管理</a>
			    <a href="javascript:openTab('网站公告管理','noticeManage.jsp','icon-gggl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-gggl'" style="width: 150px;">网站公告管理</a>
			    <a href="javascript:openTab('更新日志管理','updateLogManage.jsp','icon-gxrz')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-gxrz'" style="width: 150px;">更新日志管理</a>
			    <a href="javascript:openTab('每日一语管理','dailyWordManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'" style="width: 150px">每日一语管理</a>
				<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
				<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px;">刷新系统缓存</a>
				<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>
	<div region="south" style="height: 25px;padding: 5px" align="center">
		Copyright © 2017 Hewie个人博客 版权所有
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 200px; padding: 10px 20px;" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td>
						<input type="text" id="userName" name="userName" value="${currentUser.userName }" readonly="readonly" style="width: 200px;"/>
					</td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td>
						<input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width: 200px;"/>
					</td>
				</tr>
				<tr>
					<td>确认新密码：</td>
					<td>
						<input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px;"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok" >修改</a>
		<a href="javascript:closeModifyPasswordDlg()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
	</div>
	
</body>
</html>