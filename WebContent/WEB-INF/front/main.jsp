<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script>
	var ctx = "${ctx}";
</script>
<link href="${ctx }/css/front/css/admin.css" rel="stylesheet">
<script src="${ctx }/css/front/js/jquery.min.js"></script>
<link rel="stylesheet" href="${ctx }/css/layui/css/layui.css"media="all" />
<link href="${ctx }/css/front/css/findex.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/maindata.js"></script>



<style type="text/css">
.w-newList li {
	background: url(${ctx }/css/front/img/news_icon.jpg) no-repeat left
		center;
}
.ggnews{
	color:#666;
}
.ggnews:hover{
	color: #42baec;
}
</style>
</head>
<%@ include file="top.jsp"%>
<body style="width:1100px;margin:0 auto;">
<div style="">

		<div class="layui-col-xs6 layui-col-md12">
			<div class="grid-demo grid-demo-bg2"
				style=" width: 1098px;
			    height: 37px;
			    border: 1px solid #d3e0f0;
			    background: #e4f2ff;">
				<!--公告滚动  -->
				<input type="hidden" id="typeid" value="0" /> 
				
				<strong class="right_news"> NEWS:
				</strong>
				<div id="scroll_div" class="fl">
					<div id="scroll_begin">
						 <span class="pad_right">公告1公告1公告1公告1公告1公告1公告1公告1公告1
							日期：2018-9-18</span>
					</div>
					
					<script type="text/javascript">
					var data0= {"page":1,"limit":10};
					     $.ajax({
					       type: "post",
					       url: ctx+"/front/selAllNews",
					       data: data0,
					       dataType: "json",
					       success: function(res){
					           if(res.code==0){	
					           	//layer.alert('成功。', {icon: 1});
					           	var html='';
					           	if(res.data.length==0){
					           		html="<span >暂无内容</span>"
					           	}
					           	for(var i=0;i<res.data.length;i++){
									
									html+="<a target=\"_blank\"  class=\"ggnews\"  href=\""+ctx+"/front/detail/"
												+res.data[i].id+"\"><span class=\"pad_right\">"+res.data[i].title+
									"  "+res.data[i].pubtime.substring(5,10)+"</span></a>";
					           	}
					           	$("#scroll_begin").html(html);
					           	
					           }
					       }
					   });
					</script>
					<div id="scroll_end"></div>
				</div>
				<!--公告滚动结束  -->
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-md8" style="width:605px;">
				<div class="grid-demo grid-demo-bg1">
					<!--轮播开始  -->
					<div class="layui-carousel" id="test1" lay-filter="test1">
						<div carousel-item="" id="imgnews">
							<!--轮播子项  -->
						</div>
					</div>
					<!--轮播结束  -->
				</div>
			</div>
			<div class="layui-col-xs6 layui-col-md4"
				style="width:494px;height:280px;">
				<div class="grid-demo">
					<!--通知通报  -->
					<div class="layui-card" style="height:280px;">
						<div class="layui-card-header" style="padding:0 0;">
							<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/2"
							target="_self">通知通报</a>
							<a href="${pageContext.request.contextPath}/front/list/2" target="_self">
							<span class="layui-badge layui-bg-blue" style="margin-left:330px;">MORE</span></a>
							<hr class="layui-bg-blue" style="margin:2px 0;">
						</div>
						<div class="layui-card-body" style="padding: 10px 5px;height: 218px;">
							<ul class="w-newList" id="tzbbnewList">
								<!-- <li><a href="/news?id=40" target="_blank"
									title=" 新闻测试测试 新闻测试测试"> 新闻测试测试 新闻测试测试 </a>
									<button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>
									<button class="layui-btn layui-btn-xs layui-btn-normal button2">签收情况</button>
									<span>08-23</span></li>
								 -->
							</ul>
							
							<script type="text/javascript">
								//图片新闻
						var data1= {"page":1,"limit":2,"typeid":1};
				 		      $.ajax({
					             type: "post",
					             url: ctx+"/front/selAllNews",
					             data: data1,
					             dataType: "json",
					             success: function(res){
						             if(res.code==0){	
						             	//layer.alert('成功。', {icon: 1});
						             	var html='';
						             	if(res.data.length==0){
						             		html="<span >暂无内容</span>"
						             	}
						             	for(var i=0;i<res.data.length;i++){
										html+="<div><a target=\"_blank\" href=\""+ctx+"/front/detail/"
										+res.data[i].id+"\"><img src=\""+res.data[i].imgurl+"\"></a><div class=\"lbwz\">"
										+res.data[i].title+"</div></div>"
						             	}
						             	$("#imgnews").html(html);
						             	
						             }
					             }
					         });
							</script>
						</div>
					</div>
					<!--通知通报  -->
				</div>

			</div>
			<div class="layui-col-xs6 layui-col-md12"
				style="width:1100px;margin-top:5px;margin-bottom:5px;">
				<div class="grid-demo grid-demo-bg2">
					<div class="layui-card">

						<div class="layui-card-body" style="padding:0 0;">
							<img style="width:1100px;" alt=""
								src="${ctx }/css/front/img/hengfu.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- 领导讲话 -->
		<div class="layui-col-xs6 layui-col-md12"
			style="width:1099px;margin-bottom:5px;">

			<div class="layui-row">
				<div class="layui-col-xs6" style="width:548px;">
					<div class="grid-demo grid-demo-bg1">
						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
							<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/3"
							target="_self">领导讲话</a>
							<a href="${pageContext.request.contextPath}/front/list/3" target="_self">
							<span class="layui-badge layui-bg-blue" style="margin-left:390px;">MORE</span></a>
								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="height: 218px;">
								<ul class="w-newList" id="ldjhlist">
									<!-- <li><a href="/news?id=40" target="_blank"
										title=" 新闻测试测试 新闻测试测试"> 新闻测试测试 新闻测试测试 <span>08-23</span></a></li> -->
									
								</ul>
							</div>
						</div>


					</div>
				</div>
