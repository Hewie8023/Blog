
<script type="text/javascript">
    
    
    function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
    
    function submitData(){
    	var msgContent = $("#msgContent").val();
    	var msgName = $("#msgName").val();
    	var msgEmail = $("#msgEmail").val();
    	var imageCode = $("#imageCode").val();
    	
    	if(msgName == null || msgName == ""){
    		msgName = "匿名者";
    	}
    	
    	if(msgContent == null || msgContent ==""){
    		alert("请输入评论内容!");
    		msgName = "";
    	}else if(imageCode==null || imageCode==""){
    		alert("请填写验证码!");
    		msgName = "";
    	}else if(msgEmail==null || msgEmail==""){
    		alert("请填写用户邮箱!");
    		msgName = "";
    	}else if(msgEmail.indexOf("@") == -1){
    		alert("请填写正确的邮箱!");
    		msgName = "";
    	}else{
    		$.post("${pageContext.request.contextPath}/msg/save.do",{"msgContent":msgContent,"msgName":msgName,"msgEmail":msgEmail,"imageCode":imageCode},function(result){
    			if(result.success){
    				alert("留言已提交成功，审核通过后显示！");
    				$("#imageCode").val("");
    				window.location.reload();
    				
    			}else{
    				alert(result.errorInfo);
    			}
    		},"json");
    	}
    	
    }
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="margin-top: 50px;" class="wow bounceInUp" data-wow-duration="2s">
	<h1  class="title" style="margin-bottom: 10px;"><strong>给我留言</strong></h1>	
	<c:choose>
		<c:when test="${msglist.size()==0 }">
			<div class="commentcontent">
				<p style="margin: 5px 5px 0px 2px;"><font size="4">还没有人评论:-(还不快来抢沙发...</font></p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="msg" items="${msglist }" varStatus="msgState">
				<div class="commentcontent">
					<font color="#ED6D5A"><small>${fn:length(msglist) - msgState.index} #</small></font>
					<span style="border-bottom:1px solid #eee;"><small><strong>${msg.msgName}</strong></small> / <small>${msg.msgIP}</small> / <small> <fmt:formatDate value="${msg.msgDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></small></span>
					<p style="margin: 5px;"><font size="4">${msg.msgContent}</font></p>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<div style="margin-top: 60px;" class="wow bounceInUp" data-wow-duration="2s">
	<h1  class="title" ><strong>添加留言</strong></h1>
	<div style="margin-top: 10px;">
		<form class="comment-form form-inline" action="comment?action=save" method="post" >
			<div class="input-group input-group-sm" style="padding-bottom: 3px;width: 100%;">
				 <div  class="input-group-addon">YourName<small>&nbsp;&nbsp;(Optional)</small></div>
				 <input type="text" class="form-control" placeholder="Yourname" aria-describedby="sizing-addon3" maxlength="20" id="msgName" name="msgName"/>
				  <div class="input-group-addon">YourEmail<small>&nbsp;&nbsp;(Required)</small></div>
				 <input type="email" class="form-control" placeholder="YourEmail" aria-describedby="sizing-addon3" id="msgEmail" name="msgEmail"/>
			</div>
			<div class="form-group" style="width: 100%;">
				<textarea class="form-control" style="width: 100%;resize: none;" rows="3" id="msgContent"  name="msgContent" autofocus="autofocus" placeholder="评论内容" autocomplete="off"></textarea>
			</div>
			<div  style="padding-top: 15px;float: left;padding-bottom: 10px;padding-right: 5px;">
				<label >验证码：</label><input class="form-control" type="text" value="" name="imageCode"  id="imageCode" size="10" onkeydown= "if(event.keyCode==13)form1.submit()"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="/image.jsp" width="60" height="20" border="1" align="absmiddle"> 
			</div>
			<div style="padding-top: 15px;float: right;padding-bottom: 10px;">
				<input class="btn"  type="button" onclick="submitData()" value="评论">
			</div>
		</form>
	</div>
</div>
