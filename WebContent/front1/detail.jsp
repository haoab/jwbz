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
	background: url(${ctx }/css/front/img/news_icon.jpg) no-repeat left center;
}

.title {
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    margin-top: 10px;
    margin-bottom: 10px;
}


</style>
</head>
<body class="main_body">
	<%@ include file="/front/top.jsp"%>

	<div style="width:1100px;height:100px;margin:0 auto;margin-top:5px;">

		
		<div class="layui-col-xs6 layui-col-md12">
      <div class="grid-demo grid-demo-bg2">
      
      <div class="layui-card">
        <div class="layui-card-header"><span class="layui-breadcrumb">
  <a href="">首页</a>
  <a href="">国际新闻</a>
  <a href="">亚太地区</a>
  <a><cite>正文</cite></a>
</span></div>
        <div class="layui-card-body">
      
      	<div id="ContentPlaceHolder1_title" class="title">协助调查处理公告</div>

            <blockquote class="layui-elem-quote layui-quote-nm" style="text-align: center;">
            
 				发表时间：<span id="time">2018-09-14 06:34</span>
 				
               	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;<span>作者：</span><span id="author">淮安市公安局</span>
               		&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;<span>阅读：</span><span id="read">15</span>
			</blockquote>    
                   
            
            <div class="data_text" id="print">
                <div id="content"><p style="text-indent: 2em; line-height: 37px; text-align: left;">
                
                	迁新居是一件让人非常高兴的事情，但是很多新的房子内总会有很浓的装修异味，住进一段时间后人就会感觉鼻腔发干、咽部发痒等症状，这是室内甲醛含量超标的情况所致，因此搬进新居或者房子装修不久的亲们要注意了，不要让甲醛危害到自己和家人的健康，如果感觉室内污染严重应立即采取方法治理，千万不要掉以轻心。

					装修产生污染是不可避免的，但是在中有很多方法是可以减少污染的，那么我们要如何才能减少甲醛等污染的产生呢
					
					1、合理装饰材料
					
					充分考虑室内空间的承载量和通风量。切记一味的追求装饰材料的美丽而忽视其危害性。世界那么大，多花点心思去找找，总会找到一款你满意的，美丽诚可贵，生命价更高!
					
					迁新居是一件让人非常高兴的事情，但是很多新的房子内总会有很浓的装修异味，住进一段时间后人就会感觉鼻腔发干、咽部发痒等症状，这是室内甲醛含量超标的情况所致，因此搬进新居或者房子装修不久的亲们要注意了，不要让甲醛危害到自己和家人的健康，如果感觉室内污染严重应立即采取方法治理，千万不要掉以轻心。

					装修产生污染是不可避免的，但是在中有很多方法是可以减少污染的，那么我们要如何才能减少甲醛等污染的产生呢
					
					1、合理装饰材料
					
					充分考虑室内空间的承载量和通风量。切记一味的追求装饰材料的美丽而忽视其危害性。世界那么大，多花点心思去找找，总会找到一款你满意的，美丽诚可贵，生命价更高!
      		
                </p>
                
                
                
                </div>
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
		
	
	
	
		});
	</script>




</body>
</html>