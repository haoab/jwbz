<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login/login.css" media="all">
		
		<script>  
        var ctx = "${pageContext.request.contextPath}";  
    </script> 
	  
    <script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
    </script>
    
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
	 
	<h1>
	  
		 <strong>新华联合</strong>
		 <em>BI System</em>
	</h1>
	    <form class="layui-form" id="form">

	<div class="layui-user-icon larry-login">
		
		 <input name="username" class="login_txtbx"  placeholder="请输入用户名或手机号" value="" lay-verify="required" type="text" autocomplete="off">

	</div>
	<div class="layui-pwd-icon larry-login">
		
		  <input class="login_txtbx" name="password" placeholder="请输入密码" value=""  lay-verify="required" type="password" autocomplete="off">

	</div>

    <div class="layui-submit larry-login">
    	
		 <button class="submit_btn"lay-submit="" lay-filter="login" id="btn">登录</button>

    </div>
	    </form>

<!--     <div class="layui-login-text"> -->
<!--     	<p>© 2018-航天理想版权所有</p> -->
<!--         <p>技术支持：道科铭</p> -->
<!--     </div> -->
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/login/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/login/login.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/login/jparticle.jquery.js"></script>
<script type="text/javascript">
 $(function(){
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
	//登录链接测试，使用时可删除

}); 
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>