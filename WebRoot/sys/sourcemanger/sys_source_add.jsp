<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>增加资源</title>
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
					<a href="${path}/sys/sourcemanger/sys_source.jsp">资源管理</a>
				</div>
				<div class="usermanage_daohang">
					<a href="${path}/sys/deptmanger/sys_dept.jsp">部门管理</a>
				</div>
		</div>
		
		<form action="${path}/source/addSource.action" method="post">
			<div class="usermanage_hang" style="margin-top:31px;">
				<div class="huiyishi_left">资源名</div>
				<select id="sourceName" name="name" class="selectSource">
                    <option>选择资源</option> 
   					<c:forEach items="${requestScope.sourceNameList}" var="sname">
   						<option value="${sname}">${sname}</option> 
   					</c:forEach>
               	</select>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">资源类别</div>
				<input type="text" name="type" class="input_update" />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">添加个数</div>
				<input type="text" name="free" class="input_update"  />
			</div>
			
			<input type="hidden" name="availabe" value="0">
			<div class="usermanage_bottom">
				<div class="bottom_left"></div>
				<!-- <input type="submit" value="提交" class="button_submit" />
				<input type="reset" value="重置" class="button_reset" /> -->
				<input class="btn btn-primary" style="margin:20px 0 0 250px" type="submit" value="提交">
				<input class="btn btn-primary" style="margin:20px 0 0 80px" type="reset" value="重置">
			</div>
		</form>
		
		<script>
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").eq(2).css("background-color","#A4968B");
		</script>
	</body>
</html>
