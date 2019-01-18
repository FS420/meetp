<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>已经参加的会议</title>
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
				<a href="${path}/meeting/meeting_needJoin.jsp">会议查看</a>
			</div>
			<div class="usermanage_daohang">
				<a href="${path}/meeting/meeting_alreadyJoin.jsp">已经参加会议</a>
			</div>
		</div>		
		
		<div class="source_dg">
			<table id="dg"></table>
		</div>
		
		<script>
			// 跳转到下载的页面
			function downloadUI(meetid){
				window.location.href = "${path}/meeting/downloadUI.action?meetid="+meetid;
			}
			// 是否参加
			function isJoin(that,meetid){  	//meeting的meetId
				//修改状态
				$.ajax({
	               url:"${path}/meeting/updateState.action",
	               data:{meetid:meetid,state:$(that).val()},
	               type:"post",
	               success:function(result){
						var cla="."+meetid; 
						var id="#"+meetid;               
	               		$(cla).addClass("hidden"); //【是否】隐藏
	               		if($(that).val()=="是"){
		               		if(result=="success-hold"){
		               			$(id).text("正常举行");
		               		}else if(result=="success-join"){
		               			$(id).text("本人参加(等待投票)");
		               		}
	               		}else{
	               			$(id).text("本人不参加(会议取消)");
	               		}
	               },
	               error:function(){
	            		alert("返回失败");   		
	               }
	            });
			}
			$("#dg").datagrid({    
		    		url:"${path}/meeting/selectPageUseDyc.action?flag=already&retime="+new Date().getTime(),    
		    		pageSize:10,     	  //初始化页面的大小
		    		fitColumns:true,	  //自动适应列的大小
		    		singleSelect:true,	  //只允许选择一行
		    		pageList:[5,10,20],	  //页面大小选择列表
		    		pagination:true,	  //显示工具栏
		    		pagePosition:"bottom",//工具栏的位置
		    		toolbar: [
		    		 		   {
								  iconCls: 'icon-add',
								  text:"增加",
								  handler: function(){
									 window.location.href="/meetroom/order/orderUI.action";
							      }
							   },
							   {
								  text:"<input id='search' type='text' name='keyWord'>",
							   }
							 ],
		    		
		    		columns:[[    
		        				{field:"name",title:"会议名称",width:150,align:"center"},    
		        				{field:"meetroomname",title:"地点",width:150,align:"center"}, 
		        				{field:"applicant",title:"申请人",width:150,align:"center"},	 
		        				{field:"recorder",title:"记录人",width:150,align:"center"},	 
		        				{field:"time",title:"开会时间",width:150,align:"center",
		        						formatter:function(value){
											var date=new Date(value);
											var year=date.getFullYear();
											var mon=date.getMonth()+1;
											var day=date.getDate();
											var hou=date.getHours();
											var min=date.getMinutes();
											var se=date.getSeconds();
											return year+"-"+mon+"-"+day+" "+hou+":"+min+":"+se; 
										}
		        				},
		        				{field:"endtime",title:"结束时间",width:150,align:"center",
		        						formatter:function(value){
											var date=new Date(value);
											var year=date.getFullYear();
											var mon=date.getMonth()+1;
											var day=date.getDate();
											var hou=date.getHours();
											var min=date.getMinutes();
											var se=date.getSeconds();
											return year+"-"+mon+"-"+day+" "+hou+":"+min+":"+se; 
										}
		        				},
		        				{field:"memo",title:"备注",width:150,align:"center"},
		        				{field:"state",title:"是否参加",width:150,align:"center",
		        						formatter:function(value,row,text){
											if(value==1){     //预参加状态（默认,让人有选择）
												return "<input type='button' class='"+row.meetid+"' onclick=\"isJoin(this,'"+row.meetid+"')\" value='是'/>"+"<span id='"+row.meetid+"'>/</span>"+
													   "<input type='button' class='"+row.meetid+"' onclick=\"isJoin(this,'"+row.meetid+"')\" value='否'/>"
											}else if(value==2){
												return "<span>本人参加(等待投票)</span>";
											}else if(value==0){
												return "<span>正常举行</span>";
											}else if(value==3){
												return "<span>本人不参加(会议取消)</span>";
											}else if(value==5){
												return "<span>有人不参加(会议取消)</span>";
											}else if(value==6){
												return "<span>申请者取消会议</span>";
											}else if(value==7){
												return "<span>已经参加</span>";
											}
										}
		        				},
		        				{	
									field : "meetid",
									title : "操作",
									width : 150,
									align : "center",
									formatter : function(value, row, text) {
										return "<button type='button' class='btn btn-outline-info' onclick=\"downloadUI('"+value+"')\">文档</button>";	
										//return "<button onclick=\"downloadUI('"+value+"')\">开会文档</button>";	
			 						}
								},
		    				]],
		 		});  
		 		
		 		
			   $("#search").searchbox({ 
					searcher:function(value,name){   // name是KeyWord
							
					   $("#dg").datagrid("load",{  //用之前的url去加载
							name: "%"+value+"%"    //name就是实体的属性，存到meeting中 ,不是存到page中的keyWord
					   });		
					}, 
					prompt:'请输入关键字' 
			   }); 
			//导航变色
			$(".daohang").eq(4).css("background-color","#999");
			//左边变色
			$(".usermanage_daohang").css("background-color","#A4968B");
		</script>
	</body>	
</html>
