<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row row-bottom-padded-md">
	<c:forEach var="photo" items="${photoList }">
		<div class="col-md-3 col-sm-6 col-padding" >
			<a href="${pageContext.request.contextPath}/photo/images/${photo.id }.html"  class="work" style="background-image: url(${pageContext.request.contextPath}/static/photo/${photo.imageName });">
				<div class="desc" style="text-decoration: none;">
					<h2>${photo.nickName }</h2>
					<span>${photo.profile }</span>
				</div>
			</a>
		</div>
	</c:forEach>
	<div style="float: right;padding-bottom: 50px;">
		<nav>
			<ul class="pagination pagination-sm">
				${pageCode }
			</ul>
		</nav>
	</div>
</div>

