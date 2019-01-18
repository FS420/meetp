<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title></title>
	</head>
  	<body background="${path}/img/picture3.jpg">
		<div class="kaitou">
			<div class="kongyu"></div>
			<div class="biaoti">CMS</div>
			<div class="daohang">
				<a href="${path}/user/main.action">首页</a>
			</div>
			<div class="daohang">
				<a href="${path}/user/user_center.jsp">个人中心</a>
			</div>
			<div class="daohang">
				<a href="${path}/sys/sys_main.jsp">后台管理</a>
			</div>
			<div class="daohang">
				<a href="${path}/order/orderUI.action">我要预约</a>
			</div>
			<div class="daohang">
				<a href="${path}/meeting/meeting_needJoin.jsp">会议查看</a>
			</div>
			<div class="huanying">欢迎&nbsp;
				<span class="account">${sessionScope.user.name}</span>&nbsp;登录
			</div>
			<div class="daohang">
				<a href="${path}/user/exit.action">退出</a>
			</div>
		</div>
		
		<div class="celan">
			<div class="usermanage_first">
				<a href="${path}/meeting/meeting_needJoin.jsp">会议查看</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/meeting/meeting_alreadyJoin.jsp">已经参加会议</a>
			</div>
		</div>
		
		<div class="source_dg">
			<table id="dg"></table>
		</div>
		<script>
		
			// 下载文件
			function download(meetid,name){
				//alert(meetid);
				//alert(name)
				// 跳转到下载后台
				window.location.href = "${path}/meeting/download.action?meetId="+meetid+"&name="+name;
			}
		
			// 请求所有的文档
			$("#dg").datagrid({    
		    		url:"${path}/meeting/selectPageWordUseDyc.action?meetId=${requestScope.meetId}&retime="+new Date().getTime(),    
		    		pageSize:10,     	  //初始化页面的大小
		    		fitColumns:true,	  //自动适应列的大小
		    		singleSelect:true,	  //只允许选择一行
		    		pageList:[5,10,20],	  //页面大小选择列表
		    		pagination:true,	  //显示工具栏
		    		pagePosition:"bottom",//工具栏的位置
		    		toolbar: [
		    		 		   {
								  iconCls: 'icon-add',
								  text:"增加",
								  handler: function(){
									 window.location.href="/meetroom/order/orderUI.action";
							      }
							   },
							   {
								  text:"<input id='search' type='text' name='keyWord'>",
							   }
							 ],
		    		
		    		columns:[[    
		        				{field:"name",title:"会议名称",width:150,align:"center"},    
		        				{
		        					field:"meetingId",
		        					title:"下载",
		        					width:150,
		        					align:"center",
		        					formatter : function(value, row, text) {
		        						// row表示这一行
			 							return "<input class='btn btn-primary' type='submit' value='下载文件' onclick=\"download('"+value+"','"+row.name+"')\">";	
			 						}
		        				}, 
		    				]],
		 		});  
		 		
		 		
		    $("#search").searchbox({ 
				 searcher:function(value,name){
				    $("#dg").datagrid("load",{ //用之前的url去加载
				 		 name: "%"+value+"%"   //name就是实体的属性，存到meeting中 ,不是存到page中的keyWord
				    });		
				 }, 
				 prompt:'请输入关键字' 
		    }); 
		    
		    
			//导航变色
			$(".daohang").eq(4).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").css("background-color","#A4968B");
		</script>
  	</body>
</html>
