<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<script>
	var ctx = "${ctx}";
</script>

<script src="${ctx }/css/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/css/layui/layui.js"></script>

<div id="banner" style="height:260px;width:1100px;margin:0 auto;text-align: center; ">
	<img style="margin:0 auto;" src="${pageContext.request.contextPath}/css/front/img/jwbz.png"></img>
	<div style="width:1100px;margin:0 auto;">
		<ul class="layui-nav layui-bg-sblue" lay-filter="demo">
			<li class="layui-nav-item" id="i0">  <a href="${pageContext.request.contextPath}/front/main"  id="a0">首页</a></li>
			<li class="layui-nav-item" id="i1"><a href="${pageContext.request.contextPath}/front/list/1" id="a1"target="_self">图片新闻</a></li>
			<li class="layui-nav-item" id="i2"> <a href="${pageContext.request.contextPath}/front/list/2"  id="a2"target="_self">通知通报</a></li>
			<li class="layui-nav-item" id="i3"> <a href="${pageContext.request.contextPath}/front/list/3" id="a3" target="_self">领导讲话</a></li>
			<li class="layui-nav-item" id="i4"> <a href="${pageContext.request.contextPath}/front/list/4"  id="a4"target="_self">工作动态</a></li>
			<li class="layui-nav-item" id="i5"><a href="${pageContext.request.contextPath}/front/list/5" id="a5" target="_self">制度制定</a></li>
			<li class="layui-nav-item" id="i6"><a href="${pageContext.request.contextPath}/front/list/6" id="a6" target="_self">时政要闻</a></li>
			<li class="layui-nav-item" id="i7" ><a href="${pageContext.request.contextPath}/front/list/7" id="a7" target="_self">警保风采</a></li>
			<li class="layui-nav-item"><a >便警服务</a></li>
			<li class="layui-nav-item"><a href="">警保信箱</a></li>
			<li class="layui-nav-item"><a  target="_blank" href="${pageContext.request.contextPath}/login.jsp">后台登录</a></li>
		</ul>
	</div>
</div>

<script>
//顶部菜单点击变色
	$(function(){
		if ($("#typeid")) {
			if($("#typeid").val()){
				var	typeid=$("#typeid").val();
				typeid="#i"+typeid;
				$(".layui-nav-item").each(function(){
					//console.log(this);
					$(this).removeClass("layui-this");
				});
				console.log($(typeid));
				$(typeid).addClass("layui-this");
			}
		}
	
	});
	
	
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
		});
</script>