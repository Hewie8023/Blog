<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>日记需要登陆后查看</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/stylel.css">


<script type="text/javascript">
function checkForm(){
	var userName=$("#userName").val();
	var password=$("#password").val();
	if(userName==null||userName==""){
		$("#error").html("用户名不能为空！");
		return false;
	}
	if(password==null||password==""){
		$("#error").html("密码不能为空！");
		return false;
	}
	return true;
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

 <!-----start-main---->
	 <div class="main">
		<div class="login-form">
			<h1>用户登陆</h1>
					<div class="head">
						<img src="${pageContext.request.contextPath}/static/images/user.png" alt=""/>
					</div>
				<form action="${pageContext.request.contextPath}/blogger/lo_gin.do" method="post" onsubmit="return checkForm()">
						<input type="text" class="text" value="USERNAME" id="userName" name="userName"  />
						<input type="password" value="Password" id="password" name="password" />
						<div class="submit">
							<input type="submit"  value="LOGIN" >
						</div>	
						<div style="float: right;"><a href="${pageContext.request.contextPath}/index.html" style="padding:40px;background: url(${pageContext.request.contextPath}/static/images/return.png)no-repeat left center" title="返回首页"></a></div>
						
				</form>
			</div>
			<!--//End-login-form-->
			 <!-----start-copyright---->
   					<div class="copy-right">
						<p>Copyright &copy; Hewie个人博客 版权所有<a target="_blank" href="#"></a></p> 
					</div>
				<!-----//end-copyright---->
		</div>
			 <!-----//end-main---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>