<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>添加文章</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<script>  
        var ctx = "${ctx}";  
</script>
<style type="text/css">

@media ( max-width :1240px) {
	.layui-form-item .layui-inline {
		width: 100%;
		float: none;
	}
}
.layui-form-selected dl {
	z-index: 99999;
}
.layui-btn+.layui-btn {
    margin-left: 0px;
}
</style>
</head>
<body class="childrenBody" style="padding-top:10px;">
	<form class="layui-form" style="width: 90%;" id="aaf">
		<div class="layui-form-item">
			<blockquote class="layui-elem-quote" style="margin-left: 5px;">
				标题：标题尽量小于20个字。</br>
				正文：可传本地图片，保存路径在D:/upload文件夹下。</br>
				缩略图：仅在添加图片新闻和警保风采的时候上传。图片分辨率为600px*280px，格式为*.jpg。需要更改图片，请删除后重新选择！</br>
				附件上传：支持类型：*.zip,*.rar,*.doc,*.docx,*.xls,*.xlsx。先选择文件，然后点击开始上传。只可以传一个文件，如有多个文件请压缩为一个压缩包后上传。</br>
			</blockquote>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">请选择分类</label>
			<div class="layui-input-block">
				<select name="newtype" lay-filter="newtype" lay-verify="required"
					id="newType" style="zIndex:9999">
					<option value=""></option>

				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">请输入标题</label>
			<div class="layui-input-block">
				<input type="text" id="title" class="layui-input userName"
					lay-verify="required" placeholder="请输入标题" name="title" value="${news.title}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">选择缩略图</label>
			<div class="layui-upload">
				<div class="layui-input-block">
					<button type="button" class="layui-btn" id="test1">上传图片</button>
					<a  class="layui-btn layui-btn-danger" style="display:none;" onclick="clearImg()" id="delimg">删除图片</a>
					
					<input type="hidden" id="imgUrl" />
				
					<div class="layui-upload-list" >
						<img class="layui-upload-img" style="display:none;width:600px;height:280px;" id="demo1">
						<p id="demoText"></p>
						
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">请输入正文</label>
			<div class="layui-input-block">
				<div class="layui-form-item" style="clear: none;">
					<div id="editor">
					${news.content}
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="test5"
					placeholder="yyyy-MM-dd HH:mm:ss">
			</div>
		</div>
	

		<div class="layui-form-item">
			<label class="layui-form-label">请选择附件</label>
			<div class="layui-input-block">
				<div class="layui-upload">
					<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
					<button type="button" class="layui-btn" id="test9">开始上传</button>
					<a class="layui-btn layui-btn-danger" style="display:none;" onclick="clearFile()" id="delFile">删除附件</a>
					<span class="" style="color: #999;" id="savedFileName"></span> 
					<input type="hidden" id="fileUrl" /> 
					<input type="hidden" id="fileName" />
				</div>
			</div>
		</div>

		<blockquote class="layui-elem-quote" style="margin-left: 5px;">
			<a class="layui-btn layui-btn-warm" lay-submit="" lay-filter="addAdmin"
				onclick="submitNews()" id="addNews"><i class="layui-icon">&#xe654;</i>   
				立即提交</a>
		</blockquote>
		<input type="hidden" value="${news.id}" id="newsid">
		<input type="hidden" value="${news.typeid}" id="newstypeid">
		<input type="hidden" value="${news.title}" id="newstitle">
		<input type="hidden" value="${news.imgurl}" id="newsimg">
		<input type="hidden" value="${news.filename}" id="newsfilename">
		<input type="hidden" value="${news.fileurl}" id="newsfileurl">
		<input type="hidden" value="${news.userid}" id="newsuserid">
	    <input type="hidden" value="${news.username}" id="newsusername">
		 <input type="hidden" value="${news.userfullname}" id="newsuserfullname">
		
				 <input type="hidden" value="${news.pubtime}" id="newspubtime">
		
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/jquery.3.3.1.js"></script>
	<script type="text/javascript" src="${ctx }/page/article/addArticle.js"></script>
	<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
	<script type="text/javascript" src="${ctx }/js/wangEditor.js"></script>


	<script type="text/javascript">
		var E = window.wangEditor;
		var editor = new E('#editor');
		// 或者 var editor = new E( document.getElementById('editor') )
		editor.customConfig.uploadImgServer = '${ctx }/file/editorUpload';
		editor.customConfig.uploadFileName = 'fileN';
		editor.create();
	</script>

	<script type="text/javascript">
	//要提交的全局变量
	var  title ;//标题
  	    var  typeid ;
  	    var content;
  	    var pubtime;
  	    var fileurl;
	    var filename;
	    var imgurl;
	    var  userid;
	   var username;
	    var userfullname;
	    var id;
