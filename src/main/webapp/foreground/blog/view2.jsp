<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","tieba","sqq","douban"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","tieba","sqq","douban"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
    SyntaxHighlighter.all();
    
    
    function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
    
    function submitData(){
    	var content = $("#content").val();
    	var visitorName = $("#visitorName").val();
    	var visitorEmail = $("#visitorEmail").val();
    	var imageCode = $("#imageCode").val();
    	
    	if(visitorName == null || visitorName == ""){
    		visitorName = "匿名者";
    	}
    	
    	if(content == null || content ==""){
    		alert("请输入评论内容!");
    		visitorName = "";
    	}else if(imageCode==null || imageCode==""){
    		alert("请填写验证码!");
    		visitorName = "";
    	}else if(visitorEmail==null || visitorEmail==""){
    		alert("请填写用户邮箱!");
    		visitorName = "";
    	}else if(visitorEmail.indexOf("@") == -1){
    		alert("请填写正确的邮箱!");
    		visitorName = "";
    	}else{
    		$.post("${pageContext.request.contextPath}/comment/save.do",{"content":content,"visitorName":visitorName,"visitorEmail":visitorEmail,"imageCode":imageCode,"blog.blogId":"${blog.blogId}"},function(result){
    			if(result.success){
    				alert("评论已提交成功，审核通过后显示！");
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

<h1  class="title"><strong>博客正文</strong></h1>
<div class="blogshow wow bounceInUp" data-wow-duration="2s">
	<h3 class="showtitle"><strong>${blog.title}</strong></h3>
	<p class="dateview" style="padding-bottom:20px;margin-bottom: 8px;text-align: center; border-bottom: 1px solid #eee;"><span><img style="margin-bottom: 2px;" src="${pageContext.request.contextPath}/static/images/time.png"/>&nbsp;&nbsp;<fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span><span>作者：${blog.author }</span><span>个人博客：「<a href="${pageContext.request.contextPath}/index.html?typeId=${blog.blogType.blogTypeId}">${blog.blogType.typeName }</a>」</span><span>阅读(${blog.clickHit})</span><span>评论(${blog.replyHit})</span></p>
	<div class="showcontent">
		${blog.content }
	</div>
	<div style="margin: 10px 5px 20px 0;">
		关键字：
		<c:choose >
			<c:when test="${keyWords==null }">
				无
			</c:when>
			<c:otherwise>
					<c:forEach var="keyWord" items="${keyWords}">
						<a href="${pageContext.request.contextPath}/blog/q.html?q=${keyWord}" target="_blank" class="keyword" title="查看有关${keyWord}的文章">${keyWord}</a>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div style="float: left;margin-top: 8px;">把文章分享给其他人...</div>
	<div class="share" style="margin-bottom: 30px;">
		<div  class="bdsharebuttonbox"><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_douban" data-cmd="douban" title="分享到豆瓣网"></a><a href="#" class="bds_more" data-cmd="more"></a></div>
	</div>
	<div style="clear:both;background-color: #F2F2F2;box-shadow: -4px 0 0 #F08373; padding: 5px 4px 3px 4px;margin-top: 30px;">
		<p>本文为原创文章，会经常更新知识点以及修正一些错误，因此转载请保留原出处，方便溯源，避免陈旧错误知识的误导，同时有更好的阅读体验。</p>
		<p>本文地址：<a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId }.html">${pageContext.request.contextPath}/blog/articles/${blog.blogId }.html</a></p>
	</div>
	<div style="margin-top: -20px;">
		<nav aria-label="...">
			<ul class="pager">
				${pageCode }
			</ul>
		</nav>
	</div>
</div>

<div style="margin-top: 180px;" class="wow bounceInUp" data-wow-duration="2s">
	<h1  class="title" style="margin-bottom: 10px;"><strong>用户评论</strong></h1>	
	<c:choose>
		<c:when test="${commentList.size()==0 }">
			<div class="commentcontent">
				<p style="margin: 5px 5px 0px 2px;"><font size="4">还没有人评论:-(还不快来抢沙发...</font></p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="comment" items="${commentList }" varStatus="commentState">
				<div class="commentcontent">
					<font color="#ED6D5A"><small>${fn:length(commentList) - commentState.index} #</small></font>
					<span style="border-bottom:1px solid #eee;"><small><strong>${comment.visitorName}</strong></small> / <small>${comment.visitorIP}</small> / <small> <fmt:formatDate value="${comment.commentDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></small></span>
					<p style="margin: 5px;"><font size="4">${comment.content}</font></p>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>


<div style="margin-top: 60px;" class="wow bounceInUp" data-wow-duration="2s">
	<h1  class="title" ><strong>添加评论</strong></h1>
	<div style="margin-top: 10px;">
		<form class="comment-form form-inline" action="comment?action=save" method="post" >
			<div class="input-group input-group-sm" style="padding-bottom: 3px;width: 100%;">
				 <div  class="input-group-addon">YourName<small>&nbsp;&nbsp;(Optional)</small></div>
				 <input type="text" class="form-control" placeholder="Yourname" aria-describedby="sizing-addon3" maxlength="20" id="visitorName" name="visitorName"/>
				  <div class="input-group-addon">YourEmail<small>&nbsp;&nbsp;(Required)</small></div>
				 <input type="email" class="form-control" placeholder="YourEmail" aria-describedby="sizing-addon3" id="visitorEmail" name="visitorEmail"/>
			</div>
			<div class="form-group" style="width: 100%;">
				<textarea class="form-control" style="width: 100%;resize: none;" rows="3" id="content"  name="content" autofocus="autofocus" placeholder="评论内容" autocomplete="off"></textarea>
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
