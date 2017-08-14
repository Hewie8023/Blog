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

<script type="text/javascript">
window.onload=function()
{
	 window.scrollTo(0,0);//滚动到顶部
	 //window.scrollTo(0,document.body.scrollHeight);//滚动到页面底部
} 

function checkData(){
	var q=document.getElementById("q").value.trim();
	if(q==null || q==""){
		alert("请输入您要查询的关键字！");
		return false;
	}else{
		return true;
	}
}
</script>
<style>a:hover, a:focus,.post-like.actived,.excerpt h2 a:hover,.user-welcome strong,.article-title a:hover,#comments b,.text-muted a:hover,.relates a:hover,.archives .item:hover h3,.linkcat h2,.sticky a:hover,.article-content a:hover,.nav li.current-menu-item > a, .nav li.current-menu-parent > a, .nav li.current_page_item > a, .nav li.current-posa{color:#0d6cbf;}.logo a,.article-tags a,.search-form .btn,.widget_tags_inner a:hover:hover,.focusmo a:hover h4,.tagslist .tagname:hover,.pagination ul > li.next-page > a{background-color:#0d6cbf;}.label-important,.badge-important{background-color:#0d6cbf;}.label-important .label-arrow,.badge-important .label-arrow{border-left-color:#0d6cbf;}.title strong{border-bottom-color:#0d6cbf;}#submit{background: #0d6cbf;border-right: 2px solid #0d6cbf;border-bottom: 2px solid #0d6cbf;}</style><style type="text/css" id="syntaxhighlighteranchor"></style>

  
<style>
#goTopBtn {
	position: fixed;
	line-height:48px;
	bottom:169px;
	right:50px;
	height:48px;
	width:50px;
	cursor:pointer;
	margin-right:20px;
	display:none;
	background:url(${pageContext.request.contextPath}/static/images/topp.png) no-repeat;
}
#goTopBtn:hover {
display:none;
	background:url(${pageContext.request.contextPath}/static/images/toph.png) no-repeat;
}
#weixin{
	position: fixed;
	line-height:48px;
	bottom:120px;
	right:3px;
	height:48px;
	width:50px;
	cursor:pointer;
	display:block;
	background:url(${pageContext.request.contextPath}/static/images/weixin.png) no-repeat;
}
#weixin:hover{
	background:url(${pageContext.request.contextPath}/static/images/weixinh.png) no-repeat;
}

#sina a{
	position: fixed;
	line-height:48px;
	bottom:70px;
	right:3px;
	height:48px;
	width:50px;
	cursor:pointer;
	padding:5px;
	display:block;
	background:url(${pageContext.request.contextPath}/static/images/sina.png) no-repeat;
}
#sina a:hover{
	background:url(${pageContext.request.contextPath}/static/images/sinah.png) no-repeat;
}
</style>




<title>${pageTitle} - Powered by Hewie</title>

</head>
<body>
<div id="goTopBtn"></div>
<div id="weixin" class="weixin"><img  src="${pageContext.request.contextPath}/static/images/weixin.jpg" alt="微信二维码"></div>
<div id="sina" ><a title="请联系我的新浪微博" href="http://weibo.com/Hewie8023/profile?rightmod=1&wvr=6&mod=personinfo" target="_blank" /></div>


<div class="container" style="width: 100%;background-color: #fff;">
	<jsp:include page="/foreground/common/head.jsp"></jsp:include>
</div>
<div class="banner" style="background: url(${pageContext.request.contextPath}/static/images/banner_top.jpg) top center;">
	<section class="box">
	    <ul class="texts">
	      <p>每日一语————</p>
	      <p>${dailyWord.dailyWordC }</p>
	      <p>${dailyWord.dailyWordE }</p>
	    </ul>
	    <div class="avatar" style="background: url(${pageContext.request.contextPath}/static/userImages/${blogger.imageName})"><a href="${pageContext.request.contextPath}/blogger/aboutMe.html"><span>${blogger.nickName}</span></a> </div>
	 </section>
