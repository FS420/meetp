<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>用户编辑</title>
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
			
		<form action="${path}/user/update_sys.action" method="post" enctype="multipart/form-data">
			<div class="gerentouxiang">
				<div class="gerentouxiang_left">个人头像</div>
				<div class="gerentouxiang_picture">
				 	<img class="gerentouxiang_picture_img" src="${path}/upload/${requestScope.editUser.headImg}" />
				</div>
				<div class="gerentouxiang_submit">
					<input type="file" name="img" />
				</div>
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">账号</div>
				<input type="text" name="account" value="${requestScope.editUser.account}" readonly="readonly" class="input_update"   />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">名称</div>
				<input type="text" name="name" value="${requestScope.editUser.name}" required class="input_update"  />
			</div>
			
			<div class="usermanage_hang">
				<div class="huiyishi_left">所属部门</div>
				<input type="text" name="dept" value="${requestScope.editUser.dept}" readonly="readonly" class="input_update" />
			</div>
			
			<div class="usermanage_hang">
				<div class="huiyishi_left">性别</div>
				<div class="usermanage_gender">
					<c:choose>
							<c:when test="${requestScope.editUser.gender==true}">
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
				<input type="text" name="mobile" value="${requestScope.editUser.mobile}" required class="input_update" />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">邮箱</div>
				<input type="text" name="email" value="${requestScope.editUser.email}" required class="input_update" />
			</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">生日</div>
				<div class="usermanage_birthday">
					<input id="dd" type="text" name="birthday"
					 value="<fmt:formatDate value='${requestScope.editUser.birthday}' type='date' dateStyle='default'/>"
					 class="easyui-datebox"	data-options="required:true" />
				</div>
			</div>
			<div class="usermanage_bottom">
				<div class="bottom_left"></div>
				<input type="submit" value="提交" class="button_submit" /><input type="reset" value="重置" class="button_reset" />
			</div>
			
			<input type="hidden" name="id" value="${requestScope.editUser.id}">
			<input type="hidden" name="password" value="${requestScope.editUser.password}">
			<input type="hidden" name="headImg" value="${requestScope.editUser.headImg}">
			
		</form>
		
		
		
		
		<script>
			
			
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").eq(0).css("background-color","#A4968B");
		</script>
		
		
	</body>
</html>
