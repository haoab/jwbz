<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>淮安公安警务保障信息网</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="${ctx }/css/layui/css/layui.css"media="all" />
<link href="${ctx }/css/front/css/admin.css" rel="stylesheet">
<link href="${ctx }/css/front/css/findex.css" rel="stylesheet">
<script src="${ctx }/css/front/js/jquery.min.js"></script>
<script>
	var ctx = "${ctx}";
</script>

<style type="text/css">
.w-newList li {
	background: url(${ctx }/css/front/img/news_icon.jpg) no-repeat left
		center;
}
</style>
</head>
<body style="width:1100px;margin:0 auto;">
<%@ include file="top.jsp"%>
<div style="width:1100px;margin:0 auto;">
<%-- 	<iframe style="width:1100px;height:1345px;margin:0 auto;" src="${pageContext.request.contextPath}/front/main" id="iframe1" name="iframe"  scrolling="no" frameborder="0"></iframe>
 --%></div>	
<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="${ctx }/css/layui/layui.js"></script>
	
	<script>
	
	$(document).ready(function(){
		//$("#iframe1").attr('src','${pageContext.request.contextPath}/front/main');
	});

		layui.use([ 'element', 'layer','carousel' ], function() {
			var element = layui.element,
				carousel = layui.carousel,layer=layui.layer; //导航的hover效果、二级菜单等功能，需要依赖element模块
			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				//layer.msg(elem.text());
			});

		});
	</script>

</body>
</html>