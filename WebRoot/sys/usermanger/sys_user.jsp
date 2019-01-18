<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>用户管理</title>
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
			
		<form action="${path}/user/selectAll.action" id="form" method="post">
			<div class="sousuo">
				<div class="sousuo_mingcheng">用户名称：</div>
				<input type="text" placeholder="请输入用户名" class="sousuo_input" />
				
				<!-- <input type="button" class="sousuo_anniu" 
						 onclick="search()" value="搜索" /> -->
				<button type="button" class="btn btn-secondary" 
						 onclick="search()" style="margin-left:10px;width:56px;height:39px;">搜索</button>		 
			</div>
			<div class="huiyishixiangqing_biaotou_need">
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_name">用户名</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_account">账号</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_dept">所属部门</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_gender">性别</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_mobile">电话</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_email">email</div>
				<div class="chakanhuiyishi_biaotou_mingcheng mingcheng_birthday">生日</div>
				<div class="chakanhuiyishi_biaotou_bianji_houtai">编辑</div>
				<div class="chakanhuiyishi_biaotou_sanchu_houtai">删除</div>
			</div>
			
			<c:forEach items="${requestScope.pb.pageData}" var="user">
					<div class="chakanhuiyishi_biaoxiang_need">
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_name">${user.name}</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_account">${user.account}</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_dept">${user.dept}</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_gender">
							<c:choose>
								<c:when test="${user.gender==true}">
									男
								</c:when>
								<c:otherwise>
									女
								</c:otherwise>
							</c:choose>
						</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_mobile">${user.mobile}</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_email">${user.email}</div>
						<div class="chakanhuiyishi_biaoxiang_mingcheng mingcheng_birthday">
							<fmt:formatDate value="${user.birthday}" type="date" dateStyle="default"/>
						</div>
						 <div class="chakanhuiyishi_biaoxiang_bianji_houtai">
							<%-- 原来自己的 <input type="button" onclick="editUI('${user.id}')" value="编辑" class="chakanhuiyishi_biaoxiang_bianji_anniu"> --%>
							<button type="button" onclick="editUI('${user.id}')" style="margin-top:5px;" class="btn btn-outline-secondary">编辑</button>
						</div>
						<div class="chakanhuiyishi_biaoxiang_sanchu_houtai">
							<%--<input type="button" onclick="del('${user.id}')" value="删除" class="chakanhuiyishi_biaoxiang_sanchu_anniu"> --%>
							<button type="button" onclick="del('${user.id}')" style="margin-top:5px;" class="btn btn-outline-danger">删除</button>	
						</div>
					</div>
			</c:forEach>
			<div class="page">
						总共${requestScope.pb.totalCount}条记录&nbsp;
		    			当前${requestScope.pb.currentPage}页 &nbsp;
		     			共${requestScope.pb.totalPage}页&nbsp;            
		            <a href="javascript:doGoPage(1)">
					    <span class="Prev">首页 </span> &nbsp;
				    </a>  
					<a href="javascript:doGoPage(${requestScope.pb.currentPage-1})">
                       	<span class="PNumber">上一页</span> &nbsp;
                   	</a> 
                  	<a href="javascript:doGoPage(${requestScope.pb.currentPage+1})">
                       	<span class="PNumber">下一页</span> &nbsp;
                    </a>
                    <a href="javascript:doGoPage(${requestScope.pb.totalPage})">
					    <span class="Next"> 末页<i></i> </span> &nbsp;&nbsp;
				    </a>
				        到&nbsp;<input id="pageNo" name="pageNo" type="text" style="width: 30px;"
					onkeypress="if(event.keyCode == 13){doGoPage(this.value);}"
					min="1"
					max="${requestScope.pb.totalPage}" 
					value="${requestScope.pb.currentPage}" />
			</div>
		</form>
		
		
		
		
		<script>
			
			function editUI(id){
				$("#form")[0].action="/meetroom/user/editUI.action?id="+id;
				$("#form")[0].submit();	
			}
			
			//删除
			function del(id){
				$("#form")[0].action="/meetroom/user/del.action?id="+id;
				$("#form")[0].submit();		
			}
		
			//分页
			function doGoPage(currentPage){
				$("#form")[0].action="/meetroom/user/selectAll.action?currentPage="+currentPage;
				$("#form")[0].submit();
			}
			//搜索
			function search(){
				var keyWord=$(".sousuo_input").val();
				$("#form")[0].action="/meetroom/user/selectAll.action?currentPage=1&keyWord="+keyWord;
				$("#form")[0].submit();				
			}
			//导航变色
			$(".daohang").eq(2).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").eq(0).css("background-color","#A4968B");
		</script>
		
		
	</body>
</html>
