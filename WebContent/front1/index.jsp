<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
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

	<div style="width:1100px;height:100px;margin:0 auto;">

		<div class="layui-col-xs6 layui-col-md12">
			<div class="grid-demo grid-demo-bg2"
				style=" width: 1098px;
    height: 37px;
    border: 1px solid #d3e0f0;
    background: #e4f2ff;">
				<!--公告滚动  -->

				<strong class="right_news"> <%-- <img style="margin-top:-2px;" src="${ctx }/css/front/img/gonggao.png"></img> --%>公告栏:
				</strong>

				<div id="scroll_div" class="fl">
					<div id="scroll_begin">
						<span class="pad_right">公告1公告1公告1公告1公告1公告1公告1公告1公告1
							日期：2018-9-18</span>
							
							 <span class="pad_right">公告2公告2公告2公告2公告2公告2公告2公告2公告2
							日期：2018-9-18</span>
							
							 <span class="pad_right">公告3公告3公告3公告3公告3公告3公告3公告3公告3
							日期：2018-9-18</span>

					</div>
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
						<div carousel-item="">

							<!--轮播子项  -->
							<div>
								<a href="#"><img src="${ctx }/css/front/img/600-280-2.png"
									alt=""></a>
								<div class="lbwz">新闻标题1新闻标题1新闻标题1</div>
							</div>

							<div>
								<a href="#"><img src="${ctx }/css/front/img/600_280_1.png"
									alt=""></a>
								<div class="lbwz">新闻标题2新闻标题2新闻标题2</div>
							</div>


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
							<button class="layui-btn layui-btn-normal">通知通报</button>

							<span class="layui-badge layui-bg-blue"
								style="margin-left:330px;">MORE</span>
							<hr class="layui-bg-blue" style="margin:2px 0;">
						</div>
						<div class="layui-card-body" style="padding: 10px 5px;">

							<ul class="w-newList">
								<li><a href="/news?id=40" target="_blank"
									title=" 新闻测试测试 新闻测试测试"> 新闻测试测试 新闻测试测试 </a> <button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-23</span></li>
								<li><a href="" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 </a>  <button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-23</span>
								</li>
								<li><a href="" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 </a> <button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-19</span>
								</li>
								<li><a href="" target="_blank"
									title=" 新闻测试测试  新闻测试测试"> 新闻测试测试 </a><button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-15</span></li>
								<li><a href="" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试=</a> <button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-15</span>
								</li>
								<li><a href="" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 </a><button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button><span>08-15</span>
								</li>
								<li><a href="" target="_blank" title=" 新闻测试测试">
										新闻测试测试 新闻测试测试 新闻测试测试 =</a><button class="layui-btn layui-btn-xs layui-btn-normal button1">签收</button>  <button class="layui-btn layui-btn-xs layui-btn-normal button2" >签收情况</button> <span>08-15</span>
								</li>
							</ul>
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




		<div class="layui-col-xs6 layui-col-md12"
			style="width:1099px;margin-bottom:5px;">


			<div class="layui-row">
				<div class="layui-col-xs6" style="width:548px;">
					<div class="grid-demo grid-demo-bg1">
						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								<button class="layui-btn layui-btn-normal">领导讲话</button>
								<span class="layui-badge layui-bg-blue"
									style="margin-left:390px;">MORE</span>
								<hr class="layui-bg-blue" style="margin:2px 0;">
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
							</div>
						</div>


					</div>
				</div>
				<div class="layui-col-xs6" style="width:548px;margin-left:3px;">
					<div class="grid-demo">

						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								<button class="layui-btn layui-btn-normal">工作动态</button>
								<span class="layui-badge layui-bg-blue"
									style="margin-left:390px;">MORE</span>
								<hr class="layui-bg-blue" style="margin:2px 0;">
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
								<button class="layui-btn layui-btn-normal">制度规定</button>
								<span class="layui-badge layui-bg-blue"
									style="margin-left:390px;">MORE</span>
								<hr class="layui-bg-blue" style="margin:2px 0;">
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
							</div>
						</div>


					</div>
				</div>
				<div class="layui-col-xs6" style="width:548px;margin-left:3px;">
					<div class="grid-demo">

						<div class="layui-card">
							<div class="layui-card-header" style="padding:0 0;">
								<button class="layui-btn layui-btn-normal">时政要闻</button>
								<span class="layui-badge layui-bg-blue"
									style="margin-left:390px;">MORE</span>

								<hr class="layui-bg-blue" style="margin:2px 0;">
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
								<button class="layui-btn layui-btn-normal">警保风采</button>
								<span class="layui-badge layui-bg-blue"
									style="margin-left:390px;">MORE</span>

								<hr class="layui-bg-blue" style="margin:2px 0;">
							</div>
							<div class="layui-card-body" style="padding:2px 2px;">

								<!-- 警保风采 -->
								<div class="layui-carousel" id="test2">
									<div carousel-item>
										<div>条目1</div>
										<div>条目2</div>
										<div>条目3</div>
										<div>条目4</div>
										<div>条目5</div>
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
									style="    margin-top: 4px;">便警服务</button>

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
											class="layui-icon layui-icon-component
"></i> <cite>项目建设</cite>
									</a></li>
									<li class="layui-col-xs3"><a
										lay-href="component/grid/speed-dial"> <i
											class="layui-icon layui-icon-group
"></i> <cite>通讯录</cite>
									</a></li>
									<li class="layui-col-xs3"><a lay-href="component/panel/">
											<i class="layui-icon layui-icon-list
"></i> <cite>食堂菜谱</cite>
									</a></li>
									<li class="layui-col-xs3"><a lay-href="component/badge/">
											<i class="layui-icon layui-icon-table
"></i> <cite>办公自动化</cite>
									</a></li>
									<li class="layui-col-xs3"><a
										lay-href="component/timeline/"> <i
											class="layui-icon layui-icon-dollar
"></i> <cite>装财统计</cite>
									</a></li>
									<li class="layui-col-xs3"><a
										lay-href="component/auxiliar/"> <i
											class="layui-icon layui-icon-vercode
"></i> <cite>装备管理</cite>
									</a></li>
									<li class="layui-col-xs3"><a lay-href="component/panel/">
											<i class="layui-icon layui-icon-auz
"></i> <cite>被装管理</cite>
									</a></li>
									<li class="layui-col-xs3"><a lay-href="component/badge/">
											<i class="layui-icon layui-icon-templeate-1
"></i> <cite>文件管理</cite>
									</a></li>
									<li class="layui-col-xs3"><a
										lay-href="component/timeline/"> <i
											class="layui-icon layui-icon-template
"></i> <cite>派出所外观</cite>
									</a></li>
									<li class="layui-col-xs3"><a
										lay-href="component/auxiliar/"> <i
											class="layui-icon layui-icon-home
"></i> <cite>市局主页</cite>
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
	<%@ include file="/front/footer.jsp"%>

	<script type="text/javascript" src="${ctx }/css/layui/layui.js"></script>
	<script>
		layui.use([ 'element', 'carousel' ], function() {
			var element = layui.element,
				carousel = layui.carousel; //导航的hover效果、二级菜单等功能，需要依赖element模块
	
			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
	
				layer.msg(elem.text());
			});
	
	
			//常规轮播
			carousel.render({
				elem : '#test1',
				arrow : 'hover'
			});
	
	
			carousel.render({
				elem : '#test2',
				width : '100%', //设置容器宽度
				arrow : 'none', //始终显示箭头 //,anim: 'updown' //切换动画方式
				interval : 2000,
				height : '288px'
			});
		});
	</script>

	<script type="text/javascript">
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
	</script>



</body>
</html>