<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>后台界面</title>
	</head>
  		
  	<body background="${path}/img/picture3.jpg" style="width">
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
				<a href="${path}/user/selectAll.action?currentPage=1&keyWord=''">用户管理</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/sys/meetroommanger/sys_meetroom.jsp">会议室管理</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/sys/sourcemanger/sys_source.jsp">资源管理</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/sys/deptmanger/sys_dept.jsp">部门管理</a>
			</div>
		</div>
		<div class="sousuo">
			<div class="sousuo_mingcheng">角色名称</div>
			<input type="text" class="sousuo_input" style="padding-left:5px" />
			<!-- <input type="button" class="sousuo_anniu" value="搜索" /> -->
			<button type="button" class="btn btn-secondary" 
						 onclick="search()" style="margin-left:10px;width:56px;height:39px;">搜索</button>		 
		</div>
		<div class="huiyishixiangqing_biaotou_need">
			<div class="chakanhuiyishi_biaotou_beizhu">角色名称</div>
			<div class="chakanhuiyishi_biaotou_beizhu">权限</div>
			<div class="chakanhuiyishi_biaotou_beizhu">状态</div>
			 <div class="chakanhuiyishi_biaotou_bianji_houtai">编辑</div> 
						<div class="chakanhuiyishi_biaotou_sanchu_houtai">删除</div>
			
		</div>
		<div class="chakanhuiyishi_biaoxiang_need">
			<div class="chakanhuiyishi_biaoxiang_beizhu">方升</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">管理员</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">活跃</div>
			<div class="chakanhuiyishi_biaoxiang_bianji_houtai">
				<a href="managerole.html">
					<!-- <input type="button" value="编辑" class="chakanhuiyishi_biaoxiang_bianji_anniu">-->	
			        <button type="button" onclick="editUI('${user.id}')" style="margin-top:5px;" class="btn btn-outline-secondary">编辑</button>
				</a>
			</div>
			
			<div class="chakanhuiyishi_biaoxiang_sanchu_houtai">
				<!-- <input type="button" value="删除" class="chakanhuiyishi_biaoxiang_sanchu_anniu"> -->
				<button type="button" onclick="del('${user.id}')" style="margin-top:5px;" class="btn btn-outline-danger">删除</button>
			</div>
		</div>

		<div class="chakanhuiyishi_biaoxiang_need">
			<div class="chakanhuiyishi_biaoxiang_beizhu">张三</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">管理员</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">活跃</div>
			<div class="chakanhuiyishi_biaoxiang_bianji_houtai">
				<a href="managerole.html">
					<input type="button" value="编辑" class="chakanhuiyishi_biaoxiang_bianji_anniu">
				</a>
			</div>
			<div class="chakanhuiyishi_biaoxiang_sanchu_houtai"><input type="button" value="删除" class="chakanhuiyishi_biaoxiang_sanchu_anniu"></div>
		</div>

		<div class="chakanhuiyishi_biaoxiang_need">
			<div class="chakanhuiyishi_biaoxiang_beizhu">李四</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">管理员</div>
			<div class="chakanhuiyishi_biaoxiang_beizhu">活跃</div>
			<div class="chakanhuiyishi_biaoxiang_bianji_houtai">
				<a href="managerole.html">
					<input type="button" value="编辑" class="chakanhuiyishi_biaoxiang_bianji_anniu">
				</a>
			</div>
			<div class="chakanhuiyishi_biaoxiang_sanchu_houtai"><input type="button" value="删除" class="chakanhuiyishi_biaoxiang_sanchu_anniu"></div>
		</div>
		
		<script>
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_first").css("background-color","#A4968B");
		</script>

	</body>

</html>
