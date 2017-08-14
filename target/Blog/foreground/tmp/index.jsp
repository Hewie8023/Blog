<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.css">

<link href="${pageContext.request.contextPath}/favicon.ico" rel="SHORTCUT ICON">


<style>a:hover, a:focus,.post-like.actived,.excerpt h2 a:hover,.user-welcome strong,.article-title a:hover,#comments b,.text-muted a:hover,.relates a:hover,.archives .item:hover h3,.linkcat h2,.sticky a:hover,.article-content a:hover,.nav li.current-menu-item > a, .nav li.current-menu-parent > a, .nav li.current_page_item > a, .nav li.current-posa{color:#0d6cbf;}.logo a,.article-tags a,.search-form .btn,.widget_tags_inner a:hover:hover,.focusmo a:hover h4,.tagslist .tagname:hover,.pagination ul > li.next-page > a{background-color:#0d6cbf;}.label-important,.badge-important{background-color:#0d6cbf;}.label-important .label-arrow,.badge-important .label-arrow{border-left-color:#0d6cbf;}.title strong{border-bottom-color:#0d6cbf;}#submit{background: #0d6cbf;border-right: 2px solid #0d6cbf;border-bottom: 2px solid #0d6cbf;}</style><style type="text/css" id="syntaxhighlighteranchor"></style>

<style>
#goTopBtn {
position: fixed;
line-height:36px;
width:34px;
bottom:35px;
height:36px;
cursor:pointer;
display:none;
background:url(${pageContext.request.contextPath}/static/images/top.gif);}
</style>

<style>
.dowebok { margin: 0 auto;}
.dowebok ul { list-style-type: none;}
.dowebok .row { font-size: 0; text-align: center;}
.dowebok .wow { display: inline-block; width: 280px; height: 280px; margin: 30px 15px 0; border-radius: 50%; font: 30px/280px "Microsoft Yahei"; vertical-align: top; *display: inline; zoom: 1;}
.bg-green { background: #5bd5a0;}
.bg-blue { background: #1daee9;}
.bg-purple { background: #c843a5;}
.bg-red { background: #eb3980;}
.bg-yellow { background: #ffcc35;}
</style>


<title>HewieBlog - 一个程序员</title>

</head>
<body>
<div id="goTopBtn"></div>


<div class="container" style="width: 100%;background-color: #fff;">
	<jsp:include page="/foreground/common/head.jsp"></jsp:include>
</div>
<div class="banner" style="background: url(${pageContext.request.contextPath}/static/images/banner_top.jpg) top center;">
	<section class="box">
	    <ul class="texts">
	      <p>每日一语————</p>
	      <p>却再也找不回那时的自己</p>
	      <p>红尘一梦，不再追寻</p>
	    </ul>
	    <div class="avatar" style="background: url(${pageContext.request.contextPath}/static/userImages/${blogger.imageName})"><a href="#"><span>${blogger.nickName}</span></a> </div>
	 </section>
</div>
<div class="container" style="width: 75%;background-color: #fff;">
	<div class="row" style="padding-top: 20px;">
		<div class="col-md-9">
			<jsp:include page="${mainPage}"></jsp:include>
			
		</div>
		<div class="col-md-3" >
			
			<jsp:include page="/foreground/common/right.jsp"></jsp:include>
			
		</div>
	</div>

</div>

<jsp:include page="/foreground/common/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/goTop.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/wow.min.js"></script> 
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
</script>

</body>
</html>