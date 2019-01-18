<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>预约</title>
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
	
	<form action="${path}/order/order.action" method="post">

		<div class="huiyiyuyue_huiyishi">
			<div class="huiyiyuyue_huiyishi_left">会议室</div>
			<div class="huiyiyuyue_huiyishi_xuanzhehuiyishi">
				<select name="meetroomname" id="" class="huiyiyuyue_huiyishi_select">
					<option>请选择</option>
					<c:forEach items="${requestScope.meetroomList}" var="meetroom">
						<option value="${meetroom.id}">${meetroom.roomplace}</option>
					</c:forEach>
				</select> 
			</div>
		</div>
			
		<div class="huiyiyuyue_huiyiyiti">
			<div class="huiyiyuyue_huiyiyiti_left">预约人</div>
			<div class="huiyiyuyue_huiyiyiti_right">
				<input type="text" name="applicant" readonly="readonly" value="${sessionScope.user.name}"  class="huiyiyuyue_huiyiyiti_input">
			</div>
		</div>
		
		<div class="huiyiyuyue_huiyiyiti">
			<div class="huiyiyuyue_huiyiyiti_left">记录者</div>
			<div class="huiyiyuyue_huiyishi_xuanzhehuiyishi">
				<select name="recorderdept" onchange="selRecorder()" id="selectDept" class="huiyiyuyue_huiyishi_select">
					<option>请选择部门</option>
					<c:forEach items="${requestScope.deptList}" var="dept">
						<option value="${dept.id}">${dept.name}</option>
					</c:forEach>
				</select> 
				<select name="recorder" id="selectRecorder" class="huiyiyuyue_huiyishi_select">
					<option>请选择记录者</option>
				</select> 
			</div>
		</div>
		
		<div class="huiyiyuyue_huiyiyiti">
			<div class="huiyiyuyue_huiyiyiti_left">预约时段</div>
			<div class="huiyiyuyue_huiyiyiti_right">
				<input type="text" name="time" class="easyui-datetimebox" data-options="required:true" />&nbsp;-&nbsp;<input type="text" name="endtime" class="easyui-datetimebox"	data-options="required:true" />
			</div>
		</div>
		<div class="huiyiyuyue_huiyiyiti">
			<div class="huiyiyuyue_huiyiyiti_left">会议议题</div>
			<div class="huiyiyuyue_huiyiyiti_right">
				<input type="text" name="name" required="required"  class="huiyiyuyue_huiyiyiti_input">
			</div>
		</div>

		<div class="huiyiyuyue_huiyishi" style="margin-top:1px">
			<div class="huiyiyuyue_huiyishi_left">资源预约</div>
			<div class="huiyiyuyue_huiyishi_yuyuetime">
				<select name="sourceName" id="seSource" onchange="selectSource()" class="huiyiyuyue_huiyishi_select">
					<option>请选择设备</option>
					<c:forEach items="${requestScope.snameList}" var="sname">
						<option value="${sname}">${sname}</option>
					</c:forEach>
				</select>
			</div>
			<div class="huiyiyuyue_huiyishi_riqi">型号选择:
				<select name="type" id="selectType" class="huiyiyuyue_huiyishi_select" style="margin-left:0px;" >
					<option>请选择型号</option>
				</select>
			</div>
		</div>
		
		<div class="huiyiyuyue_canhuirenyuan">
			<div class="huiyiyuyue_canhuirenyuan_left">参会人员</div>
			<div class="huiyiyuyue_canhuirenyuan_right">
				<div class="huiyiyuyue_canhuirenyuan_bumen">
					<c:forEach items="${requestScope.deptList}" var="dept">
						<input type="button" id="${dept.id}" onclick="setColor('${dept.id}')" class="huiyiyuyue_canhuirenyuan_bumenanniu" value="${dept.name}">
					</c:forEach>
				</div>
				
				<input type="hidden" id="deptId" name="dept.id" value="">
				
				<div class="fenge"></div>
				<div class="huiyiyuyue_canhuirenyuan_xuzherenyuan">
					选择人员：<br>
				</div>
				<div class="fenge"></div>
				<div class="huiyiyuyue_canhuirenyuan_yixuan">
					已选人员名单显示：<br>
				</div>
			</div>
		</div>
		
		
		<div class="huiyiyuyue_huiyiyiti">
			<div class="huiyiyuyue_huiyiyiti_left">备注</div>
			<div class="huiyiyuyue_huiyiyiti_right">
				<textarea  name="memo" rows="1" cols="50" style="margin-bottom:1px"></textarea>
			</div>
		</div>
		
		
		<div class="huiyiyuyue_last">
			<div class="huiyiyuyue_last_left">操作</div>
			<div class="huiyiyuyue_last_right">
				<!--
			    <input type="submit" class="huiyiyuyue_button_submit" value="提交">
				<input type="reset" class="huiyiyuyue_button_reset" value="重置"> 
				-->
				<input class="btn btn-primary" style="margin:5px 0 0 250px" type="submit" value="提交">
				<input class="btn btn-primary" style="margin:5px 0 0 80px" type="reset" value="重置">
			</div>
		</div>
	</form>
	
		<script>
			
			//选择记录者
			function selRecorder(){
				$.ajax({
	               url:"${path}/user/selectPerson.action",
	               data:{deptId:$("#selectDept").val()},
	               type:"post",
	               dataType:"json",
	               success:function(result){
	               		$("#selectRecorder option:gt(0)").remove(); //删除之前的
		                for(var i=0;i<result.length;i++){
		                	var option=$("<option  value="+result[i].id+">").html(result[i].name);
		                	$("#selectRecorder").append(option);
		                }
	               },
	               error:function(){
	               		alert("查找错误");
	               }
	            }); 
			}
		
			//已选择的人员
			function sureUser(name){
				var sureUserList=$(".huiyiyuyue_canhuirenyuan_yixuan .huiyiyuyue_canhuirenyuan_checkbox");
				var i=0;
				for(;i<sureUserList.length;i++){
					var user_div=sureUserList.eq(i);   //juqery  
					if(user_div.text()==name){  //说明有啦，那就要删除
						sureUserList.eq(i).remove();
						break;
					}
				}
				if(i==sureUserList.length){   //说明没有，那就要添加
					var div=$("<div>").addClass("huiyiyuyue_canhuirenyuan_checkbox");
					div.text(name);
					$(".huiyiyuyue_canhuirenyuan_yixuan").append(div);
				}
			}
		
			//选择部门
			function setColor(id){
				//隐藏选择的部门id 
				$("#deptId").val(id);
			
				var idd="#"+id;
				$(idd).css("background-color","red").siblings().css("background-color","#333");
			
				//ajax 获得部门的人员
				$.ajax({
	               url:"${path}/user/selectPerson.action",
	               data:{deptId:id},
	               type:"post",
	               dataType:"json",
	               success:function(result){
	               		$(".huiyiyuyue_canhuirenyuan_checkbox").remove(); //删除之前的
		                for(var i=0;i<result.length;i++){
		                	var div=$("<div>").addClass("huiyiyuyue_canhuirenyuan_checkbox");
		                	div.text(result[i].name)                              
		                	var checkbox=$("<input type='checkbox' name='uid' onclick=\"sureUser('"+result[i].name+"')\" value="+result[i].id+">");
		                	div.append(checkbox);
		                	$(".huiyiyuyue_canhuirenyuan_xuzherenyuan").append(div);
		                }
	               },
	               error:function(){
	               		alert("查找错误")
	               }
	            }); 
			}
			
			//导航变色
			$(".daohang").eq(3).css("background-color","#999");
			//根据资源名找类型
			function selectSource(){
				$.ajax({
	               url:"${path}/source/selectType.action",
	               data:{sourceName:$("#seSource").val()},
	               type:"post",
	               dataType:"json",
	               success:function(result){
	               		$("#selectType option:gt(0)").remove(); //删除之前的
		                for(var i=0;i<result.length;i++){
		                	var option=$("<option>").html(result[i].type);
		                	$("#selectType").append(option);
		                }
	               },
	               error:function(){
	               		alert("查找错误")
	               }
	            }); 
			}
			
		</script>
	</body>
</html>
