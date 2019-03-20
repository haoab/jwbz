<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="footer" class="footer or" style="width:1100px;">
	<div class="container or" style="width: 650px;">
		<div class="footer_l fl">
			<a class="imgA" target="_blank">
			<img src="${pageContext.request.contextPath}/css/front/img/dzjg.png"></a>
			 <p>
				欢迎你 第<b>${visitTimes}</b>位访问者 <br> 今日访问量<b> ${visitTimesToday} </b> 本月访问量<b>${visitTimesToMonth} </b>
			</p> 
			<!-- <p>欢迎访问警保处网站</p> -->
		</div>
		<div class="footer_r fl">
			Copyright 2018 All Rights Reserved. 
			<br> 淮安市公安局警保处 版权所有
			<br>电话：0517-83120232 地址：深圳路22号
			<br> 淮安市公安局大数据支队 技术支持<br>
		</div>
	</div>
</div>