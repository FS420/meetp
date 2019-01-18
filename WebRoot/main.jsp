<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>主页</title>
		<script src="${path}/css/datetimepicker/jquery-1.12.4.min.js"></script>
	    <script src="${path}/css/datetimepicker/bootstrap/js/bootstrap.js"></script>
	    <link rel="stylesheet" href="${path}/css/datetimepicker/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" href="${path}/css/datetimepicker/bootstrap-datetimepicker.min.css">
	    <script src="${path}/css/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	    <script src="${path}/css/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
		<style>
			a{
				color:#000000;
			}
		</style>
	</head>
  		
   	<body background="${path}/img/picture3.jpg">
		<div class="kaitou">
			<div class="kongyu"></div>
			<div class="biaoti">CMS</div>
			<div class="daohang">
				<a href="${path}/user/main.action" class="">首页</a>
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
		<div class="huiyitongzhi">
			<div class="huiyitongzhi_huiyitongzhi">我的会议通知</div>
			<div class="huiyitongzhi_huiyi">年终总结大会</div>
			<div class="huiyitongzhi_yanjingzhe">方升</div>
			<div class="huiyitongzhi_huiyishi">一号会议室 </div>
			<div class="huiyitongzhi_sijian">2018年10月14日 14:30</div>
		</div>
		<div class="zuijingyuyue">
			<div class="zuijingyuyue_wodezuijingyuyue">我的最近预约</div>
			<div class="chakangengduo">更多</div><br><br>
			<hr>
			<div class="zuijinghuiyi_huiyi_youyanse">2017-3-8&nbsp;&nbsp;&nbsp;&nbsp;14:30-15:00&nbsp;&nbsp;&nbsp;&nbsp;年终总结大会</div>
			<div class="zuijinghuiyi_huiyi">2017-3-8&nbsp;&nbsp;&nbsp;&nbsp;14:30-15:00&nbsp;&nbsp;&nbsp;&nbsp;年终总结大会</div>
			<div class="zuijinghuiyi_huiyi">2017-3-8&nbsp;&nbsp;&nbsp;&nbsp;14:30-15:00&nbsp;&nbsp;&nbsp;&nbsp;年终总结大会</div>
			<div class="zuijinghuiyi_huiyi">2017-3-8&nbsp;&nbsp;&nbsp;&nbsp;14:30-15:00&nbsp;&nbsp;&nbsp;&nbsp;年终总结大会</div>
			<div class="zuijinghuiyi_huiyi">2017-3-8&nbsp;&nbsp;&nbsp;&nbsp;14:30-15:00&nbsp;&nbsp;&nbsp;&nbsp;年终总结大会</div>
		</div>
		
		
		<div class="shouye_huiyishiyulan">
			
			<div class="table_top">
				<div class="note pull-left">
					<span style="background-color: #0F3;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span>本人</span>
					<span style=" background-color: #C60;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span>他人</span>
				</div>
				<div class="calender pull-right">
			      <div class='input-group' style="width: 230px;">
			            <input type='text'  class="form-control" id='dateTimePicker' placeholder="请选择日期"/>
			            <span class="input-group-addon">
			                <span class="glyphicon glyphicon-calendar"></span>
			            </span>
			      </div>
				</div>
			</div>
			
			<table class="table table-bordered table-striped">
			    <thead>
			        <tr>
			            <td>会议室/时间</td>
			            <c:forEach items="${requestScope.timeList}" var="time">
			            	<td>${time}:00</td>
			            </c:forEach>
			        </tr>
			    </thead>
			    <tbody>
					  ${requestScope.html}
			    </tbody>
			</table>
		</div>
	<script type="text/javascript">
		Date.prototype.yuan = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };
		var CHOOSE_DATE;
		$("#dateTimePicker").datetimepicker({
                minView: "month",
                language: "zh-CN",
                sideBySide: true,
                format: 'yyyy-mm-dd',          // 日期显示格式
                startDate: new Date(),         // 之前的日期不能选
                autoclose:false,
                bootcssVer:3,
            }).on('changeDate', book_query);
	    function book_query(e) {
	         CHOOSE_DATE=e.date.yuan("yyyy-MM-dd");
	         location.href="/meetroom/user/main.action?book_date="+CHOOSE_DATE;
	    }
	
	
		//导航变色
		$(".daohang").eq(0).css("background-color","#999");
		
	</script>
  	</body>
</html>
