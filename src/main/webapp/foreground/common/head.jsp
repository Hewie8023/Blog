<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function checkLogin(){
		var currentBlogger = "<%=session.getAttribute("currentBlogger")%>";
		if(currentBlogger!=null){
			window.location.href="${pageContext.request.contextPath}/diary/list.html";
		}else{
			window.location.href="${pageContext.request.contextPath}/lo_gin.jsp";
		}
	}
</script>

	<div class="row">
		<div class="col-md-12">
			<header>
			 	<div id="logo"><a href="${pageContext.request.contextPath}/index.html" title="HewieBlog首页" style="background: url(${pageContext.request.contextPath}/static/images/logo.png);"></a></div>
				 <nav class="topnav" id="topnav"><a href="${pageContext.request.contextPath}/index.html"><span>首页</span><span class="en">Portal</span></a><!-- <a href="${pageContext.request.contextPath}/moodist.jsp"><span>碎语</span><span class="en">Words</span></a> --><a href="#" onclick="checkLogin()"><span>日记</span><span class="en">Diary</span></a><a href="${pageContext.request.contextPath}/photo/list.html"><span>美图</span><span class="en">Photo</span></a><a href="${pageContext.request.contextPath}/msg/list.html"><span>留言</span><span class="en">Message</span></a></nav>
			</header>
		</div>
	</div>    
