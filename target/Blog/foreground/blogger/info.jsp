<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


	<div class="row" style="padding-top: 20px;">
		<div class="col-md-9">
			${blogger.profile}
		</div>
		<div class="col-md-3">
			<div class="image"><img  src="${pageContext.request.contextPath}/static/userImages/${blogger.imageName}"/></div>
			<div style=" clear:both;"><h5 style="font-size:22px; font-family: 'Architects Daughter', cursive; margin-bottom:20px">网名：${blogger.nickName}</h5></div>
			<div style=" clear:both;"><h5 style="font-size:22px; font-family: 'Architects Daughter', cursive; margin-bottom:20px">个人宣言：${blogger.sign}</h5></div>
		</div>
	</div>
