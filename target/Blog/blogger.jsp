<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="keywords" content="个人博客网站,个人原创网站,计算机视觉,视觉深度学习,OpenCV">
    <meta name="Description" content="博主信息 - Hewie个人原创独立博客网站,记录博主学习和成长之路。关注计算机视觉技术和OpenCV的学习研究。">
    <title>${aboutMeTitle}</title>
    <link href="${pageContext.request.contextPath}/favicon.ico" rel="SHORTCUT ICON">
     <!--Layui-->
    <link href="${pageContext.request.contextPath}/static/plug/layui/css/layui.css" rel="stylesheet" />
    <!-- bootstrap -->
    <link href="${pageContext.request.contextPath}/static/plug/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="${pageContext.request.contextPath}/static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="${pageContext.request.contextPath}/static/css/about.css" rel="stylesheet" />
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
		<script>
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "https://hm.baidu.com/hm.js?833ae418aa62212aa466dff8ab94c8ec";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
	</script>
	
</head>
<body>
    <!-- 导航 -->
    <nav class="blog-nav layui-header">
        <div class="blog-container">
             <!-- HewieBlog -->
    		<div id="logo">
				<a href="${pageContext.request.contextPath}/index.html" title="Hewie个人博客 - powered by Hewie" style="background: url(${pageContext.request.contextPath}/static/images/logo.png) no-repeat;"></a>
			</div>
           
			<ul class="layui-nav">
				<li>
					<a href="${pageContext.request.contextPath}/index.html" onfocus="this.blur();" title="首页">Home</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/blog/list.html" onfocus="this.blur();" title="博客">Blog</a>
				</li>
				<li>
					<a href="#" onclick="checkLogin()" onfocus="this.blur();" title="日记">Diary</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/album.html" onfocus="this.blur();" title="照片">Album</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/gossip/list.html" onfocus="this.blur();" title="低语">Gossip</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/message.html" onfocus="this.blur();" title="留言">Message</a>
				</li>
			</ul>
            <!-- 手机和平板的导航开关 -->
            <a class="blog-navicon" href="javascript:;">
                <i class="fa fa-navicon"></i>
            </a>
        </div>
    </nav>
	<!-- 主体（一般只改变这里的内容） -->
    <div class="blog-body">
        <div class="blog-container">
            <blockquote class="shadow">
                <a href="${pageContext.request.contextPath}/index.html" title="网站首页">网站首页</a>
                <a><cite>&nbsp;>&nbsp;关于博主</cite></a>
            </blockquote>
            <div class="blog-main">
                <div class="layui-tab layui-tab-brief shadow" lay-filter="tabAbout">

                     <div class="aboutinfo">
                         <div class="aboutinfo-figure">
                             <img src="${pageContext.request.contextPath}/static/userImages/${blogger.imageName}" alt="${blogger.nickName}" />
                         </div>
                         <p class="aboutinfo-nickname">${blogger.nickName}</p>
                         <p class="aboutinfo-introduce">${blogger.sign }</p>
                         <p class="aboutinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;${blogger.address }</p>
                         <hr />
                         <div class="aboutinfo-contact">
                            <a target="_blank" title="QQ交流" href="http://sighttp.qq.com/msgrd?v=1&uin=349545547"><i class="fa fa-qq fa-2x"></i></a>
                            <a target="_blank" title="给我写信" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=pJeQnZGQkZGQk_TV1YrHy8k" style="text-decoration:none;"><i class="fa fa-envelope fa-2x"></i></a>
                            <a target="_blank" title="新浪微博" href="http://www.weibo.com/Hewie8023/profile?rightmod=1&wvr=6&mod=personinfo"><i class="fa fa-weibo fa-2x"></i></a>
                            <a target="_blank" title="码云" href="https://git.oschina.net/hewie"><i class="fa fa-git fa-2x"></i></a>
                         </div>
                         <fieldset class="layui-elem-field layui-field-title">
                             <legend>简介</legend>
                             <div class="layui-field-box aboutinfo-abstract abstract-bloger">
                                 <p style="text-align:center;">${blogger.profile }</p>
                                 <h1 style="text-align:center;">The End</h1>
                             </div>
                         </fieldset>
                     </div>

            </div>
        </div>
    </div>
     <!-- 底部 -->
    <footer class="blog-footer">
        <p><span>Copyright</span><span>&copy;</span><span>2017</span><a href="http://www.rxwcv.cn" title="Hewie个人博客" target="_blank" style="text-decoration: none;">Hewie个人博客</a><span>Design By Hewie</span></p>
        <p><a href="http://www.miitbeian.gov.cn/" target="_blank" style="text-decoration: none;">陕ICP备17013165号-1</a></p>
    </footer>
    <!--侧边导航-->
   <ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
        <li class="layui-nav-item layui-this">
            <a href="${pageContext.request.contextPath}/index.html" onfocus="this.blur();" title="首页"><i class="fa fa-home fa-fw"></i>&nbsp;Home</a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/blog/list.html" onfocus="this.blur();" title="博客"><i class="fa fa-file-text fa-fw"></i>&nbsp;Blog</a>
        </li>
        <li class="layui-nav-item">
            <a href="#" onclick="checkLogin()"><i class="fa fa-tags fa-fw"></i>&nbsp;Diary</a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/album.html"><i class="fa fa-road fa-fw"></i>&nbsp;Album</a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/gossip/list.html"><i class="fa fa-info fa-fw"></i>&nbsp;Gossip</a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/message.html"><i class="fa fa-info fa-fw"></i>&nbsp;Message</a>
        </li>
    </ul>
    <!--分享窗体-->
    <div class="blog-share layui-hide">
        <div class="blog-share-body">
            <div style="width: 200px;height:100%;">
                <div class="bdsharebuttonbox">
                    <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                    <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                </div>
            </div>
        </div>
    </div>
     <!--遮罩-->
    <div class="blog-mask animated layui-hide"></div>
    <!-- layui.js -->
    <script src="${pageContext.request.contextPath}/static/plug/layui/layui.js"></script>
    <!-- 全局脚本 -->
    <script src="${pageContext.request.contextPath}/static/js/global.js"></script>
    <!-- 本页脚本 -->
    <script src="${pageContext.request.contextPath}/static/js/about.js"></script>
</body>
</html>