<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="bloglist left">

	<h1  class="title"><strong><a href="${pageContext.request.contextPath}/index.html" >最新博客</a></strong></h1>

	<c:forEach var="blog" items="${blogList }">
		<div class="wow bounceInUp" data-wow-duration="2s">
			<div class="zhaiyao" >
		   		<c:if test="${not empty blog.imageList }">
					<c:forEach var="image" items="${blog.imageList }">
						<figure><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html">${image}</a></figure>
					</c:forEach>		   		
		   		</c:if>
		   		<c:if test="${empty blog.imageList }">
						<figure><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html"><img src="${pageContext.request.contextPath}/static/userImages/aaa.jpg"/></a></figure>
		   		</c:if>
		   		<h3 class="blogtitle"><strong><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html" >${blog.title}</a></strong></h3>
		   		 <ul>
		      		<p>${blog.summary}...</p>
		     	    <a title="${blog.title}" href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html"  target="_blank" class="readmore">Read More &rarr;</a>
		    	 </ul>
		  		 <p class="dateview" style="background: #f6f6f6 url(${pageContext.request.contextPath}/static/images/time.jpg) 15px center no-repeat;"><span><fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span><span>作者：${blog.author }</span><span>个人博客：「<a href="${pageContext.request.contextPath}/index.html?typeId=${blog.blogType.blogTypeId}">${blog.blogType.typeName }</a>」</span><span>阅读(${blog.clickHit})</span><span>评论(${blog.replyHit})</span></p>
			</div>
	   	</div>
	</c:forEach>
	<div style="float: right;margin-bottom: 30px;padding-bottom: 30px;">
		<nav>
			<ul class="pagination pagination-sm">
				${pageCode }
			</ul>
		</nav>
	</div>
</div>


