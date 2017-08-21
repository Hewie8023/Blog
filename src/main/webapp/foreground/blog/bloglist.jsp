 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

${navCode }

<div class="blog-main-left">
<c:forEach var="blog" items="${blogList }">
    <div class="article shadow">
        <div class="article-left">
        	<c:if test="${not empty blog.imageList }">
				<c:forEach var="image" items="${blog.imageList }">
					${image }
				</c:forEach>		   		
	   		</c:if>
	   		<c:if test="${empty blog.imageList }">
	   				<img src="${pageContext.request.contextPath}/static/images/aaa.jpg" alt="${blog.title }" />
	   		</c:if>
            
        </div>
        <div class="article-right">
            <div class="article-title">
                <a href="${pageContext.request.contextPath}/blog/articles/${blog.blogId}.html" data-toggle="tooltip" data-placement="top"  title="${blog.title }">${blog.title }</a>
            </div>
            <div class="article-abstract">
            	<p>${blog.summary }</p>
            </div>
        </div>
        <div class="clear"></div>
        <div class="article-footer">
            <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<fmt:formatDate value="${blog.releaseDate }"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
            <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;${blog.author }</span>
            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/blog/list.html?typeId=${blog.blogType.blogTypeId}" data-toggle="tooltip" data-placement="top" title="${blog.blogType.typeName }" >${blog.blogType.typeName }</a></span>
            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;${blog.clickHit}</span>
            <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;${blog.replyHit }</span>
        </div>
    </div>
   </c:forEach>
	<div style="float: right;margin-bottom: 30px;padding-bottom: 30px;">
		<nav >
			<ul class="pagination pagination-sm">
				${pageCode }
			</ul>
		</nav>
	</div>
</div>


