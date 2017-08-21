<script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
    //SyntaxHighlighter.all();
    
    
    function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

${navCode }

 <div class="blog-main-left">
	<!-- 文章内容（使用Kingeditor富文本编辑器发表的） -->
	<div class="article-detail shadow">
	    <div class="article-detail-title">
	       <a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId }.html" data-toggle="tooltip" data-placement="top" title="${blog.title } — Hewie个人博客"> ${blog.title }</a>
	    </div>
	    <div class="article-detail-info">
	        <span>编辑时间：<fmt:formatDate value="${blog.releaseDate }"   pattern="yyyy/MM/dd HH:mm:ss" type="date" dateStyle="long" /></span>
	        <span>作者：${blog.author }</span>
	        <span>浏览量：${blog.clickHit }</span>
	    </div>
	    <div class="article-detail-content">
	    ${blog.content }
	    <br /> 
	     <div>
	     <!-- Tags： -->
	     <c:choose >
			<c:when test="${keyWords==null }">
				<!--无-->
			</c:when>
			<c:otherwise>
					<c:forEach var="keyWord" items="${keyWords}">
						<a href="${pageContext.request.contextPath}/blog/q.html?q=${keyWord}" target="_blank" class="keyword" data-toggle="tooltip" data-placement="bottom" title="查看有关--${keyWord}--的文章"><i class="fa fa-tag"></i>&nbsp;${keyWord}</a>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	     </div>       
	      <br /> 	    	
	    		<div style="text-align: center;">
	            <span class="line_m">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	            <span class="theend">The End</span>
	            <span class="line_m">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	            </div>
	     <br />
	     <br />
	    <div class="articlecomefrom" >
	         <p style="font-size: 14px;"><strong>版权声明：</strong>本站原创文章</p>
	         <p style="font-size: 14px;"><strong>转载请注明：</strong><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId }.html" data-toggle="tooltip" data-placement="bottom" title="${blog.title } — Hewie个人博客">${blog.title } — Hewie个人博客</a></p>
	     </div>
	    <br />
	    </div>
	    <div style="margin-top: -20px;">
			<nav aria-label="...">
				<ul class="pager">
					${pageCode }
				</ul>
			</nav>
		</div>
	</div>
	
	<!-- 分页 -->
	 
	
	 <!-- 评论区域 -->
     <div class="blog-module shadow" style="box-shadow: 0 1px 8px #a6a6a6; padding-bottom: 70px;">
     <div class="blog-module-title">来说两句吧</div>
          <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
               <div class="layui-field-box">
                   <form class="layui-form blog-editor layui-form-pane" action="">
                   		<!-- <div class="layui-form-item" style="width: 100%;">
 					    	<label class="layui-form-label" style="width: 10%;">QQ</label>
					 	    <div class="layui-input-inline" style="width: 40%;">
						 	   <input type="text" name="qqNumber" id="qqNumber" lay-verify="qqNumber" placeholder="输入qq可以快速填写信息" autocomplete="off" class="layui-input">
						    </div>
						</div>-->
						
                    	<div class="layui-form-item" style="width: 100%;">
 					    	<label class="layui-form-label" style="width: 10%;">昵称*</label>
					 	    <div class="layui-input-inline" style="width: 40%;">
						 	   <input type="text" name="visitorName" id="visitorName" lay-verify="visitorName" placeholder="昵称" autocomplete="off" class="layui-input">
						    </div>
						</div> 
						<div class="layui-form-item" style="width: 100%;">
						 	<label class="layui-form-label" style="width: 10%;">邮箱*</label>
						  	<div class="layui-input-inline" style="width: 40%;">
						     	 <input type="text" name="visitorEmail" id="visitorEmail" lay-verify="email" placeholder="邮箱" autocomplete="off" class="layui-input">
						    </div>
						</div>
						<div class="layui-form-item" style="width: 100%;">
						 	<label class="layui-form-label" style="width: 10%;">网址</label>
						  	<div class="layui-input-inline" style="width: 40%;">
						     	 <input type="text" name="website" id="website" lay-verify="website" placeholder="网址" autocomplete="off" class="layui-input">
						    </div>
						</div>
                        <div class="layui-form-item layui-form-text">
                           	<div class="layui-input-block">
                           		<input type="hidden" id="blogId" name="blog.blogId" value="${blog.blogId }"/>
                           		<textarea name="content" lay-verify="content" id="remarkEditor" placeholder="评论内容" class="layui-textarea layui-hide"></textarea>
							</div>
                       </div>
                       <div class="layui-form-item">
                       	    <button class="layui-btn layui-btn-danger" lay-submit="formRemark" lay-filter="formRemark" >提交评论</button> 
                       </div>
                   </form>
               </div>
           </fieldset>
                         
		
         <div class="blog-module-title">最新评论</div>
	         <ul class="blog-comment">
	         	<c:forEach var="comment" items="${commentList }">
	         		<li>
		                 <div class="comment-parent">
		                    <img src="${pageContext.request.contextPath}/static/images/${comment.visitorImage}" alt="absolutely" />
		                     <div class="info">
		                         <span class="username">${comment.visitorName }</span>
		                         <span class="time"><fmt:formatDate value="${comment.commentDate }"   pattern="yyyy/MM/dd HH:mm:ss" type="date" dateStyle="long" /></span>
		                     </div>
		                     <div class="content">
		                        		 ${comment.content }
		                     </div>
		                 </div>
	             	</li>
	         	</c:forEach>
	             
	         </ul>
		</div>
</div>
		
<!-- 
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
 -->
 
