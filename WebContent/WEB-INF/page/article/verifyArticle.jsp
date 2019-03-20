<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>添加文章</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<script>  
        var ctx = "${ctx}";  
</script>

</head>
<body class="childrenBody" style="padding-top:50px;">
	<form class="layui-form" style="width: 90%;" id="aaf">
	
		<div class="layui-form-item">
			<label class="layui-form-label">请选择</label>
			<div class="layui-input-block">
				<select name="verify" lay-filter="verify" id="verify" >
					<option value=""></option>
				
				</select>
			</div>
		</div>
		

		<div class="layui-form-item">
			<div class="layui-input-block">
		<input type="hidden" id="id" name="id" value="${id}"/>
		<a class="layui-btn layui-btn-warm" id="verifySubmit">
			<i class="layui-icon">&#xe654;</i> 立即提交</a>
			</div>
		</div>
	</form>
		<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	
	<script type="text/javascript" src="${ctx }/js/jquery.3.3.1.js"></script>
	<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate','table'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate
		  ,table = parent.table === undefined ? layui.table : parent.table
		  ;
		  		//获取文章列表
	var html="";
	html+="<option value='0'>发布</option>";
	html+="<option value='2'>不显示</option>";
	$("#verify").append(html);
	form.render();
	
	
	
	
	$("#verifySubmit").click(function(){
			
		 $.ajax({
             type: "post",
             url: ctx+"/art/verifyArticle",
             data: {"id":$("#id").val(),"verify":$("#verify").val()},
             dataType: "json",
             success: function(data){
             	if(data.code==1){
             	    layer.alert('标题已存在，请修改。', {icon: 2});
             	}
             	if(data.code==0){
	             	layer.alert('审核成功。', {icon: 1}, function(index){
	             	     layer.close(index);
	             	 	 var index = parent.layer.getFrameIndex(window.name);
                          parent.layer.close(index);
					}); 
               }
             
             }
         });
	})
	   
  });
	
	
	
  </script>
</body>
</html>