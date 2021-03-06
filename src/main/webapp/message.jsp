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
    <meta name="Description" content="留言 - Hewie个人原创独立博客网站,记录博主学习和成长之路。关注计算机视觉技术和OpenCV的学习研究。">
    <title>${pageTitle}</title>
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
	    function loadimage(){
			document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
		}
	    
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
				<a href="${pageContext.request.contextPath}/index.html" data-toggle="tooltip" data-placement="bottom" title="Hewie个人博客" style="background: url(${pageContext.request.contextPath}/static/images/logo.png) no-repeat;"></a>
			</div>
           
			<ul class="layui-nav">
				<li>
					<a href="${pageContext.request.contextPath}/index.html" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="首页">Home</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/blog/list.html" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="博客">Blog</a>
				</li>
				<li>
					<a href="#" onclick="checkLogin()" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="日记">Diary</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/album.html" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="照片">Album</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/gossip/list.html" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="低语">Gossip</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/message.html" onfocus="this.blur();" data-toggle="tooltip" data-placement="bottom" title="留言">Message</a>
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
                <a href="${pageContext.request.contextPath}/index.html" data-toggle="tooltip" data-placement="bottom" title="网站首页">网站首页</a>
                <a><cite>&nbsp;>&nbsp;留言墙</cite></a>
            </blockquote>
            <div class="blog-main">
                <div class="layui-tab layui-tab-brief shadow" lay-filter="tabAbout">
                     <div class="aboutinfo">
                         <div class="aboutinfo-figure">
                             <img src="${pageContext.request.contextPath}/static/images/messagewall.png" alt="留言墙" />
                         </div>
                         <p class="aboutinfo-nickname">留言墙</p>
                         <p class="aboutinfo-introduce">本页面可留言、吐槽、提问。欢迎灌水，杜绝广告！</p>
                         <p class="aboutinfo-location">
                             <i class="fa fa-clock-o"></i>&nbsp;<span id="time"></span>
                         </p>
                         <hr />
                         <div class="aboutinfo-contact">
                             <p style="font-size:2em;">沟通交流，拉近你我！</p>
                         </div>
                         <fieldset class="layui-elem-field layui-field-title">
                             <legend>Leave a message</legend>
                             <div class="layui-field-box">
                                 <div class="leavemessage" style="text-align:initial">
                                     <form class="layui-form blog-editor" action="">
                                     	<div class="layui-form-item" style="width: 100%;">
				 					    	<label class="layui-form-label" style="width: 10%;">用户名</label>
									 	    <div class="layui-input-inline" style="width: 38%;">
										 	   <input type="text" name="msgName" id="msgName" lay-verify="msgName" placeholder="用户名" autocomplete="off" class="layui-input">
										    </div>
										 	<label class="layui-form-label" style="width: 10%;">邮箱</label>
										  	<div class="layui-input-inline" style="width: 39%;">
										     	 <input type="text" name="msgEmail" id="msgEmail" lay-verify="email" placeholder="邮箱" autocomplete="off" class="layui-input">
										    </div>
										</div>
                                         <div class="layui-form-item">
                                             <textarea name="msgContent" lay-verify="content" id="remarkEditor" placeholder="请输入留言内容" class="layui-textarea layui-hide"></textarea>
                                         </div>
                                         <div class="layui-form-item">
                                             <button class="layui-btn layui-btn-danger" lay-submit="formLeaveMessage" lay-filter="formLeaveMessage" style="width: 10%;float: left;">提交留言</button>
                                             <input type="text" name="iamgeCode" id="imageCode" lay-verify="imageCode" placeholder="验证码" autocomplete="off" class="layui-input" style="width: 18%;float: left;margin-left: 18px;">
                                             <img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="/image.jsp" width="60" height="20" border="1" align="absmiddle" style="width: 8%;margin-left: 8px;margin-top: 7px;"> 
                                         </div>
                                     </form>
                                     <ul class="blog-comment">
                                     	<c:forEach var="msg" items="${msglist }">
                                         <li>
                                             <div class="comment-parent">
                                                 <img src="${pageContext.request.contextPath}/static/images/${msg.msgImage}" />
                                                 <div class="info">
                                                     <span class="username">${msg.msgName }</span>
                                                     <span class="time"><fmt:formatDate value="${msg.msgDate }"   pattern="yyyy/MM/dd HH:mm:ss" type="date" dateStyle="long" />
                                                 </div>
                                                  <p class="info info-footer"></span><!-- <a class="btn-reply" href="javascript:;" onclick="btnReplyClick(this)">回复</a> --></p>
                                                 <div class="content">
                                                     	${msg.msgContent }
                                                 </div>
                                             </div>
                                             <hr />
                                             <!--  
                                             <div class="comment-child">
                                                 <img src="../images/Absolutely.jpg" alt="Absolutely" />
                                                 <div class="info">
                                                     <span class="username">Absolutely</span><span>这是用户回复内容</span>
                                                 </div>
                                                 <p class="info"><span class="time">2017-03-18 18:26</span></p>
                                             </div>
                                             <div class="comment-child">
                                                 <img src="../images/Absolutely.jpg" alt="Absolutely" />
                                                 <div class="info">
                                                     <span class="username">Absolutely</span><span>这是第二个用户回复内容</span>
                                                 </div>
                                                 <p class="info"><span class="time">2017-03-18 18:26</span></p>
                                             </div>
                                             -->
                                             <!-- 回复表单默认隐藏 -->
                                             <div class="replycontainer layui-hide">
                                                 <form class="layui-form" action="">
                                                     <div class="layui-form-item">
                                                         <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                                     </div>
                                                     <div class="layui-form-item">
                                                         <button class="layui-btn layui-btn-danger" lay-submit="formReply" lay-filter="formReply" >提交留言</button> 
                                                     </div>
                                                 </form>
                                             </div>
                                         </li>
                                         </c:forEach>
                                     </ul>
                                 </div>
                             </div>
                         </fieldset>
                     </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <footer class="blog-footer">
        <p><span>Copyright</span><span>&copy;</span><span>2017</span><a href="http://www.rxwcv.cn" data-toggle="tooltip" data-placement="top" title="Hewie个人博客" target="_blank" style="text-decoration: none;">Hewie个人博客</a><span>Design By Hewie</span></p>
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
	<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/click.js"></script>
	<script src="${pageContext.request.contextPath}/static/plug/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/fenikso.js"></script> 
</body>
</html>