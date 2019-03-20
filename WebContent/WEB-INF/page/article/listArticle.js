
layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage','table','laytpl','laydate'],function(){
	var form = layui.form;
		layer = parent.layer === undefined ? layui.layer : parent.layer,  laydate = layui.laydate,
		laypage = layui.laypage,table = layui.table,
		$ = layui.jquery,
		active={
				search:function(){
				var title=$("#title").val(),
				newType=$("#newType").val(),
				verify=$("#verify").val(),
				pubtime=$("#pubtime").val();
				table.reload('artList',{
					page:{
						curr:1
					},
					where:{
						title:title,
						typeid:newType,
						verify:verify,
						pubtime:pubtime
					}
					
					
				});
			}	
				
		};
		
		//数据表格
		table.render({
			id:'artList',
		    elem: '#artList'
		    ,url: ctx+'/art/selAllNews' //数据接口
		    ,cellMinWidth: 60
		    ,limit:10//每页默认数
		    ,limits:[10,20,30,40]
		    ,cols: [[ //表头
              {type:'checkbox'}
              ,{title:'序号',type:'numbers',width:60}
              ,{field:'title', title: '标题', width:'23%',sort: true,templet:"#showdetail"}
              ,{field:'typeName', title: '类别',width:160, sort: true}
             ,{field:'imgurl', title: '图片',width:200,templet:'#showimg'}
              ,{field:'filename', title: '附件',width:175, sort: true,templet: '#fileTpl'}
              ,{field:'username', title: '发布人', width:150,sort: true}
              ,{field:'pubtime', title: '发布时间', width:170,sort: true}
              ,{field:'verify', title: '审核状态',width:100, sort: true,templet: '#verifyTpl',width:150}
              ,{title: '操作',toolbar: '#barEdit'}
		    ]]
				,page: true //开启分页
				,where: {timestamp: (new Date()).valueOf()}
			,done:function(res,curr,count){
	            hoverOpenImg();//显示大图
	        
	        }
		  });
		
		$(".search_btn").click(function (){		
			var type=$(this).data('type');
			active[type]?active[type].call(this):'';
		});
		
		
		//监听工具条
		  table.on('tool(test)', function(obj){
		    var data = obj.data,adminId=$("#adminId").val();
		    if(obj.event === 'del'){
		      layer.confirm('真的删除行么', function(index){
		    	  $.ajax({
		    		  url:ctx+'/art/delNewsById/'+data.id,
		    		  type : "get",
		    		  success : function(d){
		    			  if(d.code==0){
		    				  //obj.del();
		    				  table.reload('artList', {})
		    			  }else{
		    				  layer.msg("权限不足，联系超管！",{icon: 5});
		    			  }
		    		  }
		    	  })
		        layer.close(index);
		      });
		    } else if(obj.event === 'edit'){
		   
		      layer.open({
		    	  type: 2,
		    	  title:"编辑",
		    	  maxmin: true, //开启最大化最小化按钮
		          area: ['893px', '800px'],
		    	  content:ctx+"/art/showEditArticle?id="+data.id ,//这里content是一个普通的String
		    	  end:function(){
    				  table.reload('artList', {});//弹出窗口关闭后刷新表格
		    	  }
		      })
		    }else if(obj.event === 'verify'){
		      layer.open({
		    	  type: 2,
		    	  title:"审核",
		    	  area: ['380px', '320px'],
		    	  content:ctx+"/art/showVerifyArticle?id="+data.id ,//这里content是一个普通的String
		    	  end:function(){
    				  table.reload('artList', {});//弹出窗口关闭后刷新表格
		    	  }
		      })
		    }
		  });
		  

		   //日期时间选择器
		  laydate.render({
		    elem: '#pubtime'
		  });	  
		  
		  
		//获取文章列表
$.getJSON(ctx+'/art/selAllNewsTypes',function(res){
	var html="";
	for(var i =0 ;i<res.length;i++){
		html+="<option value=\""+res[i].id+"\">"+res[i].name+"</option>"
	}
	$("#newType").append(html);
	form.render();
})		  