<!-- 工作动态 -->				
				<div class="layui-col-xs6" style="width:548px;margin-left:3px;">
					<div class="grid-demo">

						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/4"
							target="_self">工作动态</a>
							<a href="${pageContext.request.contextPath}/front/list/4" target="_self">
							<span class="layui-badge layui-bg-blue" style="margin-left:390px;">MORE</span></a>
								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="height: 218px;">

								<ul class="w-newList" id="gzdtlist">
									
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>

<!-- 制度规定 -->	
		<div class="layui-col-xs6 layui-col-md12"
			style="width:1099px;margin-bottom:5px;">

			<div class="layui-row">
				<div class="layui-col-xs6" style="width:548px;">
					<div class="grid-demo grid-demo-bg1">
						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								
							<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/5"
							target="_self">制度规定</a>
							<a href="${pageContext.request.contextPath}/front/list/5" target="_self">
							<span class="layui-badge layui-bg-blue" style="margin-left:390px;">MORE</span></a>
								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="height: 218px;">
								<ul class="w-newList" id="zdzdlist">
									
								</ul>
							</div>
						</div>


					</div>
				</div>
<!-- 时政要闻-->	
				<div class="layui-col-xs6" style="width:548px;margin-left:3px;">
					<div class="grid-demo">

						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
									
							<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/6"
							target="_self">时政要闻</a>
							<a href="${pageContext.request.contextPath}/front/list/6" target="_self">
							<span class="layui-badge layui-bg-blue" style="margin-left:390px;">MORE</span></a>

								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="height: 218px;">

								<ul class="w-newList" id="szywlist">
									
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>


		<div class="layui-col-xs6 layui-col-md12"
			style="width:1099px;margin-bottom:5px;">

			<div class="layui-row">
				<div class="layui-col-xs6" style="width:548px;">
					<div class="grid-demo grid-demo-bg1">
						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
										
						<%-- 	<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/front/list/7"
							target="iframe">时政要闻</a>
							<a href="${pageContext.request.contextPath}/front/list/7" target="iframe">
							<span class="layui-badge layui-bg-blue" style="margin-left:390px;">MORE</span></a>

								<hr class="layui-bg-blue" style="margin:2px 0;"> --%>
								
								<a href="${pageContext.request.contextPath}/front/list/7" class="layui-btn layui-btn-normal"
									style="margin-top: 4px;">警保风采</a>
								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="padding:2px 2px;margin-top:5px;" >
								<!-- 警保风采 -->
								<div class="layui-carousel" id="test2" style=""lay-filter="test2">
								<div carousel-item="" id="jbfc">
								<!--轮播子项  -->
								</div>
								</div>
								<!-- 警保风采 -->
							</div>
						</div>


					</div>
				</div>
				<div class="layui-col-xs6" style="width:548px;margin-left:3px;">
					<div class="grid-demo">

						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								<button class="layui-btn layui-btn-normal"
									style="margin-top: 4px;">便警服务</button>
								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body">

								<!-- 快捷方式 -->

					<ul
						class="layui-row layui-col-space10 layui-this layadmin-shortcut">
						<li class="layui-col-xs3"><a
							lay-href="component/layer/list"> <i
								class="layui-icon layui-icon-rmb"></i> <cite>工资查询</cite>
						</a></li>
						<li class="layui-col-xs3"><a lay-href="component/button/">
								<i class="layui-icon layui-icon-note"></i> <cite>公务接待</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/progress/"> <i
								class="layui-icon layui-icon-component"></i>
								 <cite>项目建设</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/grid/speed-dial"> <i
								class="layui-icon layui-icon-group"></i> <cite>通讯录</cite>
						</a></li>
						<li class="layui-col-xs3"><a lay-href="component/panel/">
								<i class="layui-icon layui-icon-list"></i> <cite>食堂菜谱</cite>
						</a></li>
						<li class="layui-col-xs3"><a lay-href="component/badge/">
								<i class="layui-icon layui-icon-table"></i> <cite>办公自动化</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/timeline/"> <i
								class="layui-icon layui-icon-dollar"></i> <cite>装财统计</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/auxiliar/"> <i
								class="layui-icon layui-icon-vercode"></i> <cite>装备管理</cite>
						</a></li>
						<li class="layui-col-xs3"><a lay-href="component/panel/">
								<i class="layui-icon layui-icon-auz"></i> <cite>被装管理</cite>
						</a></li>
						<li class="layui-col-xs3"><a lay-href="component/badge/">
								<i class="layui-icon layui-icon-templeate-1"></i> <cite>文件管理</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/timeline/"> <i
								class="layui-icon layui-icon-template"></i> <cite>派出所外观</cite>
						</a></li>
						<li class="layui-col-xs3"><a
							lay-href="component/auxiliar/"> <i
								class="layui-icon layui-icon-home"></i> <cite>市局主页</cite>
						</a></li>
					</ul>
								<!-- 快捷方式 -->
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="${ctx}/layui/layui.js"></script>

	<script type="text/javascript">
  	//$(window.parent.document).find("#iframe1").css("height","1345px");
			//图片新闻
			var da= {"page":1,"limit":10,"typeid":1};
	 		      $.ajax({
		             type: "post",
		             url: ctx+"/front/selAllNews",
		             data: da,
		             dataType: "json",
		             success: function(res){
			             if(res.code==0){	
			             	//layer.alert('成功。', {icon: 1});
			             	var html='';
			             	if(res.data.length==0){
			             		html="<span >暂无内容</span>"
			             	}
			             	for(var i=0;i<res.data.length;i++){
							html+="<div><a target=\"_blank\" href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\"><img src=\""+res.data[i].imgurl+"\"></a><div class=\"lbwz\">"
							+res.data[i].title+"</div></div>"
			             	}
			             	$("#jbfc").html(html);
			             	
			             }
		             }
		         });
							
	
		layui.use([ 'element', 'layer','carousel' ], function() {
		var element = layui.element,
			carousel = layui.carousel,
			layer=layui.layer; //导航的hover效果、二级菜单等功能，需要依赖element模块
			
		//图片新闻轮播
		carousel.render({
			elem : '#test1',
			arrow : 'hover'
			,anim: 'fade'
			,interval:4000
		});
		//警保风采轮播
		carousel.render({
			elem : '#test2',
			width : '100%', //设置容器宽度
			arrow : 'none', //始终显示箭头 //,anim: 'updown' //切换动画方式
			interval : 3000,
			height : '283px'
		});
	});
	$(function(){
		//文字横向滚动
		function ScrollImgLeft() {
			var speed = 50;
			var MyMar = null;
			var scroll_begin = document.getElementById("scroll_begin");
			var scroll_end = document.getElementById("scroll_end");
			var scroll_div = document.getElementById("scroll_div");
			scroll_end.innerHTML = scroll_begin.innerHTML;
			function Marquee() {
				if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
					scroll_div.scrollLeft -= scroll_begin.offsetWidth;
				else
					scroll_div.scrollLeft++;
			}
			MyMar = setInterval(Marquee, speed);
			scroll_div.onmouseover = function() {
				clearInterval(MyMar);
			}
			scroll_div.onmouseout = function() {
				MyMar = setInterval(Marquee, speed);
			}
		}
		ScrollImgLeft();
		
	    //通知播报
		var data2= {"page":1,"limit":7,"typeid":2};
 		      $.ajax({
	             type: "post",
	             url: ctx+"/front/selAllNews",
	             data: data2,
	             dataType: "json",
	             success: function(res){
		             if(res.code==0){	
		             	//layer.alert('成功。', {icon: 1});
		             	var html='';
		             	if(res.data.length==0){
		             		html="<span >暂无内容</span>"
		             	}
		             	for(var i=0;i<res.data.length;i++){
							var str=res.data[i].title.length>20?"...":"";
							html+="<li><a target=\"_blank\" title=\""+
							res.data[i].title+"\"href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\">"+ res.data[i].title.substring(0,20)+str+ 
							"</a><button class=\"layui-btn layui-btn-xs layui-btn-normal button1\">"+
							"签收</button><button class=\"layui-btn layui-btn-xs layui-btn-normal button2\">"
							+"签收情况</button><span>"
							+res.data[i].pubtime.substring(5,10)+"</span></li>";
		             	}
		             	$("#tzbbnewList").html(html);
		             }
	             }
	         });
	         
	     //领导讲话
		   var data3= {"page":1,"limit":7,"typeid":3};
 		      $.ajax({
	             type: "post",
	             url: ctx+"/front/selAllNews",
	             data: data3,
	             dataType: "json",
	             success: function(res){
		             if(res.code==0){	
		             	//layer.alert('成功。', {icon: 1});
		             	var html='';
		             	if(res.data.length==0){
		             		html="<span >暂无内容</span>"
		             	}
		             	for(var i=0;i<res.data.length;i++){
							var str=res.data[i].title.length>20?"...":"";
							html+="<li><a target=\"_blank\" title=\""+
							res.data[i].title+"\"href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\">"+ res.data[i].title.substring(0,20)+str+ 
							"</a><span>"
							+res.data[i].pubtime.substring(5,10)+"</span></li>";
		             	}
		             	$("#ldjhlist").html(html);
		             }
	             }
	         });
	         
	         var data4= {"page":1,"limit":7,"typeid":4};
 		      $.ajax({
	             type: "post",
	             url: ctx+"/front/selAllNews",
	             data: data4,
	             dataType: "json",
	             success: function(res){
		             if(res.code==0){	
		             	//layer.alert('成功。', {icon: 1});
		             	var html='';
		             	if(res.data.length==0){
		             		html="<span >暂无内容</span>"
		             	}
		             	for(var i=0;i<res.data.length;i++){
							var str=res.data[i].title.length>20?"...":"";
							html+="<li><a target=\"_blank\" title=\""+
							res.data[i].title+"\"href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\">"+ res.data[i].title.substring(0,20)+str+ 
							"</a><span>"
							+res.data[i].pubtime.substring(5,10)+"</span></li>";
		             	}
		             	$("#gzdtlist").html(html);
		             }
	             }
	         });
	         
	         var data5= {"page":1,"limit":7,"typeid":5};
 		      $.ajax({
	             type: "post",
	             url: ctx+"/front/selAllNews",
	             data: data5,
	             dataType: "json",
	             success: function(res){
		             if(res.code==0){	
		             	//layer.alert('成功。', {icon: 1});
		             	var html='';
		             	if(res.data.length==0){
		             		html="<span >暂无内容</span>"
		             	}
		             	for(var i=0;i<res.data.length;i++){
							var str=res.data[i].title.length>20?"...":"";
							html+="<li><a target=\"_blank\" title=\""+
							res.data[i].title+"\"href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\">"+ res.data[i].title.substring(0,20)+str+ 
							"</a><span>"
							+res.data[i].pubtime.substring(5,10)+"</span></li>";
		             	}
		             	$("#zdzdlist").html(html);
		             }
	             }
	         });
 		      
 		     var data6= {"page":1,"limit":7,"typeid":6};
		      $.ajax({
	             type: "post",
	             url: ctx+"/front/selAllNews",
	             data: data6,
	             dataType: "json",
	             success: function(res){
		             if(res.code==0){	
		             	//layer.alert('成功。', {icon: 1});
		             	var html='';
		             	if(res.data.length==0){
		             		html="<span >暂无内容</span>"
		             	}
		             	for(var i=0;i<res.data.length;i++){
							var str=res.data[i].title.length>20?"...":"";
							html+="<li><a target=\"_blank\" title=\""+
							res.data[i].title+"\"href=\""+ctx+"/front/detail/"
							+res.data[i].id+"\">"+ res.data[i].title.substring(0,20)+str+ 
							"</a><span>"
							+res.data[i].pubtime.substring(5,10)+"</span></li>";
		             	}
		             	$("#szywlist").html(html);
		             }
	             }
	         });
	});
	</script>
</body>

<%@ include file="footer.jsp"%>
</html>