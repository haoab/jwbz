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
<%-- <script type="text/javascript" src="${ctx}/js/iframe.js"></script>
 --%>
<script>
	var ctx = "${ctx}";
</script>

<style type="text/css">
.w-newList li {
	background: url(${ctx }/css/front/img/news_icon.jpg) no-repeat left
		center;
}

.layui-nav-tree .layui-nav-item a:hover {
	background-color: #007DDB !important;
}
.ddbgblue{
	background: #1C86EE;
}
</style>
</head>
<%@ include file="top.jsp"%>
<body  >
	<div style="width:1100px;height:100px;margin:0 auto;margin-top:5px;">
		<div class="layui-row">
			<div class="layui-col-md3">
				<div class="grid-demo">
					<div class="layui-card" style=" width: 265px;">
						<div class="layui-card-body" style="padding:0 0;">
							<ul class="layui-nav   layui-nav-tree layui-bg-blue layui-inline"
								lay-filter="navLmdh" style="width:99%">
								<li class="layui-nav-item layui-nav-itemed"><a
									href="javascript:;">栏目导航</a>
									<dl class="layui-nav-child">
										<dd id="d1">
											<a href="${pageContext.request.contextPath}/front/list/1"
												target="_self">图片新闻</a>
										</dd>
										<dd id="d2">
											<a href="${pageContext.request.contextPath}/front/list/2"
												target="_self">通知通报</a>
										</dd>
										<dd id="d3">
											<a href="${pageContext.request.contextPath}/front/list/3"
												target="_self">领导讲话</a>
										</dd >
										<dd id="d4">
											<a href="${pageContext.request.contextPath}/front/list/4"
												target="_self">工作动态</a>
										</dd>
										<dd id="d5">
											<a href="${pageContext.request.contextPath}/front/list/5"
												target="_self">制度制定</a>
										</dd>
										<dd id="d6">
											<a href="${pageContext.request.contextPath}/front/list/6"
												target="_self">时政要闻</a>
										</dd>
										<dd id="d7">
											<a href="${pageContext.request.contextPath}/front/list/7"
												target="_self">警保风采</a>
										</dd>
									</dl></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md9">
				<div class="grid-demo grid-demo-bg1">
					<div class="layui-card" style=" width: 824px;">
						<div class="layui-card-header" style="padding:5px 0;">
							<button class="layui-btn layui-btn-normal">${typename}</button>
							<input type="hidden" id="typeid" value="${typeid}" /> <span
								class="layui-breadcrumb"
								style="float: right;margin-right: 15px;"> <a
								target="_parent"
								href="${pageContext.request.contextPath}/front/index">首页</a> <a><cite>${typename}</cite></a>
							</span>
							<hr class="layui-bg-blue">

						</div>
						<div class="layui-card-body" style="">
							<!--列表 -->
							<ul class="w-newList" id="newslist" style="">

							</ul>
							<!--分页  -->
							<div id="demo2"></div>
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
	<script type="text/javascript" src="${ctx }/css/layui/layui.js"></script>
	<script type="text/javascript">
	
	//左侧菜单点击变色
	$(function(){
		if ($("#typeid")) {
			if($("#typeid").val()){
				var	typeid=$("#typeid").val();
				typeid="#d"+typeid;
				$(".layui-nav-child dd").each(function(){
					$(this).removeClass("ddbgblue");
				});
				$(typeid).addClass("ddbgblue");
				$(typeid+" a").css("color","#ffffff");
				//console.log($(typeid+" a"));
				
			}
		}		

	}) 
	</script>
<script type="text/javascript">

   
		var count;
		$.ajax({
			     type: "post",
			     url: ctx+"/front/selAllNewsCount",
			     data: {"typeid":$("#typeid").val()},
			             dataType: "json",
			             success: function(data){
			             if(data.code==0){	
			             	//layer.alert('成功。', {icon: 1});
			             	count=data.data;
			             }
			   }
		});

		layui.use([ 'element', 'laypage', 'layer', 'carousel' ], function() {
			var element = layui.element,
				carousel = layui.carousel,
				layer = layui.layer,
				laypage = layui.laypage; //导航的hover效果、二级菜单等功能，需要依赖element模块
	
			//监听导航点击
		/* 	element.on('nav(demo)', function(elem) {
				//console.log(elem)
				//layer.msg(elem.text());
			}); */
			//监听导航点击
			element.on('nav(navLmdh)', function(elem) {
				//console.log(elem)
				//layer.msg(elem.text());
			});
	
			laypage.render({
				elem : 'demo2',
				count : count,
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
				theme : '#1E9FFF',
				limits: [10,20],
				jump : function(obj, first) {
					//obj包含了当前分页的所有参数，比如：
					console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					console.log(obj.limit); //得到每页显示的条数
		
					var data1= {"page":obj.curr,"limit":obj.limit,"typeid":$("#typeid").val()};
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
					             		//console.log(res.data[i].id);
					             		html+="<li><a href='${pageContext.request.contextPath}/front/detail/"
					             		+res.data[i].id+"' target='_blank' title=''>"+res.data[i].title+" <span>"
					             		+res.data[i].pubtime+"</span></a></li>"
					             	}
					             	$("#newslist").html(html);
					             	
					             }
				             }
				         });
					 
	
					//首次不执行
					/* if (!first) {
						//do something
					} */
				}
			});
		});
	</script>




</body>
<%@ include file="footer.jsp"%>
</html>