<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>${pageTitle}</title>
<meta name="keywords" content="个人博客,黑尾个人博客,个人博客模板,黑尾" />
<meta name="description" content="黑尾个人博客，是一个学习、记录、分享平时学习的个人网站。" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >

<link href="${pageContext.request.contextPath}/favicon.ico" rel="SHORTCUT ICON">

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

<script LANGUAGE="javascript">

	loopy()
	function loopy() {
		alert("还在开发中！敬请期待！");
		window.location.href='${pageContext.request.contextPath}/index.html';
	}

</script>

<script>
        function checkpassword(){
	        var pwd="123456";//你和朋友约定的密码，写死的
	        var inpwd=document.getElementById("password").value;//获取输入的代码
	        if(pwd == inpwd){  //判断一下是否一样
	            window.location.href="${pageContext.request.contextPath}/moodist.jsp";
	    	}
	    }
</script>

</head>
<body >
<div id="goTopBtn"></div>
<div id="weixin" class="weixin"><img  src="${pageContext.request.contextPath}/static/images/weixin.jpg" alt="微信二维码"></div>
<div id="sina" ><a title="请联系我的新浪微博" href="http://weibo.com/Hewie8023/profile?rightmod=1&wvr=6&mod=personinfo" target="_blank" /></div>

<div class="container" style="width: 100%;background-color: #fff;">
	<jsp:include page="/foreground/common/head.jsp"></jsp:include>
</div>

<section id="cd-timeline" class="cd-container">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img cd-picture">
		</div>

		<div class="cd-timeline-content">
			<h2>HTML5+CSS3实现的响应式垂直时间轴</h2>
			<p>网页时间轴一般用于展示以时间为主线的事件，如企业网站常见的公司发展历程等。本文将给大家介绍一款基于HTML5和CSS3的漂亮的垂直时间轴，它可以响应页面布局，适用于HTML5开发的PC和移动手机WEB应用。</p>
			<a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a>
			<span class="cd-date">2015-01-06</span>
		</div>
	</div>
	<div class="cd-timeline-block">
		<div class="cd-timeline-img cd-picture">
		</div>

		<div class="cd-timeline-content">
			<h2>jQuery+PHP动态数字展示效果</h2>
			<p>我们在一些应用中需要动态展示数据，比如当前在线人数，当前交易总额，当前汇率等等，前端页面需要实时刷新获取最新数据。本文将结合实例给大家介绍使用jQuery和PHP来实现动态数字展示效果。</p>
			<a href="http://www.helloweba.com/view-blog-284.html" class="cd-read-more" target="_blank">阅读全文</a>
			<span class="cd-date">2014-12-25</span>
		</div>
	</div>
	<div class="cd-timeline-block">
		<div class="cd-timeline-img cd-picture">
		</div>

		<div class="cd-timeline-content">
			<h2>PHP操作Session和Cookie</h2>
			<p>我们跟踪用户信息时需要用到Session和Cookie，比如用户登录验证、记录用户浏览历史，存储购物车数据，限制用户会话有效时间等。今天我们来了解下PHP是如何操作Session和Cookie的。</p>
			<a href="http://www.helloweba.com/view-blog-283.html" class="cd-read-more" target="_blank">阅读全文</a>
			<span class="cd-date">2014-12-20</span>
		</div>
	</div>
	<div class="cd-timeline-block">
		<div class="cd-timeline-img cd-picture">
		</div>

		<div class="cd-timeline-content">
			<h2>jQuery数字加减插件</h2>
			<p>我们在网上购物提交订单时，在网页上一般会有一个选择数量的控件，要求买家选择购买商品的件数，开发者会把该控件做成可以通过点击实现加减等微调操作，当然也可以直接输入数字件数。本文将介绍常见的几种使用spinner数字微调器来实现数字加减的功能的方法。</p>
			<a href="http://www.helloweba.com/view-blog-282.html" class="cd-read-more" target="_blank">阅读全文</a>
			<span class="cd-date">2014-12-14</span>
		</div>
	</div>
	<div class="cd-timeline-block">
		<div class="cd-timeline-img cd-picture">
		</div>

		<div class="cd-timeline-content">
			<h2>收集整理的非常有用的PHP函数</h2>
			<p>项目中经常会需要一些让人头疼的函数，作为开发者应该整理一个自己的函数库，在需要之时复制过来即可。本文作者收集整理数十个PHP项目中常用的函数，保证能正常运行，你只要复制粘贴到你项目中即可。</p>
			<a href="http://www.helloweba.com/view-blog-281.html" class="cd-read-more" target="_blank">阅读全文</a>
			<span class="cd-date">2014-12-05</span>
		</div>
	</div>
</section>
<div class="container" style="width: 100%;background-color: #fff;border-top: #eee 2px solid ;margin-top: 50px;padding-top: 20px;">
	<jsp:include page="/foreground/common/footer.jsp"></jsp:include> 
</div>

<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/goTop.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/wow.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/love.js"></script> 
<script src="${pageContext.request.contextPath}/static/js/silder.js"></script>

</body>
</html>