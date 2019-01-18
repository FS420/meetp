<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>会议室</title>
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
		
		
		<form action="${path}/meetRoom/update.action" method="post">
			<div class="diyihang">
				<div class="huiyishi_left">会议室名称</div>
				<input type="text" name="roomname" value="${requestScope.meetroom.roomname}" class="input_update"  />
		 	</div>
			<div class="hang">
				<div class="huiyishi_left">位置</div>
				<input type="text" name="roomplace" value="${requestScope.meetroom.roomplace}"  class="input_update" />
			</div>
			<div class="hang">
				<div class="huiyishi_left">容量</div>
				<input type="text" name="holdnumber" value="${requestScope.meetroom.holdnumber}" class="input_update"/>
			</div>
			<div class="hang">
				<div class="huiyishi_left">是否可用</div>
				<div class="meetroommanage_isable">
					<c:choose>
						<c:when test="${requestScope.meetroom.isable==true}">
							<input type="radio" name="isable"  value="true" checked="checked"/>是
							<input type="radio" name="isable"  value="false" />否
						</c:when>
						<c:otherwise>
							<input type="radio" name="isable" value="true" />是
							<input type="radio" name="isable" value="false" checked="checked"/>否
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="hang">
				<div class="huiyishi_left">订购量</div>
				<input type="text" name="ordernumber" value="${requestScope.meetroom.ordernumber}" class="input_update"/>
			</div>
			
			<input type="hidden" name="id" value="${requestScope.meetroom.id}">
			
			<div class="beizhu">
				<div class="beizhu_left">备注</div>
				<textarea rows="20" cols="10" name="memo" class="input_update" style="width:235px; height:70px">${requestScope.meetroom.memo}
				</textarea>
			</div>
			
			<input type="hidden" name="ordernumber" value="0">
			
			<div class="bottom">
				<div class="bottom_left" style="height:100%"></div>
				<input type="submit" value="提交" class="button_submit" />
				<input type="reset" value="重置" class="button_reset" />
			</div>
		</form>
		
		<script>
			
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").eq(1).css("background-color","#A4968B");
		</script>
	</body>
</html>