</div>
<div class="container" style="width: 75%;background-color: #fff; ">
	<div class="row" style="padding-top: 20px;">
		<div class="col-md-9">
			<jsp:include page="${mainPage }"/>
		</div>
		<div class="col-md-3" >
			
			<h1 class="title"><strong>天气情况</strong></h1>
			<iframe style="padding-top: 10px;" name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12" width="200" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>

			<h1 class="title"><strong>站内搜索</strong></h1>
			<div class="widget widget_searchbox">
				<form method="post" class="search-form" action="${pageContext.request.contextPath}/blog/q.html"  onsubmit="return checkData()">
					<input class="form-control" id="q" name="q" type="text" value="${q }" placeholder="输入关键字" autofocus="" x-webkit-speech="">
					<input class="btn" style="background-color:#ED6D5A;" type="submit" value="搜索">
				</form>
			</div>
			
			<h1 class="title"><strong>文章分类</strong></h1>
			<div class="widget widget_tags">
				<ul class="widget_tags_inner1" style="padding-top: 10px;">
					<c:forEach var= "blogTypeCount" items="${blogTypeCountList }">
						<li><a href="${pageContext.request.contextPath}/index.html?typeId=${blogTypeCount.blogTypeId}">${blogTypeCount.typeName }<em class="hotSoSo" style="margin-left: 18px;">${blogTypeCount.blogCount }</em></a></li>
					</c:forEach>
				</ul>
			</div>
			
			<h1 class="title"><strong>时间归档</strong></h1>
			<div class="widget widget_tags">
				<ul class="widget_tags_inner1" style="padding-top: 10px;">
					<c:forEach var="blogCount" items="${blogCountList }">
						<li><a  href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blogCount.releaseDateStr}">${blogCount.releaseDateStr }<em class="hotSoSo" style="margin-left: 18px;">${blogCount.blogCount }</em></a></li>
					</c:forEach>
				</ul>
			</div>
			
			<h1 class="title"><strong>文章推荐</strong></h1>
			<div class="widget">
				<ul class="tuijian" style="padding-top: 10px;">	
					<c:forEach var="hotBlog" items="${hotBlogList }" varStatus="blogStatus">
						<c:if test="${blogStatus.index==0 }"><li><em class="hotone">1</em><a href="${pageContext.request.contextPath}/blog//articles/${hotBlog.blogId}.html">${hotBlog.title }</a></li></c:if>
						<c:if test="${blogStatus.index==1 }"><li><em class="hottwo">2</em><a href="${pageContext.request.contextPath}/blog//articles/${hotBlog.blogId}.html">${hotBlog.title }</a></li></c:if>
						<c:if test="${blogStatus.index==2 }"><li><em class="hotthree">3</em><a href="${pageContext.request.contextPath}/blog//articles/${hotBlog.blogId}.html">${hotBlog.title }</a></li></c:if>
						<c:if test="${blogStatus.index==3 }"><li><em class="hotSoSo">4</em><a href="${pageContext.request.contextPath}/blog//articles/${hotBlog.blogId}.html">${hotBlog.title }</a></li></c:if>
						<c:if test="${blogStatus.index==4 }"><li><em class="hotSoSo">5</em><a href="${pageContext.request.contextPath}/blog//articles/${hotBlog.blogId}.html">${hotBlog.title }</a></li></c:if>
					</c:forEach>
				</ul>
			</div>
			<!-- 
			<h1 class="title"><strong>热门标签</strong></h1>
			<div class="widget widget_tags">
				<ul class="widget_tags_inner" style="padding-top: 10px;">
					<li><a title="106个话题" href="#">JavaScript</a></li>
					<li><a title="86个话题" href="http://www.yyyweb.com/tag/jquery">EhCache缓存框架</a></li>
					<li><a title="66个话题" href="http://www.yyyweb.com/tag/css3">CSS3</a></li>
					<li><a title="63个话题" href="http://www.yyyweb.com/tag/html5">HTML5</a></li>
					<li><a title="62个话题" href="http://www.yyyweb.com/tag/%e7%bd%91%e9%a1%b5%e8%ae%be%e8%ae%a1">网页设计</a></li>
					<li><a title="48个话题" href="http://www.yyyweb.com/tag/web">Web</a></li>
					<li><a title="42个话题" href="http://www.yyyweb.com/tag/css">CSS</a></li>
					<li><a title="35个话题" href="http://www.yyyweb.com/tag/%e9%85%b7%e7%ab%99%e6%ac%a3%e8%b5%8f">酷站欣赏</a></li>
					<li><a title="22个话题" href="http://www.yyyweb.com/tag/svg">SVG</a></li>
					<li><a title="19个话题" href="http://www.yyyweb.com/tag/canvas">Canvas</a></li>
					<li><a title="18个话题" href="http://www.yyyweb.com/tag/%e5%8a%a8%e7%94%bb">动画</a></li>
					<li><a title="16个话题" href="http://www.yyyweb.com/tag/psd">PSD</a></li>
					<li><a title="15个话题" href="http://www.yyyweb.com/tag/html">HTML</a></li>
					<li><a title="14个话题" href="http://www.yyyweb.com/tag/wordpress">WordPress</a></li>
					<li><a title="13个话题" href="http://www.yyyweb.com/tag/node-js">Node.js</a></li>
					<li><a title="12个话题" href="http://www.yyyweb.com/tag/%e5%9b%be%e6%a0%87">图标</a></li>
					<li><a title="11个话题" href="http://www.yyyweb.com/tag/%e5%93%8d%e5%ba%94%e5%bc%8f">响应式</a></li>
					<li><a title="10个话题" href="http://www.yyyweb.com/tag/%e8%8b%b1%e6%96%87%e5%ad%97%e4%bd%93">英文字体</a></li>
					<li><a title="10个话题" href="http://www.yyyweb.com/tag/bootstrap">Bootstrap</a></li>
					<li><a title="9个话题" href="http://www.yyyweb.com/tag/%e7%bd%91%e7%ab%99%e6%a8%a1%e6%9d%bf">网站模板</a></li>
					<li><a title="9个话题" href="http://www.yyyweb.com/tag/%e6%91%84%e5%bd%b1%e6%ac%a3%e8%b5%8f">摄影欣赏</a></li>
					<li><a title="9个话题" href="http://www.yyyweb.com/tag/%e5%ad%97%e4%bd%93">字体</a></li>
					<li><a title="8个话题" href="http://www.yyyweb.com/tag/photoshop">Photoshop</a></li>
					<li><a title="8个话题" href="http://www.yyyweb.com/tag/vue">Vue</a></li>
				</ul>
			</div>
 				-->
			<h1 class="title"><strong>友情链接</strong></h1>
			<div class="widget">
				<ul class="yqlj" style="padding-top: 10px;">
					<c:forEach var="link" items="${linkList }">
						<li><a href="${link.linkUrl }" target="_blank">${link.linkName }</a></li>
					</c:forEach>
				</ul>
			</div>  
			
			
		</div>
	</div>

</div>

<div class="container" style="width: 100%;background-color: #fff;border-top: #eee 2px solid ;margin-top: 50px;padding-top: 20px;">
	<jsp:include page="/foreground/common/footer.jsp"></jsp:include> 
</div>

<!-- <footer>
		Copyright © 2017 Hewie 版权所有
</footer>   -->

<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/goTop.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/wow.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/love.js"></script> 


<script src="http://cdn.dowebok.com/131/js/wow.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
</script>

</body>
</html>