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
    <meta name="Description" content="相册 - Hewie个人原创独立博客网站,记录博主学习和成长之路。关注计算机视觉技术和OpenCV的学习研究。">
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
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/css/reset.css" rel="stylesheet" />
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
				<a href="${pageContext.request.contextPath}/index.html" data-toggle="tooltip" data-placement="bottom" title="Hewie个人博客 " style="background: url(${pageContext.request.contextPath}/static/images/logo.png) no-repeat;"></a>
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
            <div class="blog-main">
            	<blockquote class="shadow" >
	                <a href="${pageContext.request.contextPath}/index.html" data-toggle="tooltip" data-placement="bottom" title="网站首页">网站首页</a>
	                <a><cite>&nbsp;>&nbsp;相册</cite></a>
	            </blockquote>
            	<div class="content">
				  <div class="iw_wrapper">
				    <ul class="iw_thumbs" id="iw_thumbs">
				    	<c:forEach var="photo" items="${photoList }">
					      <li><img src="${pageContext.request.contextPath}/static/photo/${photo.imageName}" data-img="${pageContext.request.contextPath}/static/photo/${photo.imageName}" alt="${photo.nickName}"/>
					        <div>
					          <h2>${photo.nickName }</h2>
					          <p>${photo.profile }</p>
					        </div>
					      </li>
				     	 </c:forEach>
				      </ul>
				      </div>
  					<div id="iw_ribbon" class="iw_ribbon"> <span class="iw_close"></span> <span class="iw_zoom">Click thumb to zoom</span> </div>
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
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/click.js"></script>
	<script src="${pageContext.request.contextPath}/static/plug/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/fenikso.js"></script> 
    <script src="${pageContext.request.contextPath}/static/js/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.masonry.min.js"></script>
	<script type="text/javascript">
			$(window).load(function(){
				var $iw_thumbs			= $('#iw_thumbs'),
					$iw_ribbon			= $('#iw_ribbon'),
					$iw_ribbon_close	= $iw_ribbon.children('span.iw_close'),
					$iw_ribbon_zoom		= $iw_ribbon.children('span.iw_zoom');
					
					ImageWall	= (function() {
							// window width and height
						var w_dim,
						    // index of current image
							current				= -1,
							isRibbonShown		= false,
							isFullMode			= false,
							// ribbon / images animation settings
							ribbonAnim			= {speed : 500, easing : 'easeOutExpo'},
							imgAnim				= {speed : 400, easing : 'jswing'},
							// init function : call masonry, calculate window dimentions, initialize some events
							init				= function() {
								$iw_thumbs.imagesLoaded(function(){
									$iw_thumbs.masonry({
										isAnimated	: true
									});
								});
								getWindowsDim();
								initEventsHandler();
							},
							// calculate window dimentions
							getWindowsDim		= function() {
								w_dim = {
									width	: $(window).width(),
									height	: $(window).height()
								};
							},
							// initialize some events
							initEventsHandler	= function() {
								
								// click on a image
								$iw_thumbs.delegate('li', 'click', function() {
									if($iw_ribbon.is(':animated')) return false;
									
									var $el = $(this);
									
									if($el.data('ribbon')) {
										showFullImage($el);
									}
									else if(!isRibbonShown) {
										isRibbonShown = true;
										
										$el.data('ribbon',true);
										
										// set the current
										current = $el.index();
									
										showRibbon($el);
									}
								});
								
								// click ribbon close
								$iw_ribbon_close.bind('click', closeRibbon);
								
								// on window resize we need to recalculate the window dimentions
								$(window).bind('resize', function() {
											getWindowsDim();
											if($iw_ribbon.is(':animated'))
												return false;
											closeRibbon();
										 })
								         .bind('scroll', function() {
											if($iw_ribbon.is(':animated'))
												return false;
											closeRibbon();
										 });
								
							},
							showRibbon			= function($el) {
								var	$img	= $el.children('img'),
									$descrp	= $img.next();
								
								// fadeOut all the other images
								$iw_thumbs.children('li').not($el).animate({opacity : 0.2}, imgAnim.speed);
								
								// increase the image z-index, and set the height to 100px (default height)
								$img.css('z-index', 100)
									.data('originalHeight',$img.height())
									.stop()
									.animate({
										height 		: '100px'
									}, imgAnim.speed, imgAnim.easing);
								
								// the ribbon will animate from the left or right
								// depending on the position of the image
								var ribbonCssParam 		= {
										top	: $el.offset().top - $(window).scrollTop() - 6 + 'px'
									},
									descriptionCssParam,
									dir;
								
								if( $el.offset().left < (w_dim.width / 2) ) {
									dir = 'left';
									ribbonCssParam.left 	= 0;
									ribbonCssParam.right 	= 'auto';
								}
								else {
									dir = 'right';
									ribbonCssParam.right 	= 0;
									ribbonCssParam.left 	= 'auto';
								}
								
								$iw_ribbon.css(ribbonCssParam)
								          .show()
										  .stop()
										  .animate({width : '100%'}, ribbonAnim.speed, ribbonAnim.easing, function() {
												switch(dir) {
													case 'left' :
														descriptionCssParam		= {
															'left' 			: $img.outerWidth(true) + 'px',
															'text-align' 	: 'left'
														};
														break;
													case 'right' :	
														descriptionCssParam		= {
															'left' 			: '-200px',
															'text-align' 	: 'right'
														};
														break;
												};
												$descrp.css(descriptionCssParam).fadeIn();
												// show close button and zoom
												$iw_ribbon_close.show();
												$iw_ribbon_zoom.show();
										  });
								
							},
							// close the ribbon
							// when in full mode slides in the middle of the page
							// when not slides left
							closeRibbon			= function() {
								isRibbonShown 	= false
								
								$iw_ribbon_close.hide();
								$iw_ribbon_zoom.hide();
								
								if(!isFullMode) {
								
									// current wall image
									var $el	 		= $iw_thumbs.children('li').eq(current);
									
									resetWall($el);
									
									// slide out ribbon
									$iw_ribbon.stop()
											  .animate({width : '0%'}, ribbonAnim.speed, ribbonAnim.easing); 
										  
								}
								else {
									$iw_ribbon.stop().animate({
										opacity		: 0.8,
										height 		: '0px',
										marginTop	: w_dim.height/2 + 'px' // half of window height
										}, ribbonAnim.speed, function() {
										$iw_ribbon.css({
											'width'		: '0%',
											'height'	: '126px',
											'margin-top': '0px'
										}).children('img').remove();
									});
									
									isFullMode	= false;
								}
							},
							resetWall			= function($el) {
								var $img		= $el.children('img'),
									$descrp		= $img.next();
									
								$el.data('ribbon',false);
								
								// reset the image z-index and height
								$img.css('z-index',1).stop().animate({
									height 		: $img.data('originalHeight')
								}, imgAnim.speed,imgAnim.easing);
								
								// fadeOut the description
								$descrp.fadeOut();

								// fadeIn all the other images
								$iw_thumbs.children('li').not($el).animate({opacity : 1}, imgAnim.speed);								
							},
							showFullImage		= function($el) {
								isFullMode	= true;
								
								$iw_ribbon_close.hide();
								
								var	$img	= $el.children('img'),
									large	= $img.data('img'),
								
									// add a loading image on top of the image
									$loading = $('<span class="iw_loading"></span>');
								
								$el.append($loading);
								
								// preload large image
								$('<img/>').load(function() {
									var $largeImage	= $(this);
									
									$loading.remove();
									
									$iw_ribbon_zoom.hide();
									
									resizeImage($largeImage);
									
									// reset the current image in the wall
									resetWall($el);
									
									// animate ribbon in and out
									$iw_ribbon.stop().animate({
										opacity		: 1,
										height 		: '0px',
										marginTop	: '63px' // half of ribbons height
									}, ribbonAnim.speed, function() {
										// add the large image to the DOM
										$iw_ribbon.prepend($largeImage);
										
										$iw_ribbon_close.show();
										
										$iw_ribbon.animate({
											height 		: '100%',
											marginTop	: '74px',
											top			: '0px'
										}, ribbonAnim.speed);
									});
								}).attr('src',large);
									
							},
							resizeImage			= function($image) {
								var widthMargin		= 100,
									heightMargin 	= 100,
								
									windowH      	= w_dim.height - heightMargin,
									windowW      	= w_dim.width - widthMargin,
									theImage     	= new Image();
									
								theImage.src     	= $image.attr("src");
								
								var imgwidth     	= theImage.width,
									imgheight    	= theImage.height;

								if((imgwidth > windowW) || (imgheight > windowH)) {
									if(imgwidth > imgheight) {
										var newwidth 	= windowW,
											ratio 		= imgwidth / windowW,
											newheight 	= imgheight / ratio;
											
										theImage.height = newheight;
										theImage.width	= newwidth;
										
										if(newheight > windowH) {
											var newnewheight 	= windowH,
												newratio 		= newheight/windowH,
												newnewwidth 	= newwidth/newratio;
										
											theImage.width 		= newnewwidth;
											theImage.height		= newnewheight;
										}
									}
									else {
										var newheight 	= windowH,
											ratio 		= imgheight / windowH,
											newwidth 	= imgwidth / ratio;
										
										theImage.height = newheight;
										theImage.width	= newwidth;
										
										if(newwidth > windowW) {
											var newnewwidth 	= windowW,
											    newratio 		= newwidth/windowW,
												newnewheight 	= newheight/newratio;
									
											theImage.height 	= newnewheight;
											theImage.width		= newnewwidth;
										}
									}
								}
									
								$image.css({
									'width'			: theImage.width + 'px',
									'height'		: theImage.height + 'px',
									'margin-left'	: -theImage.width / 2 + 'px',
									'margin-top'	: -theImage.height / 2 + 'px'
								});							
							};
							
						return {init : init};	
					})();
				
				ImageWall.init();
			});
		</script>
</body>
</html>