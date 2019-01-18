<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>会议资源</title>
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
		<div class="celan_need">
				<div class="usermanage_first">
					<a href="${path}/sys/sys_main.jsp">角色权限管理</a>
				</div>
				<div class="usermanage_daohang">
					<a href="${path}/user/selectAll.action?currentPage=1">用户管理</a>
				</div>
				<div class="usermanage_daohang">
					<a href="${path}/sys/meetroommanger/sys_meetroom.jsp">会议室管理</a>
				</div>
				<div class="usermanage_daohang">
					<a href="${path}/sys/deptmanger/sys_dept.jsp">资源管理</a>
				</div>
				<div class="usermanage_daohang">
					<a href="${path}/sys/deptmanger/sys_dept.jsp">部门管理</a>
				</div>
		</div>
		<div class="source_dg">
				<table id="dg"></table>
		</div>
		<script>
				$("#dg").datagrid({    
		    		url:"${path}/source/selectPageUseDyc.action?time="+new Date().getTime(),    
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
									 window.location.href="/meetroom/source/findSourceName.action";
							      }
							   },
							   {
								  iconCls: 'icon-edit',
								  text:"修改",
								  handler: function(){
								   	  var source = $("#dg").datagrid("getSelected");
									  window.location.href="/meetroom/source/updateUI.action?id="+source.id;
								  }
							   },
							   {
								  iconCls: "icon-remove",
								  text:"删除",
								  handler: function(){
								      var source = $("#dg").datagrid("getSelected");
									  window.location.href="/meetroom/source/del.action?id="+source.id;
								  }
							   },
							   {
								  text:"<input id='search' type='text' name='keyWord'>",
							   }
							 ],
		    		
		    		columns:[[    
		        				{field:"name",title:"资源名",width:150,align:"center"},    
		        				{field:"type",title:"资源类别",width:150,align:"center"},    
		        				{field:"free",title:"空闲个数",width:150,align:"center"},	 
		        				{field:"availabe",title:"正用个数",width:150,align:"center"},    
		    				]] ,
		 		});  
			   $("#search").searchbox({ 
					searcher:function(value,name){
					   $("#dg").datagrid("load",{  //用之前的url去加载
							name: "%"+value+"%"	   //这的name就是name,不是上面的变量name
					   });		
					}, 
					prompt:'请输入关键字' 
			   }); 
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").eq(2).css("background-color","#A4968B");
		</script>
	</body>
</html>
