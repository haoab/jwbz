<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>淮安公安警务保障信息网</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="${ctx }/css/layui/css/layui.css"
	media="all" />
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
<body class="main_body">
	<%@ include file="/front/top.jsp"%>
	<div style="width:1100px;height:100px;margin:0 auto;margin-top:5px;">
		<div class="layui-row">
			<div class="layui-col-md3">
				<div class="grid-demo">
					<div class="layui-card" style=" width: 265px;">

						<div class="layui-card-body" style="padding:0 0;">
							<ul class="layui-nav   layui-nav-tree layui-bg-blue layui-inline"
								lay-filter="demo1" style="width:99%">
								<li class="layui-nav-item layui-nav-itemed"><a
									href="javascript:;">栏目导航</a>
									<dl class="layui-nav-child">
										<dd>
											<a href="javascript:;">选项一</a>
										</dd>
										<dd>
											<a href="javascript:;">选项二</a>
										</dd>
										<dd>
											<a href="javascript:;">选项三</a>
										</dd>
										<dd>
											<a href="">跳转项</a>
										</dd>
									</dl></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md9">
				<div class="grid-demo grid-demo-bg1">

					<div class="layui-card" style=" width: 825px;">
						<div class="layui-card-header" style="padding:5px 0;">
							<button class="layui-btn layui-btn-normal">${typename}111</button>
							<span class="layui-breadcrumb"
								style="float: right;margin-right: 15px;"> <a href="/">首页</a>
								<a><cite>${typename}</cite></a>
							</span>
							<hr class="layui-bg-blue">

						</div>
						<div class="layui-card-body">


							<ul class="w-newList">
								<li><a href="/news?id=40" target="_blank"
									title=" 新闻测试测试 新闻测试测试"> 新闻测试测试 新闻测试测试 <span>08-23</span></a></li>
								<li><a href="/news?id=39" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 新闻测试测试 <span>08-23</span>
								</a></li>
								<li><a href="/news?id=32" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 <span>08-19</span>
								</a></li>
								<li><a href="/news?id=22" target="_blank"
									title=" 新闻测试测试  新闻测试测试"> 新闻测试测试 <span>08-15</span></a></li>
								<li><a href="/news?id=19" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 新闻测试测试 <span>08-15</span>
								</a></li>
								<li><a href="/news?id=19" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 <span>08-15</span>
								</a></li>
								<li><a href="/news?id=19" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 新闻测试测试 新闻测试测试 <span>08-15</span>
								</a></li>
							</ul>


							<div id="demo2"></div>
							${typename}

						</div>
					</div>

				</div>
			</div>
		</div>
		
		
	
		<div class="layui-row" style="">
	    <div class="layui-col-xs6">
	      <div class="grid-demo grid-demo-bg1">&nbsp;</div>
	    </div>
	    <div class="layui-col-xs6">
	      <div class="grid-demo">&nbsp;</div>
	    </div>
	  </div>
	</div>

	<%@ include file="/front/footer.jsp"%>

	<script type="text/javascript" src="${ctx }/css/layui/layui.js"></script>


	<!--垂直导航  -->
	<!-- 	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	
			//监听导航点击
			element.on('nav(demo1)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script> -->
	<script>
		layui.use([ 'element', 'laypage', 'layer', 'carousel' ], function() {
			var element = layui.element,
				carousel = layui.carousel,
				layer = layui.layer,
				laypage = layui.laypage; //导航的hover效果、二级菜单等功能，需要依赖element模块
	
			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
	
				layer.msg(elem.text());
			});
			//监听导航点击
			element.on('nav(demo1)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
	
	
	
	
			laypage.render({
				elem : 'demo2',
				count : 1000,
				layout : [ 'count', 'prev', 'page', 'next', 'limit' ],
				theme : '#1E9FFF',
				jump : function(obj, first) {
					//obj包含了当前分页的所有参数，比如：
					console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					console.log(obj.limit); //得到每页显示的条数
	
					//首次不执行
					/* if (!first) {
						//do something
					} */
				}
			});
		});
	</script>




</body>
</html>