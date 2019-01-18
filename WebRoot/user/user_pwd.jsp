<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>修改密码</title>
	</head>
	
	<c:choose>         
		<c:when test="${requestScope.error=='原密码错误'}">
			<script>
				alert('您输入的原密码错误！！！');
			</script>
		</c:when>
		<c:when test="${requestScope.right=='修改密码成功'}">
			<script>
				alert('修改密码成功！！！');
			</script>
		</c:when>
		<c:when test="${requestScope.equal=='两次密码不一致'}">
			<script>
				alert('两次密码不一致');
			</script>
		</c:when>
	</c:choose>
	
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
		
		<form action="${path}/user/updatePwd.action" method="post">
			<div class="usermanage_hang" style="margin-top:70px;">
				<div class="huiyishi_left">密码</div>
					<input type="password" required name="oldPwd" class="input_update"  />
				</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">新密码</div>
					<input type="password" required name="newPwd" class="input_update"  />	
				</div>
			<div class="usermanage_hang">
				<div class="huiyishi_left">确认密码</div>
					<input type="password" required name="re_newPwd" class="input_update"  />
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
			$(".celan .usermanage_daohang").eq(1).css("background-color","#A4968B")
			
			
			
			
		</script>
	</body>	
  	
  	
</html>
