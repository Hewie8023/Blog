<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="photoshow wow bounceInUp" data-wow-duration="2s">
	<h3 class="phototitle"><strong>${photo.nickName}</strong></h3>
	<div class="photo">
		<a href="${pageContext.request.contextPath}/static/photo/${photo.imageName}" title="${photo.profile}" style="width: 100%;"><img src="${pageContext.request.contextPath}/static/photo/${photo.imageName}"></a>
	</div> 
	<p class="diaryview" ><span><img style="margin-bottom: 2px;" src="${pageContext.request.contextPath}/static/images/time.png"/>&nbsp;&nbsp;<fmt:formatDate value="${photo.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>&nbsp;&nbsp;&nbsp;&nbsp;<span>作者：${photo.author }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>点击量：${photo.clickHit }</span></p>
</div>
<div style="margin-top: -20px;">
	<nav aria-label="...">
		<ul class="pager">
			${pageCode }
		</ul>
	</nav>
</div>