//显示文章里的附图
	$(function(){
		if($("#newsimg").val()!=''){
			$("#delimg").fadeToggle("slow");
	   		 imgurl=$("#newsimg").val();
	    	 $("#imgUrl").val($("#newsimg").val());
	    	 $("#demo1").attr("src",$("#newsimg").val());
	    	 $("#demo1").fadeToggle("slow");
		}
//显示文章里的附件	
		if($("#newsfilename").val()!=''){
			  $("#delFile").fadeToggle("slow");
			  $("#savedFileName").html("<i class=\"layui-icon\">&#xe655;</i> "+$("#newsfilename").val());
		      $("#fileUrl").val($("#newsfileurl").val());
		      $("#fileName").val($("#newsfilename").val());
		       fileurl=$("#newsfileurl").val();
	   		   filename=$("#newsfilename").val();
		}
	});

		
	layui.use(['upload','form','layer', 'laydate'],function(){
	  var $ = layui.jquery
	  ,upload = layui.upload
	   ,laydate = layui.laydate
	   ,layer=layui.layer
	   ,form=layui.form;
	  
	  //获取文章列表
		$.getJSON(ctx+'/art/selAllNewsTypes',function(res){
			var html="";
			for(var i =0 ;i<res.length;i++){
				if($("#newstypeid").val()==i+1){
					html+="<option  selected=\"\" value=\""+res[i].id+"\">"+res[i].name+"</option>";
				}else{
					html+="<option value=\""+res[i].id+"\">"+res[i].name+"</option>";
				}
				
			}
			$("#newType").append(html);
				form.render();
		})
	  
	  //选完文件后不自动上传
	  upload.render({
	    elem: '#test8'
	    ,url: '${ctx }/file/savaAttachment'
	    ,auto: false
	    ,accept: 'file' //普通文件
	     ,exts: 'zip|rar|7z|doc|xls|docx|xlsx' //只允许上传压缩文件
	    //,multiple: true
	    ,bindAction: '#test9'
	    ,size:20480
	     ,before:function(){
	    		layer.load();
	    	
	    }
	    ,done: function(res){
	      layer.closeAll('loading');
	      $("#delFile").fadeToggle("slow");
	      layer.alert('附件上传成功,现在可以提交文章。', {icon: 1}); //这时如果你也还想执行yes回调，可以放在第三个参数中。
	      $("#savedFileName").html("<i class=\"layui-icon\">&#xe655;</i> "+res.data.fileName);
	      $("#fileUrl").val(res.data.src);
	      $("#fileName").val(res.data.fileName);
	      
	      console.log(res)
	    }
	    ,error:function(){
	    layer.closeAll(loading);
	    }
	  });
		    //日期时间选择器
		  laydate.render({
		    elem: '#test5'
		    ,type: 'datetime'
		    ,value:$("#newspubtime").val()
		  });
		  
		    //文章附图图片上传
		  var uploadInst = upload.render({
		    elem: '#test1'
		    ,url: '${ctx }/file/savaAttachment'
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      $(".layui-upload-list").css("display","block");
		      obj.preview(function(index, file, result){
		        $('#demo1').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg('上传失败');
		      }
		      //上传成功
		      console.log(res.data.src);
		      $("#imgUrl").val(res.data.src);
		      
		      if($("#newsimg").val()==''){ $("#demo1").fadeToggle("slow");}
		      	    	
		      
		      $("#delimg").fadeToggle("slow");
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
  });
  
  	
	    
  function submitNews(){
  	     title = $("#title").val();//标题
  	     typeid =$("#newType").val();
  	     content=editor.txt.html();
  	     pubtime=$("#test5").val();
  	     fileurl= $("#fileUrl").val();
	     filename= $("#fileName").val();
	     imgurl=$("#imgUrl").val();
	     userid=$("#newsuserid").val();
	     username=$("#newsusername").val();
	     userfullname=$("#newsuserfullname").val();
	   	 id=$("#newsid").val();
	    if(title==""){
	    	return;
	    }
	    if(typeid==""){
	    	return;
	    }	    
	     if(typeid=="1"||typeid=="7"){
	    	if(imgurl==""){
	    		 layer.tips('请选择图片后再提交', '#test1', {
					  tips: [1, '#3595CC'],
					  time: 4000
				});
				return;
	    	}
	    }
	    
	    if(content=="<p><br></p>"){
		    layer.tips('请输入文章正文', '#editor', {
				  tips: [2, '#3595CC'],
				  time: 4000
				});
				return ;
	    }
	    
	    var data={"title":title,"typeid":typeid, "content":content,
	              "pubtime":pubtime,"fileurl":fileurl,
	              "filename":filename,"imgurl":imgurl
	              ,"userid":userid,"username":username,"userfullname":userfullname,"id":id};
	  //  console.log(data);
	    $.ajax({
             type: "post",
             url: ctx+"/art/updNews",
             data: data,
             dataType: "json",
             success: function(data){
             	if(data.code==1){
             	    layer.alert('标题已存在，请修改。', {icon: 2});
             	}
             	if(data.code==0){
	             	layer.alert('文章修改成功，在审核通过后发表。', {icon: 1}, function(index){
						  layer.close(index);
						   	 var index = parent.layer.getFrameIndex(window.name);
                          parent.layer.close(index);
						  //parent.location.reload();//页面刷新
					}); 
               }
             
             }
         });
  }
  
  
  //清除图片
  
  function clearImg(){
  		if($("#imgUrl").val()==""){
  			 layer.tips('未选择图片', '#test1', {
					  tips: [1, '#3595CC'],
					  time: 4000
				});
  			return;
  		}
  	    $(".layui-upload-list").fadeToggle("slow");
	    imgurl="";
	    $("#imgUrl").val("");
	    $("#delimg").fadeToggle("slow"); 
  }
  function clearFile(){
  		if($("#fileUrl").val()==""){
  			 layer.tips('未选择文件', '#test8', {
					  tips: [1, '#3595CC'],
					  time: 4000
				});
  			return;
  		}
	    $("#savedFileName").html("");
	    fileurl="";
	    filename="";
	    $("#fileUrl").val("");
	    $("#fileName").val("");
	   $("#delFile").fadeToggle("slow");
	    
  }
  
  
  $("#addNews").hover(function(){
   	layer.tips('点击保存更改', '#addNews', {
					  tips: [2, '#3595CC'],
					  time: 4000
	});
},function(){
	layer.closeAll('tips'); //关闭所有的tips层    

});
  </script>
</body>
</html>