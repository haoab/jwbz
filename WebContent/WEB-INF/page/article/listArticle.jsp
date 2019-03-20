<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>文章列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<script>
	var ctx = "${ctx}";
</script>

<style type="text/css">
.layui-badge {
    margin-top: 5px;
}

.layui-table-view .layui-form-checkbox[lay-skin="primary"] i {

    margin-top: 5px;
    }
</style>
</head>
<body class="childrenBody" style="padding: 5px 5px;">
  	<form class="layui-form" style="width: 90%;" id="aaf">
		<div class="layui-form-item">
        
       <!--    <div class="layui-inline">
            <label class="layui-form-label">作者</label>
            <div class="layui-input-inline">
              <input type="text" name="author" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div> -->
          <div class="layui-inline">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
              <input type="text" name="title" id="title" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">请选择分类</label>
			<div class="layui-input-block">
				<select name="newtype" lay-filter="newtype" 
					id="newType" style="zIndex:9999">
					<option value=""></option>
				</select>
			</div>
          </div>
          
            <div class="layui-inline">
            <label class="layui-form-label">请选择状态</label>
			<div class="layui-input-block">
				<select name="verify"  lay-filter="newtype" 
					id="verify" style="zIndex:9999">
					<option value=""></option>
					<option value="0">已发布</option>
					<option value="1">待审核</option>
					<option value="2">未通过</option>
					
				</select>
			</div>
          </div>
          <div class="layui-inline">
			<label class="layui-form-label">发布日期</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="pubtime"
					placeholder="yyyy-MM-dd">
			</div>
		</div>
          
          
          <div class="layui-inline">
            <a class="layui-btn search_btn" id="search_btn1" lay-submit="" data-type="search" lay-filter="search">
            	<i class="layui-icon">&#xe615;</i>查询
            </a>
          </div>
        </div>
</form>
<%-- 	<input type="hidden" id="adminId" value="<shiro:principal property="id"/>" /> --%>
	<blockquote class="layui-elem-quote list_search">
	<%-- 	<shiro:hasPermission name="sys:admin:save">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal adminAdd_btn"><i
					class="layui-icon">&#xe608;</i> 添加管理员</a>
			</div>
		</shiro:hasPermission> --%>
		<shiro:hasPermission name="sys:art:delete">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel"><i
					class="layui-icon">&#xe640;</i>批量删除</a>
			</div>
		</shiro:hasPermission>
		
			<shiro:hasPermission name="sys:art:verify">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal batchVerify"><i
					class="layui-icon">&#x1005;</i>批量发布</a>
			</div>
		</shiro:hasPermission>
		<!-- <div class="layui-inline">
			<div class="layui-form-mid layui-word-aux"></div>
		</div> -->

	<!-- 数据表格 -->
	<table id="artList" lay-filter="test"></table>
	</blockquote>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/page/article/listArticle.js"></script>
	<script type="text/html" id="barEdit">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<shiro:hasPermission name="sys:art:verify">
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="verify">审核</a>
		</shiro:hasPermission>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	
	<script type="text/html" id="verifyTpl">
 		 {{#  if(d.verify == '0'){ }} 		 
			<span class="layui-badge layui-bg-green">已发布</span>
  		{{#  } else if(d.verify == '1'){ }}
   			 <span class="layui-badge layui-bg-gray">待审核</span>
		
  		{{#  } else { }}
			<span class="layui-badge">未通过</span>
       	{{#    } }}

	</script>
	
<script type="text/html" id="fileTpl">
  {{#  if(d.fileurl != ""){ }}
    <a href="{{d.fileurl}}" target="_blank" title="点击下载查看附件" class="layui-table-link">{{d.filename}}</a>
  {{#  } else { }}
   <span class="layui-badge layui-bg-gray">无附件</span>
  {{#  } }}
	</script>
	
<script type="text/html" id="showimg">
    <img src="{{ d.imgurl}}"/>
</script>

<script type="text/html" id="showdetail">
   <a href="${ctx }/art/showDetailArticle?id={{d.id}}" target="_blank" title="点击阅览文章" class="layui-table-link">{{d.title}}</a>
</script>
</body>
</html>