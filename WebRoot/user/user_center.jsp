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
				<a href="${path}/user/user_center.jsp">个人信息查看</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/user/user_update.jsp">个人信息修改</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/user/user_pwd.jsp">修改密码</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/user/user_word.jsp">提交会议文档</a>
			</div>
		</div>
		<form>
			<div class="gerentouxiang">
				<div class="gerentouxiang_left">个人头像</div>
				<div class="gerentouxiang_picture">
				 	<img class="gerentouxiang_picture_img" src="${path}/upload/${sessionScope.user.headImg}" />
				</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">账号</div>
				<div class="usermanage_hang_right">${sessionScope.user.account}</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">名称</div>
				<div class="usermanage_hang_right">${sessionScope.user.name}</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">所属部门</div>
				<div class="usermanage_hang_right">${sessionScope.user.dept}</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">性别</div>
				<div class="usermanage_hang_right">
					<c:choose>
						<c:when test="${sessionScope.user.gender==true}">
							男
						</c:when>
						<c:otherwise>
							女
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">手机号</div>
				<div class="usermanage_hang_right">${sessionScope.user.mobile}</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">邮箱</div>
				<div class="usermanage_hang_right">${sessionScope.user.email}</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">生日</div>
				<div class="usermanage_hang_right">
					<fmt:formatDate value="${sessionScope.user.birthday}" type="date" dateStyle="default"/>
				</div>
			</div>
		</form>
		
		
		<script>
			//导航变色
			$(".daohang").eq(1).css("background-color","#999")
			//左边变色
			$(".celan .usermanage_first").css("background-color","#A4968B")
			
		</script>
  	</body>
</html>
