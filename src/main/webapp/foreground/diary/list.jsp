<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

${navCode }

<div class="blog-main-left" style="width: 100%">
<c:forEach var="diary" items="${diaryList }" varStatus="diaryStatus">
    <div class="article shadow" style="width:49%;float:  left;height: 150px;">
    	<div class="clear"></div>
        <div class="article-left">
        	<c:if test="${not empty diary.imageList }">
				<c:forEach var="image" items="${diary.imageList }">
					${image }
				</c:forEach>		   		
	   		</c:if>
	   		<c:if test="${empty diary.imageList }">
	   				<img src="${pageContext.request.contextPath}/static/userImages/aaa.png" alt="${diary.title }" />
	   		</c:if>
            
        </div>
        <div class="article-right" style="width:63%;">
            <div class="article-title">
                <a href="${pageContext.request.contextPath}/diary/articles/${diary.id}.html">${diary.title }</a>
            </div>
            <div class="article-abstract">
            	<p>${diary.summary }</p>
            </div>
        </div>
        <div class="clear"></div>
        <div class="article-footer" style="margin-bottom: 15px;">
            <span style="float: right;"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<fmt:formatDate value="${diary.releaseDate }"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
            <span class="article-author" style="float: right;"><i class="fa fa-user"></i>&nbsp;&nbsp;${diary.author }</span>
        </div>
    </div>
    <c:if test="${diaryStatus.count%2!=0 }"><span style="width:2%;float:  left;height: 150px;"></span></c:if>
   </c:forEach>
   <div class="clear"></div>
	<div style="float: right;margin-bottom: 30px;padding-bottom: 30px;">
		<nav >
			<ul class="pagination pagination-sm">
				${pageCode }
			</ul>
		</nav>
	</div>
</div>



