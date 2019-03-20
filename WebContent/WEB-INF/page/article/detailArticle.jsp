<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>文章预览--${news.title}</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
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
<body class="childrenBody" style="padding:10px 50px;" >
	    <div class="layui-card-body">
      
      	<div id="ContentPlaceHolder1_title" class="title">${news.title}</div>

            <blockquote class="layui-elem-quote layui-quote-nm" style="text-align: center;">
 				发表时间：
 				<span id="time">${news.pubtime}</span>
               	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
               	作者：
               	<span id="author">${news.username}</span>
			</blockquote>    
            <div class="data_text" id="print">
                <div id="content">
                <p style="text-indent: 2em; line-height: 37px; text-align: left;">
      				${news.content}
                </p>
                </div>
            </div>
			<c:if test="${news.filename!=''}">
			<blockquote class="layui-elem-quote" style="margin-top:20px;">附件：<a href="${news.fileurl}" target="_blank" title="点击下载查看附件" class="layui-link">${news.filename}</a></blockquote> 
        	</c:if>
        </div>
</body>
</html>