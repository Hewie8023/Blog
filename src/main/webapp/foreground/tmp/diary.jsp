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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/diary.css">

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

function logout(){
	window.location.href="${pageContext.request.contextPath}/blogger/logout.do";
}
</script>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","tieba","sqq","douban"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","tieba","sqq","douban"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
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




<title>${pageTitle }</title>

</head>
<body>
<div id="goTopBtn"></div>
<div id="weixin" class="weixin"><img  src="${pageContext.request.contextPath}/static/images/weixin.jpg" alt="微信二维码"></div>
<div id="sina" ><a title="请联系我的新浪微博" href="http://weibo.com/Hewie8023/profile?rightmod=1&wvr=6&mod=personinfo" target="_blank" /></div>


<div class="container" style="width: 100%;background-color: #fff;">
	<jsp:include page="/foreground/common/head.jsp"></jsp:include>
</div>
<div class="banner" style="background: url(${pageContext.request.contextPath}/static/images/banner_top.jpg) top center;">
	<a href="javascript:logout()"  class="btn tm-light-blue-bordered-btn tm-news-link" style="float: right;margin-left: -140px">安全退出</a>
	<section class="box">
	    <ul class="texts">
	      <p>每日一语————</p>
	      <p>${dailyWord.dailyWordC }</p>
	      <p>${dailyWord.dailyWordE }</p>
	    </ul>
	    <div class="avatar" style="background: url(${pageContext.request.contextPath}/static/userImages/${currentBlogger.imageName})"><a href="${pageContext.request.contextPath}/blogger/aboutMe.html"><span>${currentBlogger.nickName}</span></a> </div>
	 </section>
</div>
<div class="container" style="width: 75%;background-color: #fff; ">
	<jsp:include page="${mainPage }"/>
</div>

<div class="container" style="width: 100%;background-color: #fff;border-top: #eee 2px solid ;margin-top: 50px;padding-top: 20px;">
	<jsp:include page="/foreground/common/footer.jsp"></jsp:include> 
</div>

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