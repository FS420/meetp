<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>个人信息修改</title>
	</head>
  	<body background="../img/picture3.jpg">
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
		<form action="${path}/user/update.action" method="post" enctype="multipart/form-data">
			<div class="gerentouxiang">
				<div class="gerentouxiang_left">个人头像</div>
				<div class="gerentouxiang_picture">
				 	<img class="gerentouxiang_picture_img" src="${path}/upload/${sessionScope.user.headImg}" />
				</div>
				<div class="gerentouxiang_submit">
					<input type="file" name="img" />
				</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">账号</div>
				<input type="text" name="account" value="${sessionScope.user.account}" readonly="readonly" class="input_update"   />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">名称</div>
				<input type="text" name="name" value="${sessionScope.user.name}" required class="input_update"  />
			</div>
			
			<div class="usermanage_hang">
				<div class="huiyishi_left">所属部门</div>
				<input type="text" name="dept" value="${sessionScope.user.dept}" readonly="readonly" class="input_update" />
			</div>
			
			<div class="usermanage_hang">
				<div class="huiyishi_left">性别</div>
				<div class="usermanage_gender">
					<c:choose>
							<c:when test="${sessionScope.user.gender==true}">
									<input type="radio" name="gender" value="true" checked="checked">男
									<input type="radio" name="gender" value="false">女
							</c:when>
							<c:otherwise>
									<input type="radio" name="gender" value="true">男
									<input type="radio" name="gender" value="false" checked="checked">女
							</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">手机号</div>
				<input type="text" name="mobile" value="${sessionScope.user.mobile}" required class="input_update" />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">邮箱</div>
				<input type="text" name="email" value="${sessionScope.user.email}" required class="input_update" />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">生日</div>
				<div class="usermanage_birthday">
					<input id="dd" type="text" name="birthday"
					 value="<fmt:formatDate value='${sessionScope.user.birthday}' type='date' dateStyle='default'/>"
					 class="easyui-datebox"	data-options="required:true" />
				</div>
			</div>
			<div class="usermanage_bottom">
				<div class="bottom_left"></div>
				<!-- <input type="submit" value="提交" class="button_submit" />
				<input type="reset" value="重置" class="button_reset" /> -->
				<input class="btn btn-primary" style="margin:17px 0 0 200px" type="submit" value="提交">
				<input class="btn btn-primary" style="margin:17px 0 0 60px" type="reset" value="重置">
			</div>
		</form>
		<script>
			//导航变色
			$(".daohang").eq(1).css("background-color","#999")
			//左边变色
			$(".celan .usermanage_daohang").eq(0).css("background-color","#A4968B")
			
		</script>
	</body>
</html>
