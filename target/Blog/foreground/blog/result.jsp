<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

${navCode }

<div class="blog-main-left">
	<div class="searchresultjieguo shadow">
		<h3  class="title"><strong>搜索&nbsp;<font color="red">${q }</font>&nbsp;的结果&nbsp;</strong><small>(总共搜索到&nbsp;<font color="red">${resultTotal }</font>&nbsp;条记录)</small></h3>
	</div>

<c:choose>
	<c:when test="${blogList.size()==0 }">
		<div class="wow bounceInUp" data-wow-duration="2s">
	 		<div align="center" style="padding-top: 20px;">未查询到结果，换个关键字试试！</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="blog" items="${blogList }">
			<div class="searchresult shadow" data-wow-duration="2s">
			  	<h3 class="searchtitle"><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html" >${blog.title}</a></h3>
			  	<p class="searchsummary">摘要:${blog.content }...</p>
			  	<span class="searchlink"><a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId }.html">http://www.rxwcv.com/blog/articles/${blog.blogId }.html</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="float: right;color: black;">发布日期：${blog.releaseDateStr }</span></span>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>


${pageCode }
</div>