function hoverOpenImg(){
    var img_show = null; // tips提示
    $('td img').hover(function(){
        var kd=$(this).width();
        kd1=kd*3;          //图片放大倍数
        kd2=kd*3+30;       //图片放大倍数
        var img = "<img class='img_msg' src='"+$(this).attr('src')+"' style='width:"+kd1+"px;' />";
       img_show = layer.tips(img, this,{
            tips:[2, 'rgba(41,41,41,.01)']
            ,area: [kd2+'px']
        , time: 5000
        });
        
        
    },function(){
        layer.close(img_show);
    });
    $('td img').attr('style','max-width:70px;display:block!important');
}

		  
	//添加角色
	$(".adminAdd_btn").click(function(){
		var index = layui.layer.open({
			title : "添加管理员",
			type : 2,
			content : ctx+"/sys/addAdmin",
			success : function(layero, index){
				layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			}
		})
		//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
		$(window).resize(function(){
			layui.layer.full(index);
		})
		layui.layer.full(index);
	})
	//批量发布
	
		$(".batchVerify").click(function(){
			var checkStatus = table.checkStatus('artList')
		      ,data = checkStatus.data,idStr='';
			if(data.length>0){
				$.each(data, function (n, value) {
					idStr+=value.id+',';
		          });
				 layer.confirm('真的要发布<strong>'+data.length+'</strong>条文章吗？', function(index){
						//调用删除接口
						  $.ajax({
					    		  url:ctx+'/art/verifyArticleByIds?id='+idStr,//接口地址
					    		  type : "get",
					    		  success : function(d){
					    			  if(d.code==0){
					    				  //删除成功，刷新父页面
					    				  layer.msg("已发布！",{icon: 1});
					    				  parent.layer.close(index)
					    				  table.reload('artList', {})
					    			  }else{
					    				  layer.msg("发布错误，稍后再试！",{icon: 5});
					    			  }
					    		  }
					    	  })
					  });
				}else{
					layer.msg("请选择要操作的文章！");
				}
		});

	
	
	//批量删除角色
	$(".batchDel").click(function(){
		var checkStatus = table.checkStatus('artList')
	      ,data = checkStatus.data,adminStr='';
//	      layer.alert(JSON.stringify(data));
		if(data.length>0){
			$.each(data, function (n, value) {
	              adminStr+=value.id+',';
	          });
	
			
			  adminStr=adminStr.substring(0,adminStr.length-1);
			  layer.confirm('真的要删除<strong>'+data.length+'</strong>条文章吗？', function(index){
				//调用删除接口
				  $.ajax({
			    		  url:ctx+'/art/delNewsById/'+adminStr,//接口地址
			    		  type : "get",
			    		  success : function(d){
			    			  if(d.code==0){
			    				  //删除成功，刷新父页面
			    				  layer.msg("已删除！",{icon: 1});
			    				  parent.layer.close(index)
			    				  table.reload('artList', {})
			    				  //parent.location.reload();
			    			  }else{
			    				  layer.msg("删除错误，稍后再试！",{icon: 5});
			    			  }
			    		  }
			    	  })
			  });
		}else{
			layer.msg("请选择要操作的数据！");
		}
		
	})
	
})

//格式化时间
function formatTime(datetime,fmt){
	if (parseInt(datetime)==datetime) {
	    if (datetime.length==10) {
	      datetime=parseInt(datetime)*1000;
	    } else if(datetime.length==13) {
	      datetime=parseInt(datetime);
	    }
	  }
	  datetime=new Date(datetime);
	  var o = {
	  "M+" : datetime.getMonth()+1,                 //月份   
	  "d+" : datetime.getDate(),                    //日   
	  "h+" : datetime.getHours(),                   //小时   
	  "m+" : datetime.getMinutes(),                 //分   
	  "s+" : datetime.getSeconds(),                 //秒   
	  "q+" : Math.floor((datetime.getMonth()+3)/3), //季度   
	  "S"  : datetime.getMilliseconds()             //毫秒   
	  };   
	  if(/(y+)/.test(fmt))   
	  fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));   
	  for(var k in o)   
	  if(new RegExp("("+ k +")").test(fmt))   
	  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	  return fmt;
}
